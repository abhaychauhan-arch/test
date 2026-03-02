view: people {
  sql_table_name: "PUBLIC"."PEOPLE" ;;

  dimension: person {
    type: string
    sql: ${TABLE}."PERSON" ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }
  measure: count {
    type: count
  }
}
