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
  url: "https://localhost:4443/web_component.js"
  label: "Ping Pong"
}

#working example....
visualization: {
  id: "sankey"
  url: "https://localhost:8080/sankey.js"
  label: "Sankey"
}
