project_name: "block_ga360_config"

################ Constants ################

constant: SCHEMA_NAME {
  value: "ga360_generated_2"
  export: override_required
}

constant: GA360_TABLE_NAME {
  value: "ga_sessions_*"
  export: override_required
}
