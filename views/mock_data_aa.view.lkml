view: mock_data_aa {
  derived_table: {
    persist_for: "24 hours"
    sql:
      SELECT
      1.58805E+12 AS rowtime, NULL AS rowkey, '2020-04-28T04:10:00.000Z' AS start_time, '2020-04-28T04:40:00.000Z' AS end_time, 'FA-UPI' AS feature, '2020-04-28 04:40:00FA-UPI' AS key, 6 AS failed_sessions, 36 AS successful_sessions, 2 AS failed_customers, 28 AS customers_attempted, 0.8571428571428571 AS success_rate, '2020-04-28 04:40:00' AS time, 10.623656153502322 AS yellow_fc_bound, 13.279570191877903 AS red_fc_bound, 0.4999999999999999 AS yellow_sr_bound, 0.3999999999999999 AS red_sr_bound, 0 AS aa_health, 45 AS step_1, 44 AS step_2, 44 AS step_3
      UNION ALL
      SELECT
      1.58805E+12 AS rowtime, NULL AS rowkey, '2020-04-28T04:10:00.000Z' AS start_time, '2020-04-28T04:40:00.000Z' AS end_time, 'FT-UPI' AS feature, '2020-04-28 04:40:00FT-UPI' AS key, 6 AS failed_sessions, 133 AS successful_sessions, 2 AS failed_customers, 83 AS customers_attempted, 0.9568345323741008 AS success_rate, '2020-04-28 04:40:00' AS time, 15.360157004026593 AS yellow_fc_bound, 26.88027475704654 AS red_fc_bound, 0.7747252747252747 AS yellow_sr_bound, 0.46483516483516485 AS red_sr_bound, 0 AS aa_health, 138 AS step_1, 138 AS step_2, 138 AS step_3
      UNION ALL
      SELECT
      1.58805E+12 AS rowtime, NULL AS rowkey, '2020-04-28T04:10:00.000Z' AS start_time, '2020-04-28T04:40:00.000Z' AS end_time, 'Login-Login' AS feature, '2020-04-28 04:40:00Login-Login' AS key, 796 AS failed_sessions, 814 AS successful_sessions, 709 AS failed_customers, 1347 AS customers_attempted, 0.5055900621118012 AS success_rate, '2020-04-28 04:40:00' AS time, 1010.4051570153113 AS yellow_fc_bound, 1768.2090247767946 AS red_fc_bound, 0.30210026028612424 AS yellow_sr_bound, 0.18126015617167454 AS red_sr_bound, 0 AS aa_health, 2849 AS step_1, 862 AS step_2, 0 AS step_3
      UNION ALL
      SELECT
      1.58805E+12 AS rowtime, NULL AS rowkey, '2020-04-28T04:10:00.000Z' AS start_time, '2020-04-28T04:40:00.000Z' AS end_time, 'FT-Mobile' AS feature, '2020-04-28 04:40:00FT-Mobile' AS key, 0 AS failed_sessions, 3 AS successful_sessions, 0 AS failed_customers, 3 AS customers_attempted, 1.0 AS success_rate, '2020-04-28 04:40:00' AS time, 3.116975189608875 AS yellow_fc_bound, 3.8962189870110935 AS red_fc_bound, 0.6571982098903336 AS yellow_sr_bound, 0.4928986574177502 AS red_sr_bound, 0 AS aa_health, 3 AS step_1, 3 AS step_2, 3 AS step_3
      UNION ALL
      SELECT
      1.58805E+12 AS rowtime, NULL AS rowkey, '2020-04-28T04:10:00.000Z' AS start_time, '2020-04-28T04:40:00.000Z' AS end_time, 'FT-Account' AS feature, '2020-04-28 04:40:00FT-Account' AS key, 4 AS failed_sessions, 295 AS successful_sessions, 3 AS failed_customers, 187 AS customers_attempted, 0.9866220735785953 AS success_rate, '2020-04-28 04:40:00' AS time, 13.70279272615339 AS yellow_fc_bound, 16.443351271384067 AS red_fc_bound, 0.890321186472887 AS yellow_sr_bound, 0.756773008501954 AS red_sr_bound, 0 AS aa_health, 298 AS step_1, 298 AS step_2, 298 AS step_3
      UNION ALL
      SELECT
      1.58805E+12 AS rowtime, NULL AS rowkey, '2020-04-28T04:10:00.000Z' AS start_time, '2020-04-28T04:40:00.000Z' AS end_time, 'FT-MMID' AS feature, '2020-04-28 04:40:00FT-MMID' AS key, 0 AS failed_sessions, 11 AS successful_sessions, 0 AS failed_customers, 7 AS customers_attempted, 1.0 AS success_rate, '2020-04-28 04:40:00' AS time, 6.0 AS yellow_fc_bound, 8.399999999999999 AS red_fc_bound, 0.85 AS yellow_sr_bound, 0.51 AS red_sr_bound, 0 AS aa_health, 11 AS step_1, 11 AS step_2, 11 AS step_3
;;
  }

  parameter: feature_selector {
    suggestions: [ "Login_Login", "FT_UPI", "FT_Mobile", "FT_MMID", "FT_Account", "FA_UPI"]
    type: unquoted
    default_value: "Login_Login"
  }

  dimension: rowtime {
    type: number
    sql: ${TABLE}.rowtime ;;
  }

  dimension: rowkey {
    type: string
    sql: ${TABLE}.rowkey ;;
  }

  dimension: start_time {
    type: string
    sql: ${TABLE}.start_time ;;
  }

  dimension: end_time {
    type: string
    sql: ${TABLE}.end_time ;;
  }

  dimension: feature {
    type: string
    sql: ${TABLE}.feature ;;
    html: <div style="{% if feature_selector._parameter_value == feature_clean._value %}background-color:#CCC; {% else %} {% endif %}height:50px; width:100%;">
         <a href='/dashboards/4?_carousel="{{ feature_clean._value }}"'>{{rendered_value}}</a>
      </div>;;
  }

  dimension: feature_clean {
    sql: replace(${feature},"-","_") ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: failed_sessions {
    type: number
    sql: ${TABLE}.failed_sessions ;;
  }

  dimension: successful_sessions {
    type: number
    sql: ${TABLE}.successful_sessions ;;
  }

  dimension: failed_customers {
    type: number
    sql: ${TABLE}.failed_customers ;;
  }

  dimension: customers {
    type: number
    sql: ${customers_attempted} ;;
    html:
      <div style="{% if feature_selector._parameter_value == feature_clean._value %}background-color:#CCC; {% else %} {% endif %}height:50px; width:100%;">
        <p style="height:50px;">{{failed_customers._rendered_value}} / {{rendered_value}} </p>
      </div>;;
  }

  dimension: customers_attempted {
    type: number
    sql: ${TABLE}.customers_attempted ;;
  }

  dimension: success_rate {
    value_format_name: "percent_1"
    type: number
    sql: ${TABLE}.success_rate ;;
    html:
    <div style="{% if feature_selector._parameter_value == feature_clean._value %}background-color:#CCC; {% else %} {% endif %} height:50px; width:100%;">
    <div style=" border-radius: 50%; color:white; background-color: {% if value > 0.5 %}lightgreen{% else %}red{% endif %}; height:50px;width:50px; text-align:center;">
    <p style= "font-size:16px; padding-top:10px; padding-bottom:10px;"><b>{{rendered_value}}</b></p>
    </div>
    </div>;;
  }

  dimension_group: time {
    type: time
    timeframes: [raw,time]
    sql: TIMESTAMP(${TABLE}.time) ;;
  }

  dimension: yellow_fc_bound {
    type: number
    sql: ${TABLE}.yellow_fc_bound ;;
  }

  dimension: red_fc_bound {
    type: number
    sql: ${TABLE}.red_fc_bound ;;
  }

  dimension: yellow_sr_bound {
    type: number
    sql: ${TABLE}.yellow_sr_bound ;;
  }

  dimension: red_sr_bound {
    type: number
    sql: ${TABLE}.red_sr_bound ;;
  }

  dimension: aa_health {
    type: number
    sql: ${TABLE}.aa_health ;;
  }

  dimension: step_1_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.step_1 ;;
  }
  measure: step_1 {
    type: max
    sql: ${step_1_raw} ;;
  }

  dimension: step_2_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.step_2 ;;
  }
  measure: step_2 {
    type: max
    sql: ${step_2_raw} ;;
  }
  dimension: step_3_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.step_3 ;;
  }
  measure: step_3 {
    type: max
    sql: ${step_3_raw} ;;
  }


  measure: count {
    type: count
  }
  measure: max_time {
    type: time
    sql: MAX(${time_raw}) ;;
  }
}
