


view: ga_sessions_config {
  extends: [ga_sessions_core]
  extension: required



# Scenario 1 (S1): You are viewing a single GA 360 property


# S1 TODO: Update the sql_table_name with the customer’s schema name.
# Single property
  sql_table_name: `@{SCHEMA_NAME}.@{GA360_TABLE_NAME}` ;;

  dimension_group: partition {
    # Date that is parsed from the table name. Required as a filter to avoid accidental massive queries
    label: ""
    view_label: "Session"
    description: "Date based on the day the session was added to the database. Matches date in Google Analytics UI, but may not match 'Session Start Date'."
    type: time
    timeframes: [
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      fiscal_quarter,
      fiscal_quarter_of_year,
      week,
      month,
      month_name,
      month_num,
      quarter,
      quarter_of_year,
      week_of_year,
      year
    ]
    sql: TIMESTAMP(
            PARSE_DATE(
              '%Y%m%d'
                , REGEXP_EXTRACT(
                  _TABLE_SUFFIX
                    , r'^\d\d\d\d\d\d\d\d'
                )
            )
          );;
    convert_tz: no
  }


# # Scenario 2 (S2): You are viewing Multiple  GA 360 properties in the same BQ project and are leveraging analytics across multiple properties
# #   TODO: update the always_filter in the model
# #   TODO: Uncomment the sql_table_name and update the FROM statement and property nickname
#   sql_table_name:
#   (
#     SELECT *, 'Property1' as property, TIMESTAMP(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'^\d\d\d\d\d\d\d\d'))) AS partition_date
#     FROM `@{SCHEMA_NAME}.@{GA360_TABLE_NAME}`
#     WHERE {% condition partition_filter %} TIMESTAMP(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'^\d\d\d\d\d\d\d\d'))) {% endcondition %}
#     UNION ALL
#     SELECT *, 'Property2' as property, TIMESTAMP(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'^\d\d\d\d\d\d\d\d'))) AS partition_date
#     FROM `@{SCHEMA_NAME}.@{GA360_TABLE_NAME}`
#     WHERE {% condition partition_filter %} TIMESTAMP(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'^\d\d\d\d\d\d\d\d'))) {% endcondition %}
#   );;


# # S2 TODO: Uncomment field
#   filter: partition_filter {
#     type: date
#     default_value: "@{EXPLORE_DATE_FILTER}"
#   }

# # S2 TODO: Uncomment field and comment out the partition date above
#   dimension_group: partition {
#     # Date that is parsed from the table name. Required as a filter to avoid accidental massive queries
#     label: ""
#     view_label: "Session"
#     description: "Date based on the day the session was added to the database. Matches date in Google Analytics UI, but may not match 'Session Start Date'."
#     type: time
#     timeframes: [
#       date,
#       day_of_week,
#       day_of_week_index,
#       day_of_month,
#       day_of_year,
#       fiscal_quarter,
#       fiscal_quarter_of_year,
#       week,
#       month,
#       month_name,
#       month_num,
#       quarter,
#       quarter_of_year,
#       week_of_year,
#       year
#     ]
#     sql: ${TABLE}.partition_date ;;
#     # can_filter: no
#     convert_tz: no
#   }

# # S2 TODO: Uncomment out the field and update the property and website names
#   dimension: property {
#     hidden: yes
#     suggestions: ["Website1","Website2"]
#     sql: CASE
#           WHEN ${TABLE}.property = "Property1" THEN "Website1"
#           WHEN ${TABLE}.property = "Property2" THEN "Website2"
#           ELSE NULL
#         END
#         ;;
#   }


# #Scenario 3 (S3): Multiple properties but allow specific users to view their own properties

# # S3 TODO: Create a user attribute ga_360_schema and assign values for each user.
        # Uncomment out the sql_table_name below

# # Single property
  # sql_table_name: `{{ _user_attributes['ga_360_schema'] }}.@{GA360_TABLE_NAME} ;;


# # TODO: CUSTOMIZE GOALS HERE ####

# # Goals measure how well your site or app fulfills your target objectives. A goal represents a completed activity,
# # called a conversion, that contributes to the success of your business. Examples of goals include making a purchase
# # (for an ecommerce site), completing a game level (for a mobile gaming app), or submitting a contact information
# # form (for a marketing or lead generation site).

# # Find more information here: https://support.google.com/analytics/answer/1012040?hl=en&ref_topic=6150889

# # "Selected_goal_conversions", "selected_goal_conversion_rate", and "selected_goal_conversion_value" are the
# # measures used in the application interface. Make sure that these measures contain all of the possible goals.
# # The goal will be selected using a filter in the Application UI.


  # goal definitions

  dimension: demo_goal_hit {
    type: yesno
    sql: (SELECT h.page.pagePath FROM UNNEST(${ga_sessions.hits}) h
      WHERE h.page.pagePath = "/asearch.html" LIMIT 1) IS NOT NULL ;;
  }

  # dimension: company_goal_hit {
  #   type: yesno
  #   sql: (SELECT h.page.pagePath FROM UNNEST(${ga_sessions.hits}) h
  #     WHERE h.page.pagePath = "/company" LIMIT 1) IS NOT NULL ;;
  # }

  # dimension: team_goal_hit {
  #   type: yesno
  #   sql: (SELECT h.page.pagePath FROM UNNEST(${ga_sessions.hits}) h
  #     WHERE h.page.pagePath = "/team" LIMIT 1) IS NOT NULL ;;
  # }


  # dimension: home_page_goal {
  #   type: yesno
  #   sql: (SELECT h.page.pagePath FROM UNNEST(${ga_sessions.hits}) h
  #     WHERE h.page.pagePath = "/goal" LIMIT 1) IS NOT NULL ;;
  # }

  # dimension: about_page_goal {
  #   type: yesno
  #   sql: (SELECT h.page.pagePath FROM UNNEST(${ga_sessions.hits}) h
  #     WHERE h.page.pagePath = "/about" LIMIT 1) IS NOT NULL ;;
  # }

  # dimension: conversion_value {
  #   sql: 100 ;;
  # }


  # value of goal

  # dimension: value_of_conversion {
  #   type: number
  #   hidden: yes
  #   sql: 100 ;;
  #   value_format_name: usd
  # }

  # # filter for goal completion to mark as converted

  # measure: demo_goal_conversions {
  #   group_label: "Goals"
  #   type: count
  #   filters: {
  #     field: demo_goal_hit
  #     value: "Yes"
  #   }
  # }

  # measure: company_goal_conversions {
  #   group_label: "Goals"
  #   type: count
  #   filters: {
  #     field: company_goal_hit
  #     value: "Yes"
  #   }
  # }

  # define conversion rate

  # measure: demo_goal_conversion_rate {
  #   description: "URL hits / Sessions"
  #   group_label: "Goals"
  #   type: number
  #   sql: 1.0 * (${demo_goal_conversions}/NULLIF(${ga_sessions.visits_total},0));;
  #   value_format_name: percent_2
  # }

  # measure: company_goal_conversion_rate {
  #   description: "URL hits / Sessions"
  #   group_label: "Goals"
  #   type: number
  #   sql: 1.0 * (${company_goal_conversions}/NULLIF(${ga_sessions.visits_total},0));;
  #   value_format_name: percent_2
  # }

  # measure: demo_goal_conversion_value {
  #   description: "URL Conversions * Value"
  #   group_label: "Goals"
  #   type: number
  #   sql: 1.0 * (${demo_goal_conversions}) * (${value_of_conversion});;
  #   value_format_name: usd
  # }

  # measure: company_goal_conversion_value {
  #   description: "URL Conversions * Value"
  #   group_label: "Goals"
  #   type: number
  #   sql: 1.0 * (${company_goal_conversions}) * (${value_of_conversion});;
  #   value_format_name: usd
  # }

  # TODO: you need to add all the goals here as well

  # parameter: goal_selection {
  #   type: string
  #   suggestions: ["No Selection","Demo","Company"]
  #   allowed_value: {value: "No Selection"}
  #   allowed_value: {value: "Demo"}
  #   allowed_value: {value: "Company"}
  #   default_value: "'No Selection'"
  # }

  # measure: selected_goal_conversions {
  #   type: number
  #   sql: {% if goal_selection._parameter_value == "'Demo'" %}${demo_goal_conversions}
  #         {% elsif goal_selection._parameter_value == "'Company'" %}${company_goal_conversions}
  #         {% elsif goal_selection._parameter_value == "'No Selection'" %}NULL
  #         {% endif %} ;;
  #   label_from_parameter: goal_selection
  #   value_format_name: decimal_0
  # }

  # measure: selected_goal_conversion_rate {
  #   type: number
  #   sql: {% if goal_selection._parameter_value == "'Demo'" %}${demo_goal_conversion_rate}
  #       {% elsif goal_selection._parameter_value == "'Company'" %}${company_goal_conversion_rate}
  #       {% elsif goal_selection._parameter_value == "'No Selection'" %}NULL
  #         {% endif %} ;;
  #   label_from_parameter: goal_selection
  #   value_format_name: percent_2
  # }

  # measure: selected_goal_conversion_value {
  #   type: number
  #   sql: {% if goal_selection._parameter_value == "'Demo'" %}${demo_goal_conversion_value}
  #       {% elsif goal_selection._parameter_value == "'Company'" %}${company_goal_conversion_value}
  #       {% elsif goal_selection._parameter_value == "'No Selection'" %}NULL
  #         {% endif %} ;;
  #   label_from_parameter: goal_selection
  #   value_format_name: usd
  # }



}
