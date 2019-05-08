project_name: "block-ga360"

# Used in google_analytics_block.model connection param
constant: CONNECTION_NAME {
  value: "looker_app"
}

# Used in ga_sessions.view sql_table_name
constant: SCHEMA_NAME {
  value: "ga360_generated_2"
}

# Make sure to include a note about having _* at the end to include all date partitioned tables
constant: GA360_TABLE_NAME {
  value: "ga_sessions_*"
}

#############################################

remote_dependency: app-event-adapter {
  url: "git://github.com/looker/app-event-ga360-bigquery"
  # TODO: update ref value by going to github.com/looker/app-event-ga360-bigquery and finding the latest query
  ref: "7cc3cc60aafb49f932b1284c7758ced1eb67621a"
}

remote_dependency: app-event-ga360 {
  url: "git://github.com/looker/app-event-ga360"
  # TODO: update ref value by going to github.com/looker/app-event-ga360 and finding the latest query
  ref: "266eebe57995cb65548ebafb93b9d19d151744d8"
}

remote_dependency: app-event {
  url: "git://github.com/looker/app-event"
  # TODO: update ref value by going to github.com/looker/app-event and finding the latest query
  ref: "0d98d962d749255ceff18e2ae7a64d040f129667"
}
