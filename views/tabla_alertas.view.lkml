view: tabla_alertas {
  sql_table_name: dbo.TablaAlertas ;;

  dimension: exposicion {
    type: number
    sql: ${TABLE}.exposicion ;;
  }

  dimension: pm1 {
    type: number
    sql: ${TABLE}.pm1 ;;
  }

  dimension: pm10 {
    type: number
    sql: ${TABLE}.pm10 ;;
  }

  dimension: pm2_5 {
    type: number
    sql: ${TABLE}.pm2_5 ;;
  }

  dimension: rh {
    type: number
    sql: ${TABLE}.RH ;;
  }

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.TIME ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
