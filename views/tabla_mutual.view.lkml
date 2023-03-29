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
  dimension: barraT{
    case: {
      when: {
        sql: ${t} > 24;;
        label: "Sobre el Rango (24-30°C)"
      }
      when: {
        sql: ${t} < 18;;
        label: "Bajo el Rango (12-18°C)"
      }
      else: "En el Rango (18-24°C)"
    }
  }
  dimension: barraRH{
    case: {
      when: {
        sql: ${rh} > 50;;
        label: "Sobre el Rango (50-70%)"
      }
      when: {
        sql: ${rh} < 30;;
        label: "Bajo el Rango (10-30%)"
      }
      else: "En el Rango (30-50%)"
    }
  }
  measure:  RHColor{
    type: string
    sql: ${barraRH} ;;
    html:
    {% if value == "En el Rango (30-50%)" %}
    <p style="color: green; font-size: 100%">{{ rendered_value }}</p>
    {% else %}
    <p style="color: red; font-size:100%">{{ rendered_value }}</p>
    {% endif %};;
  }
}
