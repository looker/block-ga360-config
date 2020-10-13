include: "/*/*.view.lkml"
include: "/Google_Analytics/Custom_Views/*.view.lkml"


explore: ga_sessions_config {
  extends: [ga_sessions_core]
  extension: required
   # Add additional joins here
}

explore: future_input_config {
  extends: [future_input_core]
  extension: required
}
