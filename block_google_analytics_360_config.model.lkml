include: "/*/*.view.lkml"
include: "/Google_Analytics/Custom_Views/*.view.lkml"


explore: ga_sessions_config {
  extends: [ga_sessions_core]
  extension: required

  always_filter: {
    filters: {
      # For single property use partition_date
      field: partition_date

      # For multi property use partition_filter
      # field: partition_filter
      value: "@{EXPLORE_DATE_FILTER}"
    }
  }



   # Add additional joins here
}

explore: future_input_config {
  extends: [future_input_core]
  extension: required
}
