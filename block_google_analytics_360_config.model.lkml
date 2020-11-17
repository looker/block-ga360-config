include: "/*/*.view.lkml"
include: "/Google_Analytics/Custom_Views/*.view.lkml"


explore: ga_sessions_config {
  extends: [ga_sessions_core]
  extension: required
  conditionally_filter: {
    filters: [date_filter: "@{EXPLORE_DATE_FILTER}"]
    unless: [partition_date]
  }

  # always_filter: {
  #   filters: {
  #     field: partition_date
  #     value: "@{EXPLORE_DATE_FILTER}"
  #   }
  # }

   # Add additional joins here
}

explore: future_input_config {
  extends: [future_input_core]
  extension: required
}
