# Google Analytics 360

# What does this Looker Block do for me?

For GA 360 users, this block allows you to move beyond the standard reports offered in the Google UI. There are often limitations in what you can control in the UI limiting your ability to better understand how you can improve your overall web experience.

Within this block we mirror a lot of the high level dashboards you see in your existing GA 360 UI by looking at an Overview, Behavior, Audiences, and Acquisition. You can further slice and dice these reports by user segment data or by custom goals you have defined to derive additional insights.

Garner additional insights by using the custom goals dashboard to be able to define your goals on the fly and to be able to see how these goals trend historically over time rather than being limited in your ability to see them in their arrears.

Better understand your customers by looking at their natural pathing through pages and events through your pages alongside the ability to create completely custom page and event paths to conduct any A/B testing to see how customers are trending.

You can look at the successes of your marketing campaigns as well by using the campaign impact dashboard to identify a specific cohort of customers you targeted with a campaign and seeing how that particular customer base has trended over time to see if the campaign had any effect.

Leverage advanced analytics to be able to predict which customers are likely to make another purchase in the future based off of their historical actions. This leverages the out of the box BQML capabilities of BigQuery that you can read up on [here](https://cloud.google.com/bigquery-ml/docs/getting-started)

Usable / Shareable Dashboards - create centralized dashboards for the entire team, and departmental or individual dashboards for each user, and rest easy knowing everyone is looking at the same information at all times. Then schedule the dashboard for emails or alerts, campaign-end reporting, or whatever else serves your use-case.
Google Analytics Premium Data Structure

Google Analytics Premium (GA360) data is exported (in this case, through [Transfer Services](https://cloud.google.com/bigquery/transfer/) in the format of a single flat table with a new entry for each session. Rather than creating new tables for each entity attribute, Google places aggregate or attribute information in nested fields in the single table.

For more information on Nested Fields, and why Google chooses to use them, please refer to this overview on Why [Nesting is so Cool](https://discourse.looker.com/t/why-nesting-is-so-cool/4182).

Google's documentation on the data included in the export can be found [here](https://support.google.com/analytics/answer/3437719?hl=en).

You can also find a cookbook of SQL queries for common questions in [Google's documentation](https://support.google.com/analytics/answer/4419694?hl=en&ref_topic=3416089#query6_SequenceOfHits)


# Block Structure
Core project: block-ga360 is the read-only project where the block’s base Explores, views, and dashboards are defined. The core project’s initial views and Explores are defined in the core project and extended in the config project, where they can be modified. Then the config project and its files are imported into the core project. Finally, the core project defines the block’s content layer, or the dashboards and Explores that are surfaced in the Looker UI.

Config project: block-ga360-config is the project that can be modified by LookML developers. This project extends the core project. Its files are also imported into the core project and extended in the core project’s content layer, so that changes made to files in the config project are brought into the core project. You can read more about customizing the block here.

One thing we have taken into account when building this block is the different levels of aggregations between users, sessions, and hits. We have made sure that all of the metrics shown in the explore section can be grouped by these differing levels of aggregation without fanning out the numbers.

Within the Google Analytics folder we have organized them into the GA 360 tables along with completely custom views that we have generated within the block as well.

Our main table is the ga_sessions table which extends the geonetwork, totals, traffic_source, device, calendar, and custom_navigation_buttons. Because these are all non-repeated nested records we did not need to UNNEST them to access their fields whereas the hits table is a repeated record table that requires it to be unnested. Therefore you can still access the fields from these other tables even though they are not joined in through the extends.
Custom Views

We have created a few tables to enable you to move beyond what is available in the GA UI. The event and page fact and funnel tables allow you to create your custom pathing within the dashboards.
The goals view is what allows you to be able to view the custom goals over a historical period of time. If you do want to bake any of these goals into the model as a field you can reference the ga_sessions_config table where we have created some sample goals you can create.

BQML model consists of two main files user_facts along with the predictions table. Note you need have over 1 year of data to be able to leverage the model.

  The user_facts table is where we are creating an input table for our model that identifies customers who have made a purchase alongside other common factors associated with that user that we can use in our predictive model.

  The predictions table is then generating a training and testing dataset that looks at customers from the past 13 months for a 12 month period as an input to train our model while the future input table which scans the past 30 days is then used to generate scores for our users based on their based 30 days of activities.

# Customizations

The manifest file contains quite a few different fields that you can alter mostly centered around cost-saving mechanisms.

  The PDT date filter allows you to determine the date ranges that the PDTs will be built out against in the model

  The explore date filter is the default date range your business users will see applied to their queries in the explore when they first land inside of it, but they can change these values beyond what you set by default so it is always important to warn your business  users of the costs that they might incur.

Multiple Properties / Websites: If you have more than one website (property), you can choose to view all websites at the same time rather than viewing them one at a time.

  In the ga_sessions_config file you can uncomment the sql_table_name that unions your multiple properties together and comment out the existing sql_table_name that only takes one property into account by default

Custom dimensions and variables can be defined in the custom dimensions and custom variables table respectively. This allows you to generate actual dimensions off of the custom fields inside of your GA UI. We have included samples of how you can start to define custom dimensions and variables to be included within your explore environment.

Goal configured in Google Analytics Console are not natively exported into the BigQuery datasets. Similar to custom segments, we can recreate this logic in LookML, which allows for even greater flexibility, sophisticated analysis, and seamless shareability across all users. Examples of these goals are included in the ga_sessions_config table

Google Analytics provides great, out-of-the-box capabilities to create user segments based on up to 5 dimensions (e.g. demographic info, referral path, etc.). While these custom user segments are not exported to the GA data set natively, it's easier, and more flexible, to recreate these segments in Looker. Simply create a dimension using a Case When statement, including all of the dimensions you'd like to filter on. Alternatively, you can create a filtered measure instead. Plus, you can include as many filters as you'd like to really hone in on specific user cohorts. Your assigned looker analyst or support chat can help you build in this logic if you get confused.

# Notes and Other Known Issues

Data Discrepency in User Count Between GA UI and GA in BQ - The user count between the GA UI and the data exported to BQ will always have an expected 1-2% discrepency. This is because, the Google Analytics UI estimates the total number of users using a specific user counting algorithm for all reports except unsampled reports, whereas a proper BigQuery user count query which counts distinct fullVisitorIds will literally count all unique fullVisitorIds. Hence there can be up to a 2% discrepancy between the Google Analytics UI and BigQuery export. However, if the discrepancy is more than that, then you should contact your GA360 support Agency.

Data Discrepency in Session Count Between GA UI and GA in BQ - In the GA UI, sessions are only counted if they contain an interaction hit. If the hit is set to non-interaction=true, then it wouldn’t initiate a session to be captured for GA. However, in BigQuery we get all the hit level data. Therefore, we can get all those hits where non-interaction=true. Now, in order to compare the total sessions between GA and BigQuery, we need to check all the sessions with interaction hits. That’s the reason, we’ve included this condition.

# Coming Soon
Looker will offer an out of the box data action to enable you to push data back into your GA console.

  You can start to create custom dimensions within the GA UI to identify cohorts to retarget via your other GMP products
