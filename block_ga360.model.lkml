connection: "@{CONNECTION_NAME}"
label: "Block GA360"

include: "sessions.view"

include: "//app-event-adapter/*.view"

include: "//app-event-ga360/*.view"
include: "ga360_overview.dashboard"

include: "//app-event/*.model"
