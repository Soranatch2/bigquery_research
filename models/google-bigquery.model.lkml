connection: "research-development-361301"

# include all the views
include: "/views/**/*.view"

datagroup: google-bigquery_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: google-bigquery_default_datagroup

explore: events_20220905 {
  join: events_20220905__items {
    view_label: "Events 20220905: Items"
    sql: LEFT JOIN UNNEST(${events_20220905.items}) as events_20220905__items ;;
    relationship: one_to_many
  }

  join: events_20220905__event_params {
    view_label: "Events 20220905: Event Params"
    sql: LEFT JOIN UNNEST(${events_20220905.event_params}) as events_20220905__event_params ;;
    relationship: one_to_many
  }

  join: events_20220905__user_properties {
    view_label: "Events 20220905: User Properties"
    sql: LEFT JOIN UNNEST(${events_20220905.user_properties}) as events_20220905__user_properties ;;
    relationship: one_to_many
  }
}

explore: events_intraday_20220906 {
  join: events_intraday_20220906__items {
    view_label: "Events Intraday 20220906: Items"
    sql: LEFT JOIN UNNEST(${events_intraday_20220906.items}) as events_intraday_20220906__items ;;
    relationship: one_to_many
  }

  join: events_intraday_20220906__event_params {
    view_label: "Events Intraday 20220906: Event Params"
    sql: LEFT JOIN UNNEST(${events_intraday_20220906.event_params}) as events_intraday_20220906__event_params ;;
    relationship: one_to_many
  }

  join: events_intraday_20220906__user_properties {
    view_label: "Events Intraday 20220906: User Properties"
    sql: LEFT JOIN UNNEST(${events_intraday_20220906.user_properties}) as events_intraday_20220906__user_properties ;;
    relationship: one_to_many
  }
}
