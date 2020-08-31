application: jpmorgan {
  label: "JP Morgan"
  url: "http://localhost:8080/bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
   # allow_forms: yes
    #allow_same_origin: yes
    #core_api_methods: ["all_connections","search_folders", "run_inline_query", "me", "all_looks", "run_look"]
    #external_api_urls: ["http://127.0.0.1:3000", "http://localhost:3000", "https://*.googleapis.com", "https://*.github.com", "https://REPLACE_ME.auth0.com"]
    #oauth2_urls: ["https://accounts.google.com/o/oauth2/v2/auth", "https://github.com/login/oauth/authorize", "https://dev-5eqts7im.auth0.com/authorize", "https://dev-5eqts7im.auth0.com/login/oauth/token", "https://github.com/login/oauth/access_token"]
  }
}



application: ga360_audience_selector {
  label: "GA360 Audience Selector"
  #when dev complete will host from a file in the instance such as commented below
  # file: "js/ga_audience_selector.js"
  file: "js/send_filters.js"
#   url: "http://localhost:8080/bundle.js"
  #starting in 7.10 you will need to pay more attention to this "entitlements" parameter
  entitlements: {
    local_storage: yes
    }
}

application: dashboard_carousel {
  label: "Carousel"
  # url: "http://localhost:8080/bundle.js"
  file: "js/bundle.js"
}

application: ping_pong {
  label: "Ping Pong"
  # url: "http://localhost:8080/bundle.js"
  file: "js/pingpong.js"
}

visualization: {
  id: "ping_pong"
  url: "https://localhost:4443/web_component_latest.js"
  label: "Ping Pong"
  dependencies: [
     "https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.17/d3.min.js"
    ,"https://cdnjs.cloudflare.com/ajax/libs/d3/2.7.4/d3.layout.min.js"
  ]
}

#working example....
visualization: {
  id: "sankey"
  url: "https://localhost:8080/sankey.js"
  label: "Sankey"
}


application: hello_world {
  label: "Hello World"
  url: "http://localhost:8080/bundle.js"

}
