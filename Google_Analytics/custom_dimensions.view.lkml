view: custom_dimensions_config {
  extends: [custom_dimensions_core]
extension: required

  # Add view customizations here
  ########## DIMENSIONS ##########

  dimension: index {
    hidden: yes
    type: number
    group_label: "Custom Variables"
    label: "Custom Dimension XX"
    description: "The value of the requested custom dimension, where XX refers to the number or index of the custom dimension."
    sql: ${TABLE}.index ;;
  }

  dimension: value {
    hidden: yes
    description: "The value of the custom dimension for the specified index."
    type: string
    sql: ${TABLE}.value ;;
  }

  # dimension: some_name {
  #   type: string
  #   sql: CASE WHEN ${index} = 1 THEN ${value} ELSE NULL END ;;
  # }

}
