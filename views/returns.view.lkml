view: returns {
  sql_table_name: default.`returns`;;

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.`Order Id` ;;
  }
  dimension: returned {
    type: yesno
    sql: ${TABLE}.`Returned` ;;
  }
  measure: count {
    type: count
    drill_fields: [orders.customer_name, orders.order_id, orders.product_name]
  }
}
