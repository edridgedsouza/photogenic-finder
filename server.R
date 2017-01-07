#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
source("./helpers/get-data.R")
source("./helpers/plot-points.R")
source("./helpers/find-coords.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$resultPlot <- renderPlot({
    
    # Generate coordinates based on input query
    coordinates <- getCoords(input$location)
    if ((coordinates != FALSE) %>% all){
      longitude <- coordinates$longitude
      latitude <- coordinates$latitude
      
      makePlot(lat = latitude, long = longitude, dist = input$radius)
    }
    else {
      NULL
    }
    
  })
  
})
