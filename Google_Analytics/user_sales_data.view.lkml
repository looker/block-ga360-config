view: user_sales_data {
  sql_table_name: `looker-private-demo.google_gmp_customer_match.transaction_users` ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: full_visitor_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.fullVisitorID ;;
  }

  dimension: users_age {
    type: number
    sql: ${TABLE}.users_age ;;
  }

  dimension: users_city {
    type: string
    sql: ${TABLE}.users_city ;;
  }

  dimension: users_country {
    type: string
    sql: ${TABLE}.users_country ;;
  }

  dimension: users_email {
    type: string
    sql: ${TABLE}.users_email ;;
  }

  dimension: users_first_name {
    type: string
    sql: ${TABLE}.users_first_name ;;
  }

  dimension: users_gender {
    type: string
    sql: ${TABLE}.users_gender ;;
  }

  dimension: users_id {
    type: number
    sql: ${TABLE}.users_id ;;
  }

  dimension: users_last_name {
    type: string
    sql: ${TABLE}.users_last_name ;;
  }

  dimension: users_latitude {
    type: number
    sql: ${TABLE}.users_latitude ;;
  }

  dimension: users_longitude {
    type: number
    sql: ${TABLE}.users_longitude ;;
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}.users_state ;;
  }

  dimension: users_zip {
    type: string
    sql: ${TABLE}.users_zip ;;
  }

  dimension: customer_ltv {
    type: number
    sql: ${TABLE}.customer_LTV ;;
  }

  dimension: total_items_purchased {
    type: number
    sql: ${TABLE}.total_items_purchased ;;
  }

  dimension: sales_by_category {
    # hidden: yes
    type: string
    sql: ${TABLE}.sales_by_category ;;
  }

  dimension: user_key {
    type: number
    sql: ${TABLE}.user_key ;;
  }

  set: detail {
    fields: [
      full_visitor_id,
      users_age,
      users_city,
      users_country,
      users_email,
      users_first_name,
      users_gender,
      users_id,
      users_last_name,
      users_latitude,
      users_longitude,
      users_state,
      users_zip,
      customer_ltv,
      total_items_purchased,
      user_key
    ]
  }
}

#unnested view
view: sales__by__category {
  dimension: category {
    type: string
  }
  dimension: total_revenue {
    type: number
    value_format: "$0.00"
  }
}
