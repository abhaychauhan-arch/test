view: niagara_dummy_data {
  sql_table_name: `test_db.niagara_dummy_data` ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: factor {
    type: string
    sql: ${TABLE}.factor ;;

    action: {
      label: "Factor Value"
      url: "https://!@#$%^&*.cloudfunctions.net/changeamount_actions"
      param: {
        name:"id"
        value: "{{value}}"
      }
      form_param: {
        name: "changeamount"
        type: string
        label: "value"
        description: "Enter new value above."
        required: yes
      }
    }
  }
  dimension: market {
    type: string
    sql: ${TABLE}.market ;;

    action: {
      label: "Scenario name"
      url: "https://test-looker-actions-506349280167.us-central1.run.app"
      param: {
        name:"id"
        value: "{{value}}"
      }

    }
    action: {
      label: "Add comment"
      url: "https://test-looker-actions-506349280167.us-central1.run.app"
      param: {
        name:"id"
        value: "{{value}}"
      }
      form_param: {
        name: "comment"
        type: textarea
        label: "Enter the comment"
        required: yes
      }
    }
  }
  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }
  dimension_group: week_ending {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.week_ending ;;
  }
  measure: count {
    type: count
  }

  parameter: user_name {

    label: "User Name"
    type: string
  }

  parameter: user_status {
    label: "Status"
    type: string
  }

  parameter: user_comment {
    label: "Comment"
    type: unquoted
  }
  parameter: pricing_parameter {
    type: number
    label: "Pricing Parameter"
    default_value: "2"
  }
  parameter: distribution_parameter {
    type: number
    label: "Distribution Parameter"
    default_value: "3"
  }
  dimension: factor_value {
    label: "Factor Value"
    type: number
    sql:
    CASE
      WHEN ${TABLE}.factor = 'Pricing' THEN CAST( {% parameter niagara_dummy_data.pricing_parameter %} AS NUMERIC)
      WHEN ${TABLE}.factor = 'Distribution' THEN CAST( {% parameter niagara_dummy_data.distribution_parameter %} AS NUMERIC)
    END ;;
  }
  parameter: scenario_name_parameter {
    type: string
    label: "Scenario Name Parameter"
    default_value: "Scenario 1"
  }
  dimension: scenario_name_value {
    label: "Scenario Name Value"
    type: string
    sql:{% parameter scenario_name_parameter %};;
  }
}
