  connection: "bfw_bq" include: "views/*"


explore: mock_data_pp {
}
explore: mock_data_pd {
  hidden: yes
}
explore: mock_data_aa {
  hidden: yes
}

explore: latest_pd {
  join: most_recent_pd {
      relationship: one_to_one
      type: inner
      sql_on: ${mock_data_pd.feature} = ${most_recent_pd.feature} AND  ${mock_data_pd.start_raw} = ${most_recent_pd.max_time_time_raw} ;;
  }
  hidden: yes
  from: mock_data_pd
  view_name: mock_data_pd
  always_join: [most_recent_pd]
}
explore: aa_pd {
  join: most_recent_aa {
      fields: []
      relationship: one_to_one
      type: inner
      sql_on: ${mock_data_aa.feature} = ${most_recent_aa.feature} AND  ${mock_data_aa.time_raw} = ${most_recent_aa.max_time_time_raw} ;;
  }
  join: latest_only_pd { relationship: many_to_one  sql_on: ${mock_data_aa.feature} = ${latest_only_pd.feature} ;; }
  view_name: mock_data_aa
  from: mock_data_aa
  always_join: [most_recent_aa]
  aggregate_table: auto_pylookml_2FKMHKq {
    query: {
      dimensions: []
      measures: [latest_only_pd.system_failure_cum_, latest_only_pd.system_other_failure_cum_, latest_only_pd.total_failures_cum_]
      description: "https://dat.dev.looker.com/x/2FKMHKq"
      filters: [ mock_data_aa.feature_clean:"Login_Login" ]
      limit: 5000
     }
    materialization: {
      sql_trigger_value: select 1 ;;
     } }
  aggregate_table: auto_pylookml_fZTrPmJ {
    query: {
      dimensions: [mock_data_aa.feature, mock_data_aa.customers, mock_data_aa.success_rate, latest_only_pd.system]
      measures: []
      description: "https://dat.dev.looker.com/x/fZTrPmJ"
#       filters: [ mock_data_aa.feature_selector:"Login_Login" ]
      limit: 5000
     }
    materialization: {
      sql_trigger_value: select 1 ;;
     } }
  aggregate_table: auto_pylookml_QsN5vnK {
    query: {
      dimensions: []
      measures: [mock_data_aa.step_1, mock_data_aa.step_2, mock_data_aa.step_3]
      description: "https://dat.dev.looker.com/x/QsN5vnK"
      filters: [ mock_data_aa.feature_clean:"Login_Login" ]
      limit: 5000
     }
    materialization: {
      sql_trigger_value: select 1 ;;
     } }
}
