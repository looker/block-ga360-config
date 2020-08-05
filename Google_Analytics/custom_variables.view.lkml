view: custom_variables_config {
  extends: [custom_variables_core]
  extension: required

   # Add view customizations here
  dimension: custom_var_name {
    hidden: yes
    group_label: "Custom Variables"
    label: "Custom Variable (Key XX)"
    description: "The name for the requested custom variable."
    type: string
    sql: ${TABLE}.customvarname ;;
  }

  dimension: custom_var_value {
    hidden: yes
    group_label: "Custom Variables"
    label: "Custom Variable (Value XX)"
    description: "The value for the requested custom variable."
    type: string
    sql: ${TABLE}.customvarvalue ;;
  }

  dimension: index {
    hidden: yes
    description: "The index number associated to the custom variable"
    type: number
    sql: ${TABLE}.index ;;
  }

  # dimension: some_name {
  #   type: number
  #   sql: CASE WHEN ${index} = 1 THEN ${custom_var_value} ELSE NULL END ;;
  # }

}
