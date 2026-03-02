view: returns {
  sql_table_name: "PUBLIC"."RETURNS" ;;

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."ORDER_ID" ;;
  }
  dimension: returned {
    type: yesno
    sql: ${TABLE}."RETURNED" ;;
  }
  measure: count {
    type: count
    drill_fields: [orders.customer_name, orders.order_id, orders.product_name]
  }
}
