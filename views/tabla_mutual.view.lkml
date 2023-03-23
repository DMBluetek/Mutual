view: tabla_mutual {
  sql_table_name: dbo.Tabla_Mutual ;;

  dimension: co2 {
    type: number
    sql: ${TABLE}.Co2 ;;
  }

  dimension: id_disp {
    type: string
    sql: ${TABLE}.id_disp ;;
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
        sql: ${rh} <= 50;;
        label: "Puro"
      }
      when: {
        sql: ${rh} > 30;;
        label: "Puro"
      }
      else:"Contaminado"
    }
  }
  dimension: estadoT{
    case: {
      when: {
        sql: ${rh} <= 18;;
        label: "Cumplio"
      }
      when: {
        sql: ${rh} > 24;;
        label: "Cumplio"
      }
      else:"No Cumplio"
    }
  }
}
