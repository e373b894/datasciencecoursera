library(shiny)
library(shinyIncubator)

shinyUI(fluidPage(
  progressInit(),
  
  # Application title
  titlePanel("Word Cloud"),
  
#  headerPanel(
#              h4(":"),
#              h5("Select a document list from the dropdown.  Click change after your selection. Use the sliders to set the min word frequency and the max number of words."),
#              ),
  
  # Sidebar with a slider and selection inputs
  sidebarPanel(width = 5,
               selectInput("selection", "Choose a data set:", 
                           choices = datasets),
               actionButton("update", "Change"),
               hr(),
               sliderInput("freq", 
                           "Minimum Frequency:", 
                           min = 1,  max = 50, value = 15),
               sliderInput("max", 
                           "Maximum Number of Words:", 
                           min = 1,  max = 300,  value = 100)

  ),
  
  # Show Word Cloud
  mainPanel(
    h4("Documentation:"),
    h5("Select a document list from the dropdown.  Click change after your selection. Use the sliders to set the min word frequency and the max number of words."),
    plotOutput("plot")
    
  )
))