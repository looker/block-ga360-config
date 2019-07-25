- dashboard: google_analytics_overview
  title: Google Analytics Overview
  extends: event_analytics_dash_base
  layout: newspaper
  embed_style:
    background_color: "#ffffff"
    title_color: "#3a4245"
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - name: Where should you acquire your users for Engagement?
    type: text
    title_text: Where should you acquire your users for Engagement?
    subtitle_text: ''
    body_text: ''
    row: 9
    col: 0
    width: 24
    height: 3
  - name: What content is performing best?
    type: text
    title_text: What content is performing best?
    row: 38
    col: 0
    width: 24
    height: 2
  - title: Sessions
    name: Sessions
    model: block_ga360
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: sessions
      label: Sessions
      expression: "(${ga_sessions.session_count} - offset(${ga_sessions.session_count},\
        \ 1)) / offset(${ga_sessions.session_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_duration
      label: Avg Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: returning_users
      label: Returning Users
      expression: "(${ga_sessions.returning_visitors} - offset(${ga_sessions.returning_visitors},\
        \ 1)) / offset(${ga_sessions.returning_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "(${totals.transaction_conversion_rate} - offset(${totals.transaction_conversion_rate},\
        \ 1)) / offset(${totals.transaction_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: bounce_rate
      label: Bounce Rate
      expression: "(${totals.bounce_rate} - offset(${totals.bounce_rate}, 1)) / offset(${totals.bounce_rate},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 364
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 361
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 380
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 377
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 396
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 393
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 412
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 409
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 428
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 425
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 443
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 440
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - totals.transaction_conversion_rate
    hidden_fields:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    - avg_duration
    - users
    - returning_users
    - conversion_rate
    - bounce_rate
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 0
    col: 0
    width: 4
    height: 2
  - title: Avg Duration
    name: Avg Duration
    model: block_ga360
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: sessions
      label: Sessions
      expression: "(${ga_sessions.session_count} - offset(${ga_sessions.session_count},\
        \ 1)) / offset(${ga_sessions.session_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_duration
      label: Avg Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: returning_users
      label: Returning Users
      expression: "(${ga_sessions.returning_visitors} - offset(${ga_sessions.returning_visitors},\
        \ 1)) / offset(${ga_sessions.returning_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "(${totals.transaction_conversion_rate} - offset(${totals.transaction_conversion_rate},\
        \ 1)) / offset(${totals.transaction_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: bounce_rate
      label: Bounce Rate
      expression: "(${totals.bounce_rate} - offset(${totals.bounce_rate}, 1)) / offset(${totals.bounce_rate},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 129
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 126
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 145
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 142
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 161
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 158
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 177
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 174
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 193
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 190
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 208
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 205
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - totals.transaction_conversion_rate
    hidden_fields:
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    - users
    - returning_users
    - conversion_rate
    - bounce_rate
    - ga_sessions.session_count
    - sessions
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 0
    col: 4
    width: 4
    height: 2
  - title: Users
    name: Users
    model: block_ga360
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: sessions
      label: Sessions
      expression: "(${ga_sessions.session_count} - offset(${ga_sessions.session_count},\
        \ 1)) / offset(${ga_sessions.session_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_duration
      label: Avg Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: returning_users
      label: Returning Users
      expression: "(${ga_sessions.returning_visitors} - offset(${ga_sessions.returning_visitors},\
        \ 1)) / offset(${ga_sessions.returning_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "(${totals.transaction_conversion_rate} - offset(${totals.transaction_conversion_rate},\
        \ 1)) / offset(${totals.transaction_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: bounce_rate
      label: Bounce Rate
      expression: "(${totals.bounce_rate} - offset(${totals.bounce_rate}, 1)) / offset(${totals.bounce_rate},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 599
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 596
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 615
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 612
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 631
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 628
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 647
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 644
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 663
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 660
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 678
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 675
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - totals.transaction_conversion_rate
    hidden_fields:
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    - returning_users
    - conversion_rate
    - bounce_rate
    - ga_sessions.session_count
    - sessions
    - totals.timeonsite_average_per_session
    - avg_duration
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 0
    col: 8
    width: 4
    height: 2
  - title: Returning Users
    name: Returning Users
    model: block_ga360
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: sessions
      label: Sessions
      expression: "(${ga_sessions.session_count} - offset(${ga_sessions.session_count},\
        \ 1)) / offset(${ga_sessions.session_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_duration
      label: Avg Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: returning_users
      label: Returning Users
      expression: "(${ga_sessions.returning_visitors} - offset(${ga_sessions.returning_visitors},\
        \ 1)) / offset(${ga_sessions.returning_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "(${totals.transaction_conversion_rate} - offset(${totals.transaction_conversion_rate},\
        \ 1)) / offset(${totals.transaction_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: bounce_rate
      label: Bounce Rate
      expression: "(${totals.bounce_rate} - offset(${totals.bounce_rate}, 1)) / offset(${totals.bounce_rate},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 834
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 831
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 850
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 847
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 866
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 863
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 882
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 879
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 898
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 895
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 913
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 910
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - totals.transaction_conversion_rate
    hidden_fields:
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    - conversion_rate
    - bounce_rate
    - ga_sessions.session_count
    - sessions
    - totals.timeonsite_average_per_session
    - avg_duration
    - ga_sessions.unique_visitors
    - users
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 0
    col: 12
    width: 4
    height: 2
  - title: Goal Conv Rate
    name: Goal Conv Rate
    model: block_ga360
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    - ga_sessions.selected_goal_conversion_rate
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: sessions
      label: Sessions
      expression: "(${ga_sessions.session_count} - offset(${ga_sessions.session_count},\
        \ 1)) / offset(${ga_sessions.session_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_duration
      label: Avg Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: returning_users
      label: Returning Users
      expression: "(${ga_sessions.returning_visitors} - offset(${ga_sessions.returning_visitors},\
        \ 1)) / offset(${ga_sessions.returning_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "(${totals.transaction_conversion_rate} - offset(${totals.transaction_conversion_rate},\
        \ 1)) / offset(${totals.transaction_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: bounce_rate
      label: Bounce Rate
      expression: "(${totals.bounce_rate} - offset(${totals.bounce_rate}, 1)) / offset(${totals.bounce_rate},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: goal_conv_rate
      label: Goal Conv Rate
      expression: "(${ga_sessions.selected_goal_conversion_rate} - offset(${ga_sessions.selected_goal_conversion_rate},\
        \ 1)) / offset(${ga_sessions.selected_goal_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1078
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1075
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1094
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1091
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1110
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1107
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1126
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1123
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1142
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1139
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1157
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1154
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - totals.transaction_conversion_rate
    hidden_fields:
    - totals.bounce_rate
    - bounce_rate
    - ga_sessions.session_count
    - sessions
    - totals.timeonsite_average_per_session
    - avg_duration
    - ga_sessions.unique_visitors
    - users
    - ga_sessions.returning_visitors
    - returning_users
    - totals.transaction_conversion_rate
    - conversion_rate
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 0
    col: 16
    width: 4
    height: 2
  - title: Bounce Rate
    name: Bounce Rate
    model: block_ga360
    explore: ga_sessions
    type: single_value
    fields:
    - ga_sessions.date_period
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.returning_visitors
    - totals.transaction_conversion_rate
    - totals.bounce_rate
    sorts:
    - ga_sessions.date_period desc
    limit: 2
    column_limit: 50
    dynamic_fields:
    - table_calculation: sessions
      label: Sessions
      expression: "(${ga_sessions.session_count} - offset(${ga_sessions.session_count},\
        \ 1)) / offset(${ga_sessions.session_count}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: avg_duration
      label: Avg Duration
      expression: "(${totals.timeonsite_average_per_session} - offset(${totals.timeonsite_average_per_session},\
        \ 1)) / offset(${totals.timeonsite_average_per_session}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: users
      label: Users
      expression: "(${ga_sessions.unique_visitors} - offset(${ga_sessions.unique_visitors},\
        \ 1)) / offset(${ga_sessions.unique_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: returning_users
      label: Returning Users
      expression: "(${ga_sessions.returning_visitors} - offset(${ga_sessions.returning_visitors},\
        \ 1)) / offset(${ga_sessions.returning_visitors}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: conversion_rate
      label: Conversion Rate
      expression: "(${totals.transaction_conversion_rate} - offset(${totals.transaction_conversion_rate},\
        \ 1)) / offset(${totals.transaction_conversion_rate}, 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: bounce_rate
      label: Bounce Rate
      expression: "(${totals.bounce_rate} - offset(${totals.bounce_rate}, 1)) / offset(${totals.bounce_rate},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle_outline
    interpolation: monotone
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1597
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1594
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1613
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1610
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1629
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1626
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1645
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1642
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1661
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1658
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1676
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1673
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - totals.transaction_conversion_rate
    hidden_fields:
    - ga_sessions.session_count
    - sessions
    - totals.timeonsite_average_per_session
    - avg_duration
    - ga_sessions.unique_visitors
    - users
    - ga_sessions.returning_visitors
    - returning_users
    - totals.transaction_conversion_rate
    - conversion_rate
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Comparison Period Latest: ga_sessions.date_period_comparison_period
    row: 0
    col: 20
    width: 4
    height: 2
  - title: Time Series
    name: Time Series
    model: block_ga360
    explore: ga_sessions
    type: looker_line
    fields:
    - ga_sessions.visitStart_date
    - ga_sessions.session_count
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.first_time_visitors
    - ga_sessions.selected_goal_conversion_rate
    fill_fields:
    - ga_sessions.visitStart_date
    sorts:
    - ga_sessions.visitStart_date desc
    limit: 364
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_new_visitors
      label: Percent New Visitors
      expression: "${ga_sessions.first_time_visitors}/${ga_sessions.session_count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    stacking: ''
    colors:
    - "#58A9F5"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    hidden_series:
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - ga_sessions.selected_goal_conversion_rate
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2393
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2390
    - label:
      orientation: left
      series:
      - id: ga_sessions.returning_visitors
        name: Returning Visitors
        axisId: ga_sessions.returning_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2409
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2406
    - label:
      orientation: left
      series:
      - id: ga_sessions.session_count
        name: Session Count
        axisId: ga_sessions.session_count
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2425
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2422
    - label:
      orientation: left
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2441
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2438
    - label: ''
      orientation: left
      series:
      - id: percent_new_visitors
        name: Percent New Visitors
        axisId: percent_new_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2457
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2454
    - label:
      orientation: right
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2472
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2469
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: monotone
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    hidden_fields:
    - ga_sessions.first_time_visitors
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Period Latest: ga_sessions.date_period_latest
    row: 2
    col: 0
    width: 24
    height: 7
  - title: Engagement by Traffic Source
    name: Engagement by Traffic Source
    model: block_ga360
    explore: ga_sessions
    type: looker_line
    fields:
    - ga_sessions.channelGrouping
    - totals.avg_pageview_per_user
    - ga_sessions.average_sessions_per_visitor
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    sorts:
    - ga_sessions.unique_visitors desc
    limit: 8
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types:
      ga_sessions.unique_visitors: column
    y_axes:
    - label:
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1404
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1401
    - label:
      orientation: left
      series:
      - id: totals.avg_pageview_per_user
        name: Average Pageviews per User
        axisId: totals.avg_pageview_per_user
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1420
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1417
    - label:
      orientation: left
      series:
      - id: ga_sessions.average_sessions_per_visitor
        name: Average Sessions Ver Visitor
        axisId: ga_sessions.average_sessions_per_visitor
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1436
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1433
    - label:
      orientation: right
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1452
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1449
    colors:
    - "#F6659A"
    - "#B9E49A"
    - "#FDCB6C"
    - "#58A9F5"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.avg_pageview_per_user
    - ga_sessions.average_sessions_per_visitor
    x_axis_label_rotation: -45
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Period Latest: ga_sessions.date_period_latest
    row: 12
    col: 0
    width: 8
    height: 13
  - title: Engagement by Medium
    name: Engagement by Medium
    model: block_ga360
    explore: ga_sessions
    type: looker_line
    fields:
    - totals.avg_pageview_per_user
    - ga_sessions.average_sessions_per_visitor
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    - trafficSource.medium
    sorts:
    - ga_sessions.unique_visitors desc
    limit: 8
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types:
      ga_sessions.unique_visitors: column
    y_axes:
    - label:
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1263
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1260
    - label:
      orientation: left
      series:
      - id: totals.avg_pageview_per_user
        name: Average Pageviews per User
        axisId: totals.avg_pageview_per_user
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1279
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1276
    - label:
      orientation: left
      series:
      - id: ga_sessions.average_sessions_per_visitor
        name: Average Sessions Ver Visitor
        axisId: ga_sessions.average_sessions_per_visitor
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1295
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1292
    - label:
      orientation: right
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1311
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1308
    colors:
    - "#F6659A"
    - "#B9E49A"
    - "#FDCB6C"
    - "#58A9F5"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.avg_pageview_per_user
    - ga_sessions.average_sessions_per_visitor
    x_axis_label_rotation: -45
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Period Latest: ga_sessions.date_period_latest
    row: 12
    col: 8
    width: 8
    height: 13
  - title: Engagement by Referrals
    name: Engagement by Referrals
    model: block_ga360
    explore: ga_sessions
    type: looker_line
    fields:
    - trafficSource.referralPath
    - totals.avg_pageview_per_user
    - ga_sessions.average_sessions_per_visitor
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    filters:
      trafficSource.referralPath: "-NULL"
    sorts:
    - ga_sessions.unique_visitors desc
    limit: 7
    column_limit: 50
    dynamic_fields:
    - table_calculation: referral_path
      label: Referral Path
      expression: substring(${trafficSource.referralPath},0,15)
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: circle
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types:
      ga_sessions.unique_visitors: column
    y_axes:
    - label:
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1789
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1786
    - label:
      orientation: left
      series:
      - id: totals.avg_pageview_per_user
        name: Average Pageviews per User
        axisId: totals.avg_pageview_per_user
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1805
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1802
    - label:
      orientation: left
      series:
      - id: ga_sessions.average_sessions_per_visitor
        name: Average Sessions Ver Visitor
        axisId: ga_sessions.average_sessions_per_visitor
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1821
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1818
    - label:
      orientation: right
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1837
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1834
    colors:
    - "#F6659A"
    - "#B9E49A"
    - "#FDCB6C"
    - "#58A9F5"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.avg_pageview_per_user
    - ga_sessions.average_sessions_per_visitor
    hidden_fields:
    - trafficSource.referralPath
    x_axis_label_rotation: -45
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Period Latest: ga_sessions.date_period_latest
    row: 12
    col: 16
    width: 8
    height: 13
  - title: How Often do Users Come Back?
    name: How Often do Users Come Back?
    model: block_ga360
    explore: ga_sessions
    type: looker_column
    fields:
    - ga_sessions.unique_visitors
    - ga_sessions.visitnumber
    limit: 7
    column_limit: 5
    stacking: ''
    colors:
    - "#58A9F5"
    - "#FF666C"
    - "#B9E49A"
    - "#FDCB6C"
    - "#F6659A"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2016
      showLabels: true
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2013
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Number of Visits
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    note_state: collapsed
    note_display: above
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Period Latest: ga_sessions.date_period_latest
    row: 25
    col: 12
    width: 12
    height: 13
  - title: When are Your Users Coming?
    name: When are Your Users Coming?
    model: block_ga360
    explore: ga_sessions
    type: table
    fields:
    - ga_sessions.visitStart_hour_of_day
    - ga_sessions.visitStart_day_of_week
    - ga_sessions.session_count
    pivots:
    - ga_sessions.visitStart_day_of_week
    fill_fields:
    - ga_sessions.visitStart_hour_of_day
    - ga_sessions.visitStart_day_of_week
    sorts:
    - ga_sessions.visitStart_day_of_week 0
    - ga_sessions.visitStart_hour_of_day
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#fff"
        - "#58A9F5"
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 1945
      bold: false
      italic: false
      strikethrough: false
      fields:
      - ga_sessions.session_count
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 1940
    series_labels:
      ga_sessions.visitStart_hour_of_day: Hour of Day
      ga_sessions.visitStart_day_of_week: Day of Week
    note_state: collapsed
    note_display: above
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Period Latest: ga_sessions.date_period_latest
    row: 25
    col: 0
    width: 12
    height: 13
  - title: Top Pages
    name: Top Pages
    model: block_ga360
    explore: ga_sessions
    type: looker_bar
    fields:
    - first_page.pageTitle
    - totals.transaction_conversion_rate
    - totals.timeonsite_average_per_session
    - ga_sessions.unique_visitors
    sorts:
    - ga_sessions.unique_visitors desc
    limit: 10
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: circle
    interpolation: monotone
    series_types:
      totals.transactionRevenue_total: line
      totals.transaction_conversion_rate: line
      totals.average_revenue_per_user: line
      totals.timeonsite_average_per_session: line
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2262
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2259
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2278
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: custom
      tickDensityCustom: 3
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2275
    - label: ''
      orientation: bottom
      series:
      - id: totals.timeonsite_average_per_session
        name: Time On Site Average Per Session
        axisId: totals.timeonsite_average_per_session
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2294
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2291
    colors:
    - "#B9E49A"
    - "#FDCB6C"
    - "#58A9F5"
    - "#5EC0C4"
    - "#BFBFBF"
    - "#7DC06A"
    - "#D0A997"
    - "#8696B8"
    - "#C5D4B2"
    series_colors: {}
    hidden_series:
    - totals.transaction_conversion_rate
    - totals.timeonsite_average_per_session
    x_axis_label_rotation: -45
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Period Latest: ga_sessions.date_period_latest
    row: 40
    col: 0
    width: 12
    height: 14
  - title: Top Pages Full Detail
    name: Top Pages Full Detail
    model: block_ga360
    explore: ga_sessions
    type: table
    fields:
    - first_page.pageTitle
    - ga_sessions.total_visitors
    - ga_sessions.unique_visitors
    - ga_sessions.session_count
    - totals.bounce_rate
    - totals.page_views_session
    - totals.timeonsite_average_per_session
    - totals.transaction_conversion_rate
    - totals.average_revenue_per_transaction
    - totals.transactionRevenue_total
    sorts:
    - ga_sessions.total_visitors desc
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: circle
    interpolation: monotone
    series_types: {}
    y_axes:
    - label:
      orientation: top
      series:
      - id: totals.transactionRevenue_total
        name: Transaction Revenue Total
        axisId: totals.transactionRevenue_total
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2127
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2124
    - label: ''
      orientation: bottom
      series:
      - id: totals.transaction_conversion_rate
        name: Transaction Conversion Rate
        axisId: totals.transaction_conversion_rate
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2143
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2140
    - label:
      orientation: bottom
      series:
      - id: ga_sessions.unique_visitors
        name: Unique Visitors
        axisId: ga_sessions.unique_visitors
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2159
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2156
    - label:
      orientation: bottom
      series:
      - id: totals.average_revenue_per_user
        name: Average Revenue per User
        axisId: totals.average_revenue_per_user
        __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
        __LINE_NUM: 2175
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: 91b39630a0c7233f58a1fcd7ee4e38a4e322c3a1d7b9a9e2c9646dfebce8ee4bafc32fdb/google_analytics_overview.dashboard.lookml
      __LINE_NUM: 2172
    colors:
    - 'palette: Fuchsia to Green'
    series_colors:
      ga_sessions.unique_visitors: "#286f0f"
    hidden_series:
    - totals.transaction_conversion_rate
    - totals.average_revenue_per_user
    x_axis_label_rotation: -45
    listen:
      Period: ga_sessions.period
      Campaign: trafficSource.campaign
      First Time Visitor: ga_sessions.first_time_visitor
      Country: geoNetwork.country
      Page: ga_sessions.has_page
      Host: ga_sessions.has_host
      Goal Selection: ga_sessions.goal_selection
      Property: ga_sessions.property
      Search Keyword: trafficSource.keyword
      Period Latest: ga_sessions.date_period_latest
    row: 40
    col: 12
    width: 12
    height: 14
  filters:
  - name: Period
    title: Period
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    model: block_ga360
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.period
  - name: Campaign
    title: Campaign
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_ga360
    explore: ga_sessions
    listens_to_filters: []
    field: trafficSource.campaign
  - name: First Time Visitor
    title: First Time Visitor
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_ga360
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.first_time_visitor
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_ga360
    explore: ga_sessions
    listens_to_filters: []
    field: geoNetwork.country
  - name: Page
    title: Page
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_ga360
    explore: ga_sessions
    listens_to_filters: []
    field: first_page.pageTitle
  - name: Host
    title: Host
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_ga360
    explore: ga_sessions
    listens_to_filters: []
    field: hits_page.hostName
  - name: Goal Selection
    title: Goal Selection
    type: field_filter
    default_value: Demo
    allow_multiple_values: true
    required: false
    model: block_ga360
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.goal_selection
  - name: Property
    title: Property
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_ga360
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.property
  - name: Search Keyword
    title: Search Keyword
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_ga360
    explore: ga_sessions
    listens_to_filters: []
    field: trafficSource.keyword
  - name: Comparison Period Latest
    title: Comparison Period Latest
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    model: block_ga360
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.date_period_comparison_period
  - name: Period Latest
    title: Period Latest
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    model: block_ga360
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.date_period_latest
