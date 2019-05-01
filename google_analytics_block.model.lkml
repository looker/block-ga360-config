connection: "@{connection_name}"
# connection: "@{connection_name}"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: ga_sessions {
  extends: [ga_sessions_block]
}
