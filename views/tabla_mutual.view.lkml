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
    sql: ${count} * 5/60 ;;
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
        sql: ${rh} <= 50 AND ${rh} >= 30;;
        label: "En Rango"
      }
      when: {
        sql: ${rh} > 50 OR ${rh} < 30;;
        label: "Fuera de Rango"
    }
  }
  }
  dimension: estadoT{
    case: {
      when: {
        sql: ${t} <= 24 AND ${t} >= 18;;
        label: "En Rango"
      }
      when: {
        sql: ${t} > 24 OR ${t} < 18;;
        label: "Fuera de rango"
      }
    }
  }
  dimension: estadopm2_5{
    case: {
      when: {
        sql: ${pm2_5} <= 50 AND ${pm2_5} >= 0;;
        label: "En Rango"
      }
      when: {
        sql: ${pm2_5} > 50;;
        label: "Fuera de Rango"
      }
    }
  }

  dimension: estadopm10{
    case: {
      when: {
        sql: ${pm10} <= 50 AND ${pm10} >= 0;;
        label: "En Rango"
      }
      when: {
        sql: ${pm10} > 50;;
        label: "Fuera de Rango"
      }
    }
  }

  dimension: estadopm1{
    case: {
      when: {
        sql: ${pm1} <= 50 AND ${pm1} >= 0;;
        label: "En Rango"
      }
      when: {
        sql: ${pm1} > 50;;
        label: "Fuera de Rango"
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
}
