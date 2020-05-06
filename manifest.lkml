application: dashboard_carousel {
  label: "Carousel"
  # url: "http://localhost:8080/bundle.js"
  file: "js/bundle.js"
}

application: ping_pong {
  label: "Ping Pong"
  url: "http://localhost:8080/bundle.js"
  # file: "js/bundle.js"
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
