# If necessary, uncomment the line below to include explore_source.
# include: "dbs.model.lkml"

view: most_recent_aa {
  derived_table: {
    explore_source: mock_data_aa {
      column: feature {}
      column: max_time_time {}
    }
  }
  dimension: feature {}
  dimension_group: max_time_time {
    type: time
    timeframes: [raw,time]
  }
}

view: most_recent_pd {
  derived_table: {
    explore_source: mock_data_pd {
      column: max_time_time {}
      column: feature {}
    }
  }
  dimension_group: max_time_time {
    type: time
    timeframes: [raw,time]
  }
  dimension: feature {}
}


# If necessary, uncomment the line below to include explore_source.
# include: "dbs.model.lkml"

view: latest_only_pd {
  derived_table: {
    explore_source: latest_pd {
      column: api_calls_cum { field: mock_data_pd.api_calls_cum }
      column: api_success_excluding_all_error_cum { field: mock_data_pd.api_success_excluding_all_error_cum }
      column: api_success_excluding_sys_error_cum { field: mock_data_pd.api_success_excluding_sys_error_cum }
      column: api_success_excluding_sys_other_error_cum { field: mock_data_pd.api_success_excluding_sys_other_error_cum }
      column: avg_api_calls_per_min { field: mock_data_pd.avg_api_calls_per_min }
      column: end_time { field: mock_data_pd.end_time }
      column: feature {field: mock_data_pd.feature}
      column: key { field: mock_data_pd.key }
      column: red_failed_call_threshold { field: mock_data_pd.red_failed_call_threshold }
      column: red_sr_threshold { field: mock_data_pd.red_sr_threshold }
      column: rowkey { field: mock_data_pd.rowkey }
      column: rowtime { field: mock_data_pd.rowtime }
      column: sr_cum_excluding_all_error { field: mock_data_pd.sr_cum_excluding_all_error }
      column: sr_cum_excluding_sys_error { field: mock_data_pd.sr_cum_excluding_sys_error }
      column: start_time { field: mock_data_pd.start_time }
      column: system_failure_cum { field: mock_data_pd.system_failure_cum }
      column: system_other_failure_cum { field: mock_data_pd.system_other_failure_cum }
      column: total_failures_cum { field: mock_data_pd.total_failures_cum }
      column: yellow_failed_call_threshold { field: mock_data_pd.yellow_failed_call_threshold }
      column: yellow_sr_threshold { field: mock_data_pd.yellow_sr_threshold }
    }
  }
  dimension: api_calls_cum {
    type: number
  }
  dimension: api_success_excluding_all_error_cum {
    type: number
  }
  dimension: api_success_excluding_sys_error_cum {
    type: number
  }
  dimension: api_success_excluding_sys_other_error_cum {
    type: number
  }
  dimension: avg_api_calls_per_min {
    type: number
  }
  dimension: end_time {}
  dimension: key {}
  dimension: red_failed_call_threshold {
    type: number
  }
  dimension: red_sr_threshold {
    type: number
  }
  dimension: feature {}
  dimension: rowkey {}
  dimension: rowtime {
    type: number
  }
  dimension: sr_cum_excluding_all_error {
    type: number
  }
  dimension: sr_cum_excluding_sys_error {
    type: number
  }
  dimension_group: start_time {
    type: time
    timeframes: [raw,time]
  }
  dimension: system_failure_cum {
    type: number
  }
  dimension: system_other_failure_cum {
    type: number
  }
  dimension: total_failures_cum {
    type: number
  }
  dimension: yellow_failed_call_threshold {
    type: number
  }
  dimension: yellow_sr_threshold {
    type: number
  }
}
