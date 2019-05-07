connection: "@{CONNECTION_NAME}"
label: "Block GA360"

include: "sessions.view"

include: "//app-event-adapter/*.view"

include: "//app-event-ga360/*.view"

# Only including local dashboard for now since we use a different model name in this block, which futz' with the other dashboards
include: "overview.dashboard"

include: "//app-event/*.model"
