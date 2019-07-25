connection: "@{CONNECTION_NAME}"
label: "Block GA360"

include: "sessions.view"

include: "//app-event-adapter/*.view"

include: "//app-event-ga360/*.view"
include: "google_analytics_overview.dashboard"
include: "conversions.dashboard"
include: "event_analytics_dash_base.dashboard"

include: "//app-event/*.model"
