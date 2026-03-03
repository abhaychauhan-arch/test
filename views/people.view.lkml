view: people {
  sql_table_name: default.`people`;;

  dimension: person {
    type: string
    sql: ${TABLE}.`Person` ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.`Region` ;;
  }
  measure: count {
    type: count
  }
}
