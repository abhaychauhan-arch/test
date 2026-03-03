connection: "data-bricks"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: replace_db_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: replace_db_default_datagroup

explore: orders {}

explore: people {}

explore: returns {}
