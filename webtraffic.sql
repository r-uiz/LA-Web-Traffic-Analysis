-- Create a staging table
CREATE TABLE traffic_staging
LIKE traffic;

INSERT traffic_staging
SELECT *
FROM traffic
;

-- Standardize column names
ALTER TABLE traffic_staging
RENAME COLUMN `Date` TO `date`,
RENAME COLUMN `Device Category` TO `device_category`,
RENAME COLUMN `Browser` TO `browser`,
RENAME COLUMN `# of Visitors` TO `unique_visitors`,
RENAME COLUMN `Sessions` TO `sessions`,
RENAME COLUMN `Bounce Rate` TO `bounce_rate`;

-- Converting string dates to date format to facilitate date operations
UPDATE traffic_staging
SET date = STR_TO_DATE(`DATE`, '%Y-%m-%dT%H:%i:%s.%f')
;

ALTER TABLE traffic_staging
MODIFY COLUMN `DATE` DATE
;

-- Explore data, check data consistency
SELECT DISTINCT device_category
FROM traffic_staging
;

SELECT DISTINCT browser
FROM traffic_staging
ORDER BY browser
;  -- Noticed potential inconsistencies for manual review or cleaning

-- These values are typically the same browsers.
SELECT DISTINCT browser
FROM traffic_staging
WHERE browser LIKE '%Firefox%'
OR browser LIKE '%Mozilla%'
;

-- Check what devices use Mozilla to see difference with Firefox
SELECT DISTINCT device_category
FROM traffic_staging
WHERE browser LIKE '%Mozilla%'
;

SELECT DISTINCT device_category
FROM traffic_staging
WHERE browser LIKE '%Firefox%'
;

-- Mozilla and Firefox, typically is considered the same browser. I would ask first if these should be considered the same; for now, let's keep these separate and only clean up some explicit formatting issues in this column

SELECT DISTINCT browser
FROM traffic_staging
WHERE browser LIKE '%Mozilla%'
;

/*Mozilla Compatible Agent is not declared the same as Mozilla ask per research

(I would personally ask first regarding these Mozilla/Firefox
[or any other same-product value like Opera/Opera Mini, Playstation 3/Playstation 4, Safari/Safari (in-app)]
from the project lead before combining any values),
so let's keep this as is and only clean up explicit formatting issues with leading quotations
*/

UPDATE traffic_staging
SET browser = 'Mozilla'
WHERE browser LIKE '%Mozilla'
;

-- Handle undefined values
UPDATE traffic_staging
SET browser = NULL
WHERE browser = '(not set)'
;

-- Calculating the count of null values across important columns to ensure data quality
SELECT COUNT(*) null_count
FROM traffic_staging
WHERE
	`date` IS NULL OR
	device_category IS NULL OR
	unique_visitors IS NULL OR
	sessions IS NULL OR
	bounce_rate IS NULL
;

-- Review changes
SELECT DISTINCT browser
FROM traffic_staging
ORDER BY browser
;

-- Final data review before analysis or reporting
SELECT
	MIN(`date`) AS start_date,
	MAX(`date`) AS end_date,
	COUNT(DISTINCT device_category) AS device_count,
	count(DISTINCT browser) AS browser_count,
	MIN(unique_visitors) AS min_visitors,
	MAX(unique_visitors) AS max_visitors,
	MIN(sessions) AS min_sessions,
	MAX(sessions) AS max_sessions,
	MIN(bounce_rate) AS min_bounce,
	MAX(bounce_rate) AS max_bounce
FROM traffic_staging
;

SELECT *
FROM traffic_staging
;

-- Ready for further exploration and visualization
