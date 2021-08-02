include: "/*/*.view.lkml"
include: "/Google_Analytics/Custom_Views/*.view.lkml"
connection: "looker-private-demo"

explore: ga_sessions_config {
  extends: [ga_sessions_core]
  extension: required
  # Add additional joins here
  join: user_sales_data {
    sql_on: ${user_sales_data.full_visitor_id} = ${ga_sessions.full_visitor_id} ;;
  }
  join: sales__by__category {
    sql: LEFT JOIN UNNEST(${user_sales_data.sales_by_category}) as sales__by__category;;
  }
}


explore: future_input_config {
  extends: [future_input_core]
  extension: required
  join: future_purchase_prediction {
    type: left_outer
    sql_on: ${future_input.full_visitor_id} = ${future_purchase_prediction.full_visitor_id} ;;
    relationship: one_to_one
  }
}
