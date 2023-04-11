connection: "az-look"

# include all the views
include: "/views/**/*.view"

datagroup: finalmutual_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: finalmutual_default_datagroup

explore: alertas_mutual {}

explore: sysdiagrams {}

explore: tabla_mu {}
