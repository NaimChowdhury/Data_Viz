#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage( #layout function that sets up basic visuals tructure
#input control that lets the user interact with the app by providing a value
    selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
    verbatimTextOutput("summary"), # output controls that tell shiny where to put the rendered output
    tableOutput("table")
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
}

# Run the application 
shinyApp(ui, server)
