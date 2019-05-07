connection: "@{CONNECTION_NAME}"
label: "Block GA360"

include: "sessions.view"

include: "//app-event-adapter/*.view"

include: "//app-event-ga360/*.view"
include: "//app-event-ga360/google_analytics_overview.dashboard"
include: "//app-event-ga360/conversions.dashboard"
include: "//app-event-ga360/event_analytics_dash_base.dashboard"

include: "//app-event/*.model"
