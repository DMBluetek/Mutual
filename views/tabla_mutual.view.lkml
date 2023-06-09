view: tabla_mutual {
  sql_table_name: dbo.BluesenseOfi ;;

  dimension: co2 {
    type: number
    sql: ${TABLE}.CO2 ;;
  }

  dimension: id_disp {
    type: string
    sql: ${TABLE}.id;;
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
    value_format: "0.0"
  }

  dimension: t {
    type: number
    sql: ${TABLE}.T ;;
    value_format: "0.0"
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
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: Horas {
    type: number
    sql: ${count} * 1/60 ;;
    drill_fields: []
    value_format: "0\" Horas\""
  }
  measure: 15min {
    type: number
    sql: ${count} /3 ;;
    drill_fields: []
  }

  dimension: estadoRH{
    case: {
      when: {
        sql: ${rh}< 25;;
        label: "Bueno"
      }
      when: {
        sql: ${rh} >= 25 AND ${rh}< 50;;
        label: "Regular"
      }
      when: {
        sql: ${rh} >= 50 AND ${rh} < 75;;
        label: "Alerta"
      }
      when: {
        sql: ${rh}>= 75 AND ${rh} < 100;;
        label: "Pre-Emergencia"
      }
      when: {
        sql: ${rh} >= 100;;
        label: "Emergencia"
      }
  }
  }
  dimension: estadoT{
    case: {
      when: {
        sql: ${t} < 25;;
        label: "Bueno"
      }
      when: {
        sql: ${t} >= 25 AND ${t}< 50;;
        label: "Regular"
      }
      when: {
        sql: ${t} >= 50 AND ${t} < 75;;
        label: "Alerta"
      }
      when: {
        sql: ${t}>= 75 AND ${t} < 100;;
        label: "Pre-Emergencia"
      }
      when: {
        sql: ${t} >= 100;;
        label: "Emergencia"
      }
    }
  }
  dimension: estadopm2_5{
    case: {
      when: {
        sql: ${pm2_5} < 25;;
        label: "Bueno"
      }
      when: {
        sql: ${pm2_5} >= 25 AND ${pm2_5} < 50;;
        label: "Regular"
      }
      when: {
        sql: ${pm2_5} >= 50 AND ${pm2_5} < 75;;
        label: "Alerta"
      }
      when: {
        sql: ${pm2_5} >= 75 AND ${pm2_5} < 100;;
        label: "Pre-Emergencia"
      }
      when: {
        sql: ${pm2_5} >= 100;;
        label: "Emergencia"
      }
    }
  }

  dimension: estadopm10{
    case: {
      when: {
        sql: ${pm10} < 25;;
        label: "Bueno"
      }
      when: {
        sql: ${pm10} >= 25 AND ${pm10} < 50;;
        label: "Regular"
      }
      when: {
        sql: ${pm10} >= 50 AND ${pm10} < 75;;
        label: "Alerta"
      }
      when: {
        sql: ${pm10} >= 75 AND ${pm10} < 100;;
        label: "Pre-Emergencia"
      }
      when: {
        sql: ${pm10} >= 100;;
        label: "Emergencia"
      }
    }
  }

  dimension: estadopm1{
    case: {
      when: {
        sql: ${pm1} < 25;;
        label: "Bueno"
      }
      when: {
        sql: ${pm1} >= 25 AND ${pm1}< 50;;
        label: "Regular"
      }
      when: {
        sql: ${pm1} >= 50 AND ${pm1} < 75;;
        label: "Alerta"
      }
      when: {
        sql: ${pm1}>= 75 AND ${pm1} < 100;;
        label: "Pre-Emergencia"
      }
      when: {
        sql: ${pm1} >= 100;;
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
        sql: ${t} < 18;;
        label: "(12-18°C)"
      }
      when: {
        sql: ${t} >= 18 AND ${t} <=24;;
        label: "(18-24°C)"
      }
      when: {
        sql: ${t} > 24;;
        label: "(24-30°C)"
      }
    }
  }
  dimension: barraRH{
    case: {
      when: {
        sql: ${rh} < 30;;
        label: "(10-30%)"
      }
      when: {
        sql: ${rh} >= 30 AND ${t} <=50;;
        label: "(30-50%)"
      }
      when: {
        sql: ${rh} > 50;;
        label: "(50-70%)"
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
        sql: ${pm2_5} > 50;;
        label: "(50-100μg/m3)"
      }
      else: "(0-50μg/m3)"
    }
  }
  dimension: barrapm1{
    case: {
      when: {
        sql: ${pm1} > 50;;
        label: "(50-100μg/m3)"
      }
      else: "(0-50μg/m3)"
    }
  }
  dimension: barrapm10{
    case: {
      when: {
        sql: ${pm10} > 50;;
        label: "(50-100μg/m3)"
      }
      else: "(0-50μg/m3)"
    }
  }
  dimension: barraco2{
    case: {
      when: {
        sql: ${co2} > 50;;
        label: "(50-100μg/m3)"
      }
      else: "(0-50μg/m3)"
    }
  }
  dimension: barratvoc{
    case: {
      when: {
        sql: ${tvoc} > 50;;
        label: "(50-100μg/m3)"
      }
      else: "(0-50μg/m3)"
    }
  }
}
