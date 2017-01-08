#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("cerulean"),
  
  # Application title
  titlePanel("Photogenic Finder"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       textInput("location",
                   "Location to search",
                   "UMass Amherst"),
       sliderInput("radius", "Radius to search", 1000, 5000, 1000)
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("resultPlot")
    )
  ),
  
  # https://stackoverflow.com/a/22475216
  tags$style(type="text/css", "
           #loadmessage {
             position: fixed;
             bottom: 0px;
             left: 25%;
             width: 50%;
             padding: 5px 0px 5px 0px;
             text-align: center;
             font-weight: bold;
             font-size: 100%;
             color: #000000;
             background-color: #888888;
             z-index: 105;
           }
  "),
  conditionalPanel(condition="$('html').hasClass('shiny-busy')",
                   tags$div("Loading...",id="loadmessage")
  )
))
