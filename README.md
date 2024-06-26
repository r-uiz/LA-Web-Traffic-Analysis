# LA Web Traffic Analysis

[![Tableau Dashboard](dashboard.png)](https://public.tableau.com/app/profile/ruiz/viz/LAcity_orgWebTraffic/LAcity_orgWebTrafficDashboard?publish=yes)

## Project Objectives | Business Questions

- Which device category brings the most sessions?
- Which device category has the highest bounce rate?
- What is the high-level overview for each browser used to access the site?
- How does user traffic vary between weekdays and weekends?
- When were the peak months for web traffic?

## Summary of Insights

- The site has more traffic on weekdays than weekends.
- The Desktop device category brings the most sessions, bringing in 66% of total sessions. Then mobile, then tablet.
- The leading browser for desktops is Chrome. For mobile and tablets, it's Safari.
- Mobile has the highest bounce rate, with it being ~6% higher than desktop, ~5% higher than tablet.
- With Mobile having the highest bounce rate, the default mobile browsers (Safari (in-app) and Android Browser) tend to have a higher bounce rate as well.
- There is a steady decline in traffic over the last 2 years of the dataset, with a visible spike in December 2017.

## Recommendations

I would then present these findings and recommendations to the relevant departments (IT, Marketing, etc.).

- It would be more beneficial to focus on weekday campaigns, as the site has more traffic on weekdays. Web optimizations should be done on weekends since the site has considerably less traffic on weekends.
- Desktop development should be prioritized, as it brings in the most sessions. The relevant top browsers should be prioritized for compatibility and performance as well. Then mobile and tablet development can follow.
- The mobile home page/general page navigation should be improved to reduce the bounce rate. This can also be improved through UX research and testing.
- As per my research, the December 2017 spike in traffic could've been caused by the multiple wildfires that occurred in California during that time. It would be beneficial to have a crisis communication plan in place for such events to get information out to the public as efficiently as possible. At this point as well, mobile users seem to be as active as desktop users coming in at 46%. This shows how important it is to have a better mobile experience for users.
- The decline in traffic over 2017-2019 could be due to a variety of reasons. It would be beneficial to conduct a user survey to understand why users are visiting the site less. This can help in improving the site and what it offers.

# General Information

The [original dataset is available here](https://www.kaggle.com/datasets/cityofLA/lacity.org-website-traffic/data). It contains data for unique visitors, total sessions, and bounce rate for lacity.org, the main website for the City of Los Angeles over the years of 2014-2019. I did some data cleaning and transformation in SQL to create the dataset used in this analysis. [You can view the SQL script here](webtraffic.sql). It was then visualized in Tableau.

Check out the [LAcity.org Web Traffic - Tableau Dashboard](https://public.tableau.com/app/profile/ruiz/viz/LAcity_orgWebTraffic/LAcity_orgWebTrafficDashboard?publish=yes).

For more about my projects and data journey, visit my [Portfolio](https://www.notion.so/ruizdelcarmen/Ruiz-del-Carmen-Data-Portfolio-e725748d0e0546c386be6c6c7dc49099).