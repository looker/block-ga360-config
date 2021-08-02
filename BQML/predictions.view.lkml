view: training_input_config {
  extends: [training_input_core]
  extension: required
  derived_table: {
    sql:   WITH filtered_base AS (
        SELECT * FROM ${ga_sessions.SQL_TABLE_NAME}
        WHERE TIMESTAMP(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'\d\d\d\d\d\d\d\d')))  BETWEEN ((TIMESTAMP_ADD(TIMESTAMP_TRUNC( CURRENT_TIMESTAMP(), DAY), INTERVAL -1500 DAY))) AND ((TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -1500 DAY), INTERVAL 200 DAY)))),
      -- labeling customers who have made a purchase as a 1 and customers who have not made a purchas as a 0
    user_label AS (
      SELECT fullvisitorId, max(case when totals.transactions >= 1 then 1 else 0 end) as label, max(case when totals.transactions >= 1 then visitStartTime end) as event_session
        FROM filtered_base
        GROUP BY fullvisitorId),
      -- finding the most common hour of day for each user within the time period
    unique_hour_of_day AS(
      (SELECT   ga_sessions_visit_start_hour_of_day, fullvisitorId FROM (SELECT ROW_NUMBER () OVER(PARTITION BY fullvisitorId ORDER BY   pageviews) as row_number, fullvisitorId, ga_sessions_visit_start_hour_of_day
      FROM (SELECT ga_sessions.fullvisitorId as fullvisitorId, EXTRACT(HOUR FROM TIMESTAMP_SECONDS(ga_sessions.visitStarttime)) AS ga_sessions_visit_start_hour_of_day, SUM(ga_sessions.totals.pageviews) as pageviews
      FROM filtered_base  AS ga_sessions  LEFT JOIN user_label ON ga_sessions.fullvisitorId = user_label.fullvisitorId  WHERE (  (ga_sessions.visitStartTime < IFNULL(event_session, 0)   or event_session is null) )  GROUP BY 1,2)) WHERE row_number = 1)),
      -- findiing the most common metro for the user within the time period
      unique_dma AS(
      (SELECT   metro, fullvisitorId FROM (SELECT ROW_NUMBER () OVER(PARTITION BY fullvisitorId ORDER BY   pageviews) as row_number, fullvisitorId, metro
      FROM (SELECT ga_sessions.fullvisitorId as fullvisitorId, ga_sessions.geoNetwork.metro as metro , SUM(ga_sessions.totals.pageviews) as pageviews
      FROM filtered_base  AS ga_sessions LEFT JOIN user_label ON ga_sessions.fullvisitorId = user_label.fullvisitorId WHERE (  (ga_sessions.visitStartTime < IFNULL(event_session, 0)   or event_session is null) )  GROUP BY 1,2)) WHERE row_number = 1)),
      -- finding the most common day of week for the user within the time period
      unique_day_of_week AS(
      (SELECT   ga_sessions_visit_start_day_of_week, fullvisitorId FROM (SELECT ROW_NUMBER () OVER(PARTITION BY fullvisitorId ORDER BY   pageviews) as row_number, fullvisitorId, ga_sessions_visit_start_day_of_week
      FROM (SELECT ga_sessions.fullvisitorId as fullvisitorId, FORMAT_TIMESTAMP('%A', TIMESTAMP_SECONDS(ga_sessions.visitStarttime)) AS ga_sessions_visit_start_day_of_week  , SUM(ga_sessions.totals.pageviews) as pageviews
      FROM filtered_base  AS ga_sessions LEFT JOIN user_label ON ga_sessions.fullvisitorId = user_label.fullvisitorId  WHERE (  (ga_sessions.visitStartTime < IFNULL(event_session, 0)   or event_session is null) ) GROUP BY 1,2)) WHERE row_number = 1)),
    -- defining aggregated metrics on a per user level and defining their browser and source medium
      agg_metrics AS (  SELECT  ga_sessions.fullvisitorId, count(distinct visitId) as total_sessions,
        sum(totals.pageviews) as pageviews,
        count(totals.bounces)/count(distinct VisitID) as bounce_rate,
        sum(totals.pageviews) / count(distinct VisitID) as avg_session_depth,
        count(distinct geoNetwork.metro) as distinct_dmas,
        count(distinct EXTRACT(DAYOFWEEK FROM PARSE_DATE('%Y%m%d', date))) as num_diff_days_visited,
  max(case when device.isMobile is True then 1 else 0 end) as mobile,
   max(case when device.browser = 'Chrome' then 1 else 0 end) as chrome,
   max(case when device.browser like  '%Safari%' then 1 else 0 end) as safari,
   max(case when device.browser <> 'Chrome' and device.browser not like '%Safari%' then 1 else 0 end) as browser_other,
        sum(case when trafficSource.medium = '(none)' then 1 else 0 end) as visits_traffic_source_none,
    sum(case when trafficSource.medium = 'organic' then 1 else 0 end) as visits_traffic_source_organic,
    sum(case when trafficSource.medium = 'cpc' then 1 else 0 end) as visits_traffic_source_cpc,
    sum(case when trafficSource.medium = 'cpm' then 1 else 0 end) as visits_traffic_source_cpm,
    sum(case when trafficSource.medium = 'affiliate' then 1 else 0 end) as visits_traffic_source_affiliate,
    sum(case when trafficSource.medium = 'referral' then 1 else 0 end) as visits_traffic_source_referral
        FROM filtered_base  AS ga_sessions LEFT JOIN user_label ON ga_sessions.fullvisitorId = user_label.fullvisitorId
        WHERE (  (ga_sessions.visitStartTime < IFNULL(event_session, 0)   or event_session is null) )   GROUP BY 1 )


      SELECT user_label.fullvisitorId, label,ga_sessions_visit_start_hour_of_day, metro, ga_sessions_visit_start_day_of_week,
      total_sessions, pageviews, bounce_rate, avg_session_depth, visits_traffic_source_none, visits_traffic_source_organic, visits_traffic_source_cpc,  visits_traffic_source_cpm, visits_traffic_source_affiliate,
      visits_traffic_source_referral, distinct_dmas, mobile, chrome, safari, browser_other
      FROM user_label
      LEFT JOIN unique_hour_of_day ON user_label.fullvisitorId = unique_hour_of_day.fullvisitorId
      LEFT JOIN unique_dma ON user_label.fullvisitorId = unique_dma.fullvisitorId
      LEFT JOIN unique_day_of_week ON user_label.fullvisitorId = unique_day_of_week.fullvisitorId
      LEFT JOIN agg_metrics ON agg_metrics.fullvisitorId = user_label.fullvisitorId
       ;;
  }
}

view: testing_input_config {
  extends: [testing_input_core]
  extension: required
  derived_table: {
    sql:   WITH filtered_base AS (
        SELECT * FROM ${ga_sessions.SQL_TABLE_NAME}
        WHERE TIMESTAMP(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'\d\d\d\d\d\d\d\d')))  BETWEEN ((TIMESTAMP_ADD(TIMESTAMP_TRUNC( CURRENT_TIMESTAMP(), DAY), INTERVAL -1500 DAY))) AND ((TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -1500 DAY), INTERVAL 200 DAY)))),
      -- labeling customers who have made a purchase as a 1 and customers who have not made a purchas as a 0
    user_label AS (
      SELECT fullvisitorId, max(case when totals.transactions >= 1 then 1 else 0 end) as label, max(case when totals.transactions >= 1 then visitStartTime end) as event_session
        FROM filtered_base
        GROUP BY fullvisitorId),
      -- finding the most common hour of day for each user within the time period
    unique_hour_of_day AS(
      (SELECT   ga_sessions_visit_start_hour_of_day, fullvisitorId FROM (SELECT ROW_NUMBER () OVER(PARTITION BY fullvisitorId ORDER BY   pageviews) as row_number, fullvisitorId, ga_sessions_visit_start_hour_of_day
      FROM (SELECT ga_sessions.fullvisitorId as fullvisitorId, EXTRACT(HOUR FROM TIMESTAMP_SECONDS(ga_sessions.visitStarttime)) AS ga_sessions_visit_start_hour_of_day, SUM(ga_sessions.totals.pageviews) as pageviews
      FROM filtered_base  AS ga_sessions  LEFT JOIN user_label ON ga_sessions.fullvisitorId = user_label.fullvisitorId  WHERE (  (ga_sessions.visitStartTime < IFNULL(event_session, 0)   or event_session is null) )  GROUP BY 1,2)) WHERE row_number = 1)),
      -- findiing the most common metro for the user within the time period
      unique_dma AS(
      (SELECT   metro, fullvisitorId FROM (SELECT ROW_NUMBER () OVER(PARTITION BY fullvisitorId ORDER BY   pageviews) as row_number, fullvisitorId, metro
      FROM (SELECT ga_sessions.fullvisitorId as fullvisitorId, ga_sessions.geoNetwork.metro as metro , SUM(ga_sessions.totals.pageviews) as pageviews
      FROM filtered_base  AS ga_sessions LEFT JOIN user_label ON ga_sessions.fullvisitorId = user_label.fullvisitorId WHERE (  (ga_sessions.visitStartTime < IFNULL(event_session, 0)   or event_session is null) )  GROUP BY 1,2)) WHERE row_number = 1)),
      -- finding the most common day of week for the user within the time period
      unique_day_of_week AS(
      (SELECT   ga_sessions_visit_start_day_of_week, fullvisitorId FROM (SELECT ROW_NUMBER () OVER(PARTITION BY fullvisitorId ORDER BY   pageviews) as row_number, fullvisitorId, ga_sessions_visit_start_day_of_week
      FROM (SELECT ga_sessions.fullvisitorId as fullvisitorId, FORMAT_TIMESTAMP('%A', TIMESTAMP_SECONDS(ga_sessions.visitStarttime)) AS ga_sessions_visit_start_day_of_week  , SUM(ga_sessions.totals.pageviews) as pageviews
      FROM filtered_base  AS ga_sessions LEFT JOIN user_label ON ga_sessions.fullvisitorId = user_label.fullvisitorId  WHERE (  (ga_sessions.visitStartTime < IFNULL(event_session, 0)   or event_session is null) ) GROUP BY 1,2)) WHERE row_number = 1)),
    -- defining aggregated metrics on a per user level and defining their browser and source medium
      agg_metrics AS (  SELECT  ga_sessions.fullvisitorId, count(distinct visitId) as total_sessions,
        sum(totals.pageviews) as pageviews,
        count(totals.bounces)/count(distinct VisitID) as bounce_rate,
        sum(totals.pageviews) / count(distinct VisitID) as avg_session_depth,
        count(distinct geoNetwork.metro) as distinct_dmas,
        count(distinct EXTRACT(DAYOFWEEK FROM PARSE_DATE('%Y%m%d', date))) as num_diff_days_visited,
  max(case when device.isMobile is True then 1 else 0 end) as mobile,
   max(case when device.browser = 'Chrome' then 1 else 0 end) as chrome,
   max(case when device.browser like  '%Safari%' then 1 else 0 end) as safari,
   max(case when device.browser <> 'Chrome' and device.browser not like '%Safari%' then 1 else 0 end) as browser_other,
        sum(case when trafficSource.medium = '(none)' then 1 else 0 end) as visits_traffic_source_none,
    sum(case when trafficSource.medium = 'organic' then 1 else 0 end) as visits_traffic_source_organic,
    sum(case when trafficSource.medium = 'cpc' then 1 else 0 end) as visits_traffic_source_cpc,
    sum(case when trafficSource.medium = 'cpm' then 1 else 0 end) as visits_traffic_source_cpm,
    sum(case when trafficSource.medium = 'affiliate' then 1 else 0 end) as visits_traffic_source_affiliate,
    sum(case when trafficSource.medium = 'referral' then 1 else 0 end) as visits_traffic_source_referral
        FROM filtered_base  AS ga_sessions LEFT JOIN user_label ON ga_sessions.fullvisitorId = user_label.fullvisitorId
        WHERE (  (ga_sessions.visitStartTime < IFNULL(event_session, 0)   or event_session is null) )   GROUP BY 1 )


      SELECT user_label.fullvisitorId, label,ga_sessions_visit_start_hour_of_day, metro, ga_sessions_visit_start_day_of_week,
      total_sessions, pageviews, bounce_rate, avg_session_depth, visits_traffic_source_none, visits_traffic_source_organic, visits_traffic_source_cpc,  visits_traffic_source_cpm, visits_traffic_source_affiliate,
      visits_traffic_source_referral, distinct_dmas, mobile, chrome, safari, browser_other
      FROM user_label
      LEFT JOIN unique_hour_of_day ON user_label.fullvisitorId = unique_hour_of_day.fullvisitorId
      LEFT JOIN unique_dma ON user_label.fullvisitorId = unique_dma.fullvisitorId
      LEFT JOIN unique_day_of_week ON user_label.fullvisitorId = unique_day_of_week.fullvisitorId
      LEFT JOIN agg_metrics ON agg_metrics.fullvisitorId = user_label.fullvisitorId
       ;;
  }
}
view: future_purchase_model_config {
  extends: [future_purchase_model_core]
  extension: required
  derived_table: {
    datagroup_trigger: bqml_datagroup
    sql_create:
    CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
    OPTIONS(model_type='logistic_reg'
    , labels=['label']
    , L1_REG = 1
    , DATA_SPLIT_METHOD = 'RANDOM'
    , DATA_SPLIT_EVAL_FRACTION = 0.20
    --, CLASS_WEIGHTS=[('1',1), ('0',0.05)] -- Consider adding class weights or downsampling if you have imbalanced classes
    ) AS
    SELECT
    * EXCEPT(fullvisitorId)
    FROM ${training_input.SQL_TABLE_NAME};;
  }
}

view: future_purchase_model_evaluation_config {
  extends: [future_purchase_model_evaluation_core]
  extension: required
  # Add view customizations here
}


view: roc_curve_config {
  extends: [roc_curve_core]
  extension: required
  # Add view customizations here
}

view: future_purchase_model_training_info_config {
  extends: [future_purchase_model_training_info_core]
  extension: required
  # Add view customizations here
}

view: future_input_config {
  extends: [future_input_core]
  extension: required
  derived_table: {
    sql:   WITH filtered_base AS (
        SELECT * FROM ${ga_sessions.SQL_TABLE_NAME}
        WHERE TIMESTAMP(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'\d\d\d\d\d\d\d\d')))  BETWEEN ((TIMESTAMP_ADD(TIMESTAMP_TRUNC( CURRENT_TIMESTAMP(), DAY), INTERVAL -1500 DAY))) AND ((TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), INTERVAL -1500 DAY), INTERVAL 200 DAY)))),
      -- labeling customers who have made a purchase as a 1 and customers who have not made a purchas as a 0
    user_label AS (
      SELECT fullvisitorId, max(case when totals.transactions >= 1 then 1 else 0 end) as label, max(case when totals.transactions >= 1 then visitStartTime end) as event_session
        FROM filtered_base
        GROUP BY fullvisitorId),
      -- finding the most common hour of day for each user within the time period
    unique_hour_of_day AS(
      (SELECT   ga_sessions_visit_start_hour_of_day, fullvisitorId FROM (SELECT ROW_NUMBER () OVER(PARTITION BY fullvisitorId ORDER BY   pageviews) as row_number, fullvisitorId, ga_sessions_visit_start_hour_of_day
      FROM (SELECT ga_sessions.fullvisitorId as fullvisitorId, EXTRACT(HOUR FROM TIMESTAMP_SECONDS(ga_sessions.visitStarttime)) AS ga_sessions_visit_start_hour_of_day, SUM(ga_sessions.totals.pageviews) as pageviews
      FROM filtered_base  AS ga_sessions  LEFT JOIN user_label ON ga_sessions.fullvisitorId = user_label.fullvisitorId  WHERE (  (ga_sessions.visitStartTime < IFNULL(event_session, 0)   or event_session is null) )  GROUP BY 1,2)) WHERE row_number = 1)),
      -- findiing the most common metro for the user within the time period
      unique_dma AS(
      (SELECT   metro, fullvisitorId FROM (SELECT ROW_NUMBER () OVER(PARTITION BY fullvisitorId ORDER BY   pageviews) as row_number, fullvisitorId, metro
      FROM (SELECT ga_sessions.fullvisitorId as fullvisitorId, ga_sessions.geoNetwork.metro as metro , SUM(ga_sessions.totals.pageviews) as pageviews
      FROM filtered_base  AS ga_sessions LEFT JOIN user_label ON ga_sessions.fullvisitorId = user_label.fullvisitorId WHERE (  (ga_sessions.visitStartTime < IFNULL(event_session, 0)   or event_session is null) )  GROUP BY 1,2)) WHERE row_number = 1)),
      -- finding the most common day of week for the user within the time period
      unique_day_of_week AS(
      (SELECT   ga_sessions_visit_start_day_of_week, fullvisitorId FROM (SELECT ROW_NUMBER () OVER(PARTITION BY fullvisitorId ORDER BY   pageviews) as row_number, fullvisitorId, ga_sessions_visit_start_day_of_week
      FROM (SELECT ga_sessions.fullvisitorId as fullvisitorId, FORMAT_TIMESTAMP('%A', TIMESTAMP_SECONDS(ga_sessions.visitStarttime)) AS ga_sessions_visit_start_day_of_week  , SUM(ga_sessions.totals.pageviews) as pageviews
      FROM filtered_base  AS ga_sessions LEFT JOIN user_label ON ga_sessions.fullvisitorId = user_label.fullvisitorId  WHERE (  (ga_sessions.visitStartTime < IFNULL(event_session, 0)   or event_session is null) ) GROUP BY 1,2)) WHERE row_number = 1)),
    -- defining aggregated metrics on a per user level and defining their browser and source medium
      agg_metrics AS (  SELECT  ga_sessions.fullvisitorId, count(distinct visitId) as total_sessions,
        sum(totals.pageviews) as pageviews,
        count(totals.bounces)/count(distinct VisitID) as bounce_rate,
        sum(totals.pageviews) / count(distinct VisitID) as avg_session_depth,
        count(distinct geoNetwork.metro) as distinct_dmas,
        count(distinct EXTRACT(DAYOFWEEK FROM PARSE_DATE('%Y%m%d', date))) as num_diff_days_visited,
  max(case when device.isMobile is True then 1 else 0 end) as mobile,
   max(case when device.browser = 'Chrome' then 1 else 0 end) as chrome,
   max(case when device.browser like  '%Safari%' then 1 else 0 end) as safari,
   max(case when device.browser <> 'Chrome' and device.browser not like '%Safari%' then 1 else 0 end) as browser_other,
        sum(case when trafficSource.medium = '(none)' then 1 else 0 end) as visits_traffic_source_none,
    sum(case when trafficSource.medium = 'organic' then 1 else 0 end) as visits_traffic_source_organic,
    sum(case when trafficSource.medium = 'cpc' then 1 else 0 end) as visits_traffic_source_cpc,
    sum(case when trafficSource.medium = 'cpm' then 1 else 0 end) as visits_traffic_source_cpm,
    sum(case when trafficSource.medium = 'affiliate' then 1 else 0 end) as visits_traffic_source_affiliate,
    sum(case when trafficSource.medium = 'referral' then 1 else 0 end) as visits_traffic_source_referral
        FROM filtered_base  AS ga_sessions LEFT JOIN user_label ON ga_sessions.fullvisitorId = user_label.fullvisitorId
        WHERE (  (ga_sessions.visitStartTime < IFNULL(event_session, 0)   or event_session is null) )   GROUP BY 1 )


      SELECT user_label.fullvisitorId, label,ga_sessions_visit_start_hour_of_day, metro, ga_sessions_visit_start_day_of_week,
      total_sessions, pageviews, bounce_rate, avg_session_depth, visits_traffic_source_none, visits_traffic_source_organic, visits_traffic_source_cpc,  visits_traffic_source_cpm, visits_traffic_source_affiliate,
      visits_traffic_source_referral, distinct_dmas, mobile, chrome, safari, browser_other
      FROM user_label
      LEFT JOIN unique_hour_of_day ON user_label.fullvisitorId = unique_hour_of_day.fullvisitorId
      LEFT JOIN unique_dma ON user_label.fullvisitorId = unique_dma.fullvisitorId
      LEFT JOIN unique_day_of_week ON user_label.fullvisitorId = unique_day_of_week.fullvisitorId
      LEFT JOIN agg_metrics ON agg_metrics.fullvisitorId = user_label.fullvisitorId
       ;;
  }

  dimension: full_visitor_id {
    type: string
    sql: ${TABLE}.fullvisitorId ;;
    primary_key: yes
  }

  dimension: client_id {
    type: string
    sql: CONCAT('1',CAST(LPAD(${full_visitor_id},9) AS STRING), '.',CAST(RPAD(REVERSE(${full_visitor_id}),10) AS STRING));;
    primary_key: no
  }
}

view: future_purchase_prediction_config {
  extends: [future_purchase_prediction_core]
  extension: required
  derived_table: {
    sql: SELECT fullvisitorId,
          pred.prob as user_propensity_score,
          NTILE(10) OVER (ORDER BY pred.prob DESC) as user_propensity_decile
        FROM ml.PREDICT(
          MODEL ${future_purchase_model.SQL_TABLE_NAME},
          (SELECT * FROM ${future_input.SQL_TABLE_NAME})),
        UNNEST(predicted_label_probs) as pred
        WHERE pred.label = 1
       ;;
  }
  dimension: full_visitor_id {
    type: string
    hidden: yes
    sql: TRIM(REPLACE(${TABLE}.fullvisitorId,',','')) ;;
  }

  dimension: user_propensity_score {
    type: number
    sql: ${TABLE}.user_propensity_score ;;
    value_format_name: decimal_2
  }
  dimension: user_propensity_decile {
    type: number
    sql: ${TABLE}.user_propensity_decile ;;
    value_format_name: decimal_2
  }

  measure: average_user_propensity_score {
    type: average
    sql: ${user_propensity_score} ;;
    value_format_name: decimal_2
    drill_fields: [future_input.client_id, user_propensity_score]
  }

  measure: median_user_propensity_score {
    type: median
    sql: ${user_propensity_score} ;;
    value_format_name: decimal_2
    drill_fields: [future_input.client_id, user_propensity_score]
  }
  measure: average_user_propensity_decile {
    type:  average
    sql:  ${user_propensity_decile} ;;
    value_format_name: decimal_2
    drill_fields: [future_input.client_id, user_propensity_score]
  }
}
