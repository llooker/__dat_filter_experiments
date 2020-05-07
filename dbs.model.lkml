connection: "bfw_bq"
include: "views/*"


explore: mock_data_pp {}

explore: mock_data_pd {hidden:yes}
explore: mock_data_aa {hidden:yes}


explore: latest_pd {
  hidden: yes
  from: mock_data_pd
  view_name: mock_data_pd
  always_join: [most_recent_pd]
  join: most_recent_pd {
    relationship: one_to_one
    type: inner
    sql_on: ${mock_data_pd.feature} = ${most_recent_pd.feature} AND  ${mock_data_pd.start_raw} = ${most_recent_pd.max_time_time_raw};;
  }
}

explore: aa_pd {
  view_name: mock_data_aa
  from: mock_data_aa
  always_join: [most_recent_aa]
  join: most_recent_aa {
    fields: []
    relationship: one_to_one
    type: inner
    sql_on: ${mock_data_aa.feature} = ${most_recent_aa.feature} AND  ${mock_data_aa.time_raw} = ${most_recent_aa.max_time_time_raw};;
  }
  join: latest_only_pd {
    relationship: many_to_one
    sql_on:  ${mock_data_aa.feature} = ${latest_only_pd.feature} ;;
  }
}
