#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
  sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
  sliderInput("y", label = "and y is", min = 1, max = 50, value = 20),
  "then, x multipled by y is",
  textOutput("product")
)

server <- function(input, output, session) {
  output$product <- renderPrint({ 
    (input$x)*(input$y)
  })
}


# Run the application 
shinyApp(ui, server)
