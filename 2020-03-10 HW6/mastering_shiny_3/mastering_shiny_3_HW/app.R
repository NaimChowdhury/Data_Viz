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
  sliderInput("dates", "Date Range:", 
              min = lubridate::as_date("2020-01-01"),
              max = lubridate::as_date("2020-12-31"),
              value = lubridate::as_date("2020-08-19")
  )
)


server <- function(input, output, session) {
}


# Run the application 
shinyApp(ui, server)
