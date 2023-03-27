view: table_bsense {
  sql_table_name: dbo.tableBsense ;;

  dimension: avg_pm1 {
    type: number
    sql: ${TABLE}.AVG_pm1 ;;
  }

  dimension: avg_pm10 {
    type: number
    sql: ${TABLE}.AVG_pm10 ;;
  }

  dimension: avg_pm2_5 {
    type: number
    sql: ${TABLE}.AVG_pm2_5 ;;
  }

  dimension: avg_rh {
    type: number
    sql: ${TABLE}.AVG_RH ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
