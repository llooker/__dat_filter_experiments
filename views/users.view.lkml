view: users {
  sql_table_name: `graphic-theory-197904.tickets.users`;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension_group: signed_up {
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
    sql: ${TABLE}.signed_up_at ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name]
  }

  parameter: state_selector {
    type: unquoted
    default_value: "California"
    suggest_dimension: state
  }

  dimension: state_2 {
    type: string
    sql: ${TABLE}.state ;;
    html:
    {% if state_selector._parameter_value == state._value %}
      <div style="background-color:gray; height:50px; width:110%; border:0px;">{{rendered_value}}</div>
    {% else %}
     {{rendered_value}}
    {% endif %};;
  }

  measure: count_male {
    type: count
    filters: [gender: "Male"]
  }

  measure: fraction_count{
    type: count
    html:

    {% if state_selector._parameter_value == state._value %}
      <div style="background-color:gray; height:50px; width:100%;">
        <p style="height:50px;">{{count_male._rendered_value}} / {{rendered_value}} </p>
      </div>
    {% else %}
        <p style="height:50px;">{{count_male._rendered_value}} / {{rendered_value}} </p>
    {% endif %};;
  }

  measure: percent_metric{
    type: number
    value_format_name:  decimal_1
    sql: 100.0*${count_male} / NULLIF(${count},0) ;;
    html:     {% if state_selector._parameter_value == state._value %}
      <div style="background-color:gray; height:50px; width:100%;">
      <div style=" border-radius: 50%; color:white; background-color:lightgreen; height:50px;width:50px; text-align:center;">
            <p style= "font-size:16px; padding-top:10px; padding-bottom:10px;"><b>{{rendered_value}}</b></p>
          </div>
      </div>
    {% else %}
      <div style=" border-radius: 50%; color:white; background-color:lightgreen; height:50px;width:50px; text-align:center;">
            <p style= "font-size:16px; padding-top:10px; padding-bottom:10px;"><b>{{rendered_value}}</b></p>
          </div>
    {% endif %};;

  }

  measure: percent_metric_2{
    type: number
    value_format_name:  decimal_1
    sql:100.0*(1 - (${count_male} / NULLIF(${count},0))) ;;
    html:
    {% if state_selector._parameter_value == state._value %}
      <div style="background-color:gray; height:50px; width:100%;">
      <div style=" border-radius: 50%; color:white; background-color:lightgreen; height:50px;width:50px; text-align:center;">
            <p style= "font-size:16px; padding-top:10px; padding-bottom:10px;"><b>{{rendered_value}}</b></p>
          </div>
      </div>
    {% else %}
      <div style=" border-radius: 50%; color:white; background-color:lightgreen; height:50px;width:50px; text-align:center;">
            <p style= "font-size:16px; padding-top:10px; padding-bottom:10px;"><b>{{rendered_value}}</b></p>
          </div>
    {% endif %}
    ;;

    }
}
