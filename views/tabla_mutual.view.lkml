view: tabla_mutual {
  sql_table_name: dbo.Tabla_Mutual ;;

  dimension: co2 {
    type: number
    sql: ${TABLE}.CO2 ;;
  }

  dimension: id_disp {
    type: string
    sql: ${TABLE}.id_disp;;
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

  dimension: t {
    type: number
    sql: ${TABLE}.T ;;
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

  dimension: estadoRH{
    case: {
      when: {
        sql: ${rh} < 50 AND ${rh} > 30;;
        label: "En Rango"
      }
      else:"Fuera de Rango"
    }
  }
  dimension: estadoT{
    case: {
      when: {
        sql: ${t} < 24 AND ${t} > 18;;
        label: "En Rango"
      }
      else:"Fuera de Rango"
    }
  }

  measure: multiempo {
    type: sum
    sql: 5 * count(${estadoRH}) ;;
  }

  measure: avg_rh {
    type: average
    sql: ${rh} ;;
  }

  measure: avg_t {
    type: average
    sql: ${t} ;;
  }

  measure: max_t {
    type: max
    sql: ${t} ;;
  }
  measure: max_rh {
    type: max
    sql: ${rh} ;;
  }
  measure: min_t {
    type: min
    sql: ${t} ;;
  }
  measure: min_rh {
    type: min
    sql: ${rh} ;;
  }
  dimension: barraT{
    case: {
      when: {
        sql: ${t} > 24;;
        label: "Pasado el Rango"
      }
      when: {
        sql: ${t} < 18;;
        label: "Bajo el Rango"
      }
      else: "En el Rango"
    }
  }
  dimension: barraRH{
    case: {
      when: {
        sql: ${rh} > 50;;
        label: "Pasado el Rango"
      }
      when: {
        sql: ${rh} < 30;;
        label: "Bajo el Rango"
      }
      else: "En el Rango"
    }
  }
}
