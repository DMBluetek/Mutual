view: tabla_mutual {
  sql_table_name: dbo.BluesenseOfi ;;

dimension: co2 {
  type: number
  sql: ${TABLE}.CO2 ;;
  value_format: "0.0\" μg/m3\""
}

dimension: id_disp {
  type: string
  sql: ${TABLE}.id;;
}

dimension: pm1 {
  type: number
  sql: ${TABLE}.pm1 ;;
  value_format: "0.0\" μg/m3\""
}

dimension: pm10 {
  type: number
  sql: ${TABLE}.pm10 ;;
  value_format: "0.0\" μg/m3\""
}

dimension: pm2_5 {
  type: number
  sql: ${TABLE}.pm2_5 ;;
  value_format: "0.0\" μg/m3\""
}

dimension: rh {
  type: number
  sql: ${TABLE}.RH ;;
  value_format: "0.0\%"
}

dimension: t {
  type: number
  sql: ${TABLE}.T ;;
  value_format: "0.0\" °C\""
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
    sql: ${TABLE}.Time ;;
  }

  dimension: tvoc {
    type: number
    sql: ${TABLE}.TVOC ;;
    value_format: "0.0\" μg/m3\""
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: Horas {
    type: number
    sql: ${count} * 1/60 ;;
    drill_fields: [min_rh, rh]
    value_format: "0\" Horas\""
  }
  measure: 15min {
    type: number
    sql: ${count} /3 ;;
    drill_fields: []
  }
  measure: Uptime {
    type: number
    sql:  ${count} *100/34560 ;;
    value_format: "0\" %\""
  }
  measure: Uptime1 {
    type: number
    sql:  ${count} *100/4320 ;;
    value_format: "0\" %\""
  }

  dimension: estadoRH{
    case: {
      when: {
        sql: ${rh} < 10;;
        label: "Muy bajo"
      }
      when: {
        sql: ${rh} >= 10 AND ${rh}< 30;;
        label: "Bajo"
      }
      when: {
        sql: ${rh} >= 30 AND ${rh} < 50;;
        label: "Normal"
      }
      when: {
        sql: ${rh} >= 50 AND ${rh} < 75;;
        label: "Alto"
      }
      when: {
        sql: ${rh} >= 75;;
        label: "Muy alto"
      }
  }
  }
  dimension: estadoT{
    case: {
      when: {
        sql: ${t} < 12;;
        label: "Muy bajo"
      }
      when: {
        sql: ${t} >= 12 AND ${t}< 18;;
        label: "Bajo"
      }
      when: {
        sql: ${t} >= 18 AND ${t} < 24;;
        label: "Normal"
      }
      when: {
        sql: ${t}>= 24 AND ${t} < 32;;
        label: "Alto"
      }
      when: {
        sql: ${t} >= 32;;
        label: "Muy alto"
      }
    }
  }
  dimension: estadopm2_5{
    case: {
      when: {
        sql: ${pm2_5} < 50;;
        label: "Bueno"
      }
      when: {
        sql: ${pm2_5} >= 50 AND ${pm2_5} < 80;;
        label: "Regular"
      }
      when: {
        sql: ${pm2_5} >= 80 AND ${pm2_5} < 110;;
        label: "Alerta"
      }
      when: {
        sql: ${pm2_5} >= 110 AND ${pm2_5} < 170;;
        label: "Pre-Emergencia"
      }
      when: {
        sql: ${pm2_5} >= 170;;
        label: "Emergencia"
      }
    }
  }

  dimension: estadopm10{
    case: {
      when: {
        sql: ${pm10} < 130;;
        label: "Bueno"
      }
      when: {
        sql: ${pm10} >= 130 AND ${pm10} < 180;;
        label: "Regular"
      }
      when: {
        sql: ${pm10} >= 180 AND ${pm10} < 230;;
        label: "Alerta"
      }
      when: {
        sql: ${pm10} >= 230 AND ${pm10} < 330;;
        label: "Pre-Emergencia"
      }
      when: {
        sql: ${pm10} >= 330;;
        label: "Emergencia"
      }
    }
  }

  dimension: estadopm1{
   case: {
    when: {
      sql: ${pm1} < 45;;
      label: "Bueno"
    }
    when: {
      sql: ${pm1} >= 45 AND ${pm1} < 72;;
      label: "Regular"
    }
    when: {
      sql: ${pm1} >= 72 AND ${pm1} < 99;;
      label: "Alerta"
    }
    when: {
      sql: ${pm1} >= 99 AND ${pm1} < 153;;
      label: "Pre-Emergencia"
    }
    when: {
      sql: ${pm1} >= 153;;
      label: "Emergencia"
    }
  }
  }

  dimension: estadoCO2{
    case: {
      when: {
        sql: ${co2} < 25;;
        label: "Bueno"
      }
      when: {
        sql: ${co2} >= 25 AND ${co2}< 50;;
        label: "Regular"
      }
      when: {
        sql: ${co2} >= 50 AND ${co2} < 75;;
        label: "Alerta"
      }
      when: {
        sql: ${co2}>= 75 AND ${co2} < 100;;
        label: "Pre-Emergencia"
      }
      when: {
        sql: ${co2} >= 100;;
        label: "Emergencia"
      }
    }
  }

  dimension: estadoTVOC{
    case: {
      when: {
        sql: ${tvoc} < 25;;
        label: "Bueno"
      }
      when: {
        sql: ${tvoc} >= 25 AND ${tvoc}< 50;;
        label: "Regular"
      }
      when: {
        sql: ${tvoc} >= 50 AND ${tvoc} < 75;;
        label: "Alerta"
      }
      when: {
        sql: ${tvoc}>= 75 AND ${tvoc} < 100;;
        label: "Pre-Emergencia"
      }
      when: {
        sql: ${tvoc} >= 100;;
        label: "Emergencia"
      }
    }
  }

  measure: avg_rh {
    type: average
    sql: ${rh} ;;
    value_format: "0.0\%"
  }

  measure: avg_t {
    type: average
    sql: ${t} ;;
    value_format: "0.0\" °C\""
  }

  measure: avg_pm2_5 {
    type: average
    sql: ${pm2_5} ;;
    value_format: "0.0\" μg/m3\""
  }

  measure: avg_pm10 {
    type: average
    sql: ${pm10} ;;
    value_format: "0.0\" μg/m3\""
  }

  measure: avg_pm1 {
    type: average
    sql: ${pm1} ;;
    value_format: "0.0\" μg/m3\""
  }

  measure: avg_co2 {
    type: average
    sql: ${co2} ;;
    value_format: "0.0\" μg/m3\""
  }

  measure: avg_tvoc {
    type: average
    sql: ${tvoc} ;;
    value_format: "0.0\" μg/m3\""
  }

  measure: max_t {
    type: max
    sql: ${t} ;;
    value_format: "0.0\" °C\""
  }
  measure: max_rh {
    type: max
    sql: ${rh} ;;
    value_format: "0.0\%"
  }
  measure: min_t {
    type: min
    sql: ${t} ;;
    value_format: "0.0\" °C\""
  }
  measure: min_rh {
    type: min
    sql: ${rh} ;;
    value_format: "0.0\%"
  }
  measure: max_pm2_5 {
    type: max
    sql: ${pm2_5} ;;
    value_format: "0.0\" μg/m3\""
  }
  measure: max_pm2_5saturado {
    type: max
    sql: CASE WHEN ${pm2_5} > 500 THEN 500 ELSE ${pm2_5} END ;;
    value_format: "0.0\" μg/m3\""
  }

  measure: min_pm2_5 {
    type: min
    sql: ${pm2_5} ;;
    value_format: "0.0\" μg/m3\""
  }
  measure: max_pm10 {
    type: max
    sql: ${pm10} ;;
    value_format: "0.0\" μg/m3\""
  }
  measure: min_pm10 {
    type: min
    sql: ${pm10} ;;
    value_format: "0.0\" μg/m3\""
  }
  measure: max_pm1 {
    type: max
    sql: ${pm1} ;;
    value_format: "0.0\" μg/m3\""
  }
  measure: min_pm1 {
    type: min
    sql: ${pm1} ;;
    value_format: "0.0\" μg/m3\""
  }
  measure: max_co2 {
    type: max
    sql: ${co2} ;;
    value_format: "0.0\" μg/m3\""
  }
  measure: min_co2 {
    type: min
    sql: ${co2} ;;
    value_format: "0.0\" μg/m3\""
  }
  measure: max_tvoc {
    type: max
    sql: ${tvoc} ;;
    value_format: "0.0\" μg/m3\""
  }
  measure: min_tvoc {
    type: min
    sql: ${tvoc} ;;
    value_format: "0.0\" μg/m3\""
  }


  dimension: barraT{
    case: {
      when: {
        sql: ${t} < 12;;
        label: "(0-12°C)"
      }
      when: {
        sql: ${t} >= 12 AND ${t} <18;;
        label: "(12-18°C)"
      }
      when: {
        sql: ${t} >= 18 AND ${t} <24;;
        label: "(18-24°C)"
      }
      when: {
        sql: ${t} >= 24 AND ${t} <32;;
        label: "(24-32°C)"
      }
      when: {
        sql: ${t} >= 32;;
        label: "(32-50°C)"
      }
    }
  }
  dimension: barraRH{
    case: {
      when: {
        sql: ${rh} < 10;;
        label: "(0-10%)"
      }
      when: {
        sql: ${rh} >= 10 AND ${rh} <30;;
        label: "(10-30%)"
      }
      when: {
        sql: ${rh} >= 30 AND ${rh} <50;;
        label: "(30-50%)"
      }
      when: {
        sql: ${rh} >= 50 AND ${rh} <75;;
        label: "(50-75%)"
      }
      when: {
        sql: ${rh} >= 75;;
        label: "(75-100%)"
      }
    }
  }
  dimension: barraRHE{
    case: {
      when: {
        sql: ${rh} >= 30 AND ${t} <=50;;
        label: "En Rango (30-50%)"
      }
    }
  }
  dimension: barraRHS{
    case: {
      when: {
        sql: ${rh} > 50;;
        label: "Sobre Rango (50-70%)"
      }
    }
  }
  dimension: barraRHB{
    case: {
      when: {
        sql: ${rh} < 30;;
        label: "Bajo Rango (10-30%)"
      }
    }

  }
  dimension: barrapm2_5{
    case: {
      when: {
        sql: ${pm2_5} < 50;;
        label: "(0-50μg/m3)"
      }
      when: {
        sql: ${pm2_5} >= 50 AND ${pm2_5} < 80;;
        label: "(50-80μg/m3)"
      }
      when: {
        sql: ${pm2_5} >= 80 AND ${pm2_5} < 110;;
        label: "(80-110μg/m3)"
      }
      when: {
        sql: ${pm2_5} >= 109 AND ${pm2_5} < 170;;
        label: "(110-170μg/m3)"
      }
      when: {
        sql: ${pm2_5} >= 170;;
        label: "(170-500μg/m3)"
      }
    }
  }
  dimension: barrapm1{
     case: {
      when: {
        sql: ${pm1} < 45;;
        label: "(0-45μg/m3)"
      }
      when: {
        sql: ${pm1} >= 45 AND ${pm1} < 72;;
        label: "(45-72μg/m3)"
      }
      when: {
        sql: ${pm1} >= 72 AND ${pm1} < 99;;
        label: "(72-99μg/m3)"
      }
      when: {
        sql: ${pm1} >= 99 AND ${pm1} < 153;;
        label: "(99-153μg/m3)"
      }
      when: {
        sql: ${pm1} >= 153;;
        label: "(153-500μg/m3)"
      }
    }
  }
  dimension: barrapm10{
    case: {
      when: {
        sql: ${pm10} < 130;;
        label: "(0-130μg/m3)"
      }
      when: {
        sql: ${pm10} >= 130 AND ${pm10} < 180;;
        label: "(130-180μg/m3)"
      }
      when: {
        sql: ${pm10} >= 180 AND ${pm10} < 230;;
        label: "(180-230μg/m3)"
      }
      when: {
        sql: ${pm10} >= 230 AND ${pm10} < 330;;
        label: "(230-330μg/m3)"
      }
      when: {
        sql: ${pm10} >= 330;;
        label: "(330-500μg/m3)"
      }
    }
  }
  dimension: barraco2{
    case: {
     when: {
      sql: ${co2} < 25;;
      label: "(0-25μg/m3)"
    }
    when: {
      sql: ${co2} >= 25 AND ${co2} < 50;;
      label: "(25-50μg/m3)"
    }
    when: {
      sql: ${co2} >= 50 AND ${co2} < 75;;
      label: "(50-75μg/m3)"
    }
    when: {
      sql: ${co2} >= 75 AND ${co2} < 100;;
      label: "(75-100μg/m3)"
    }
    when: {
      sql: ${co2} >= 100;;
      label: "(100-200μg/m3)"
    }
    }
  }
  dimension: barratvoc{
    case: {
      when: {
        sql: ${tvoc} < 25;;
        label: "(0-25μg/m3)"
      }
      when: {
        sql: ${tvoc} >= 25 AND ${tvoc} < 50;;
        label: "(25-50μg/m3)"
      }
      when: {
        sql: ${tvoc} >= 50 AND ${tvoc} < 75;;
        label: "(50-75μg/m3)"
      }
      when: {
        sql: ${tvoc} >= 75 AND ${tvoc} < 100;;
        label: "(75-100μg/m3)"
      }
      when: {
        sql: ${tvoc} >= 100;;
        label: "(100-200μg/m3)"
      }
    }
  }
}
