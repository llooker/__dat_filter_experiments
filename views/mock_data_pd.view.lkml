view: mock_data_pd {
  derived_table: {
    persist_for: "24 hours"
    sql:
      SELECT
      1.58805E+12 AS rowtime, '2020-04-28 04:38:00FA-UPI' AS rowkey, '2020-04-28T04:08:00.000Z' AS start_time, '2020-04-28T04:38:00.000Z' AS end_time, 'FA-UPI' AS feature, NULL AS key, 26 AS api_calls_cum, 24 AS api_success_excluding_all_error_cum, 0 AS system_failure_cum, 26 AS api_success_excluding_sys_error_cum, 26 AS api_success_excluding_sys_other_error_cum, 0.8666666666666667 AS avg_api_calls_per_min, 0 AS system_other_failure_cum, 2 AS total_failures_cum, 1.0 AS sr_cum_excluding_sys_error, 0.9230769230769231 AS sr_cum_excluding_all_error, 0.9 AS red_sr_threshold, 10 AS red_failed_call_threshold, 0.45 AS yellow_sr_threshold, 10 AS yellow_failed_call_threshold
      UNION ALL
      SELECT
      1.58805E+12 AS rowtime, '2020-04-28 04:38:00Login-Login' AS rowkey, '2020-04-28T04:08:00.000Z' AS start_time, '2020-04-28T04:38:00.000Z' AS end_time, 'Login-Login' AS feature, NULL AS key, 1450 AS api_calls_cum, 1331 AS api_success_excluding_all_error_cum, 29 AS system_failure_cum, 1421 AS api_success_excluding_sys_error_cum, 1421 AS api_success_excluding_sys_other_error_cum, 48.333333333333336 AS avg_api_calls_per_min, 29 AS system_other_failure_cum, 119 AS total_failures_cum, 0.98 AS sr_cum_excluding_sys_error, 0.9179310344827586 AS sr_cum_excluding_all_error, 0.98 AS red_sr_threshold, 300 AS red_failed_call_threshold, 0.9 AS yellow_sr_threshold, 300 AS yellow_failed_call_threshold
      ;;
  }

  dimension: rowtime {
    type: number
    sql: ${TABLE}.rowtime ;;
  }

  dimension: rowkey {
    type: string
    sql: ${TABLE}.rowkey ;;
  }

#   dimension: start_time {
#     type: string
#     sql: ${TABLE}.start_time ;;
#   }


  dimension_group: start {
    type: time
    timeframes: [raw,time]
    sql: TIMESTAMP(${TABLE}.start_time) ;;
  }

  dimension: end_time {
    type: string
    sql: ${TABLE}.end_time ;;
  }

  dimension: feature {
    type: string
    sql: ${TABLE}.feature ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: api_calls_cum {
    type: number
    sql: ${TABLE}.api_calls_cum ;;
  }

  dimension: api_success_excluding_all_error_cum {
    type: number
    sql: ${TABLE}.api_success_excluding_all_error_cum ;;
  }

  dimension: system_failure_cum {
    type: number
    sql: ${TABLE}.system_failure_cum ;;
  }

  dimension: api_success_excluding_sys_error_cum {
    type: number
    sql: ${TABLE}.api_success_excluding_sys_error_cum ;;
  }

  dimension: api_success_excluding_sys_other_error_cum {
    type: number
    sql: ${TABLE}.api_success_excluding_sys_other_error_cum ;;
  }

  dimension: avg_api_calls_per_min {
    type: number
    sql: ${TABLE}.avg_api_calls_per_min ;;
  }

  dimension: system_other_failure_cum {
    type: number
    sql: ${TABLE}.system_other_failure_cum ;;
  }

  dimension: total_failures_cum {
    type: number
    sql: ${TABLE}.total_failures_cum ;;
  }

  dimension: sr_cum_excluding_sys_error {
    type: number
    sql: ${TABLE}.sr_cum_excluding_sys_error ;;
  }

  dimension: sr_cum_excluding_all_error {
    type: number
    sql: ${TABLE}.sr_cum_excluding_all_error ;;
  }

  dimension: red_sr_threshold {
    type: number
    sql: ${TABLE}.red_sr_threshold ;;
  }

  dimension: red_failed_call_threshold {
    type: number
    sql: ${TABLE}.red_failed_call_threshold ;;
  }

  dimension: yellow_sr_threshold {
    type: number
    sql: ${TABLE}.yellow_sr_threshold ;;
  }

  dimension: yellow_failed_call_threshold {
    type: number
    sql: ${TABLE}.yellow_failed_call_threshold ;;
  }

  measure: count {
    type: count
  }

  measure: max_time {
    type: time
    sql: MAX(${start_raw}) ;;
  }
}
