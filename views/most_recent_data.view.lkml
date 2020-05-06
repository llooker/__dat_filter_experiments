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
