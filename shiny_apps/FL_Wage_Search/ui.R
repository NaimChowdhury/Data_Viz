library(shiny)
library(DT)

shinyUI(
  fluidPage(
    h3("Florida Wage Data"),
    DTOutput("wagedata"),
    fluidRow(
      column(4, numericInput("hours", "Number of Hours", value=NA_real_, min=0)),
      column(4, numericInput("wage", "Hourly Wage Paid", value=0)),
      column(4, tableOutput("endresult"))
    )
  )
)