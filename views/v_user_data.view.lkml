view: v_user_data {
  sql_table_name: `ta-niagara.test_db.v_user_data` ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }
  dimension: factor {
    type: string
    sql: ${TABLE}.Factor ;;
  }
  dimension: factor_value {
    type: string
    sql: ${TABLE}.Factor_Value ;;
  }
  dimension: index {
    type: string
    sql: ${TABLE}.index ;;
  }
  dimension: market {
    type: string
    sql: ${TABLE}.Market ;;
  }
  dimension: product {
    type: string
    sql: ${TABLE}.Product ;;
  }
  dimension: user_file_name {
    type: string
    sql: ${TABLE}.user_file_name ;;
  }
  dimension: week_ending_week {
    type: string
    sql: ${TABLE}.Week_Ending_Week ;;
  }
  measure: count {
    type: count
    drill_fields: [user_file_name]
  }
}
