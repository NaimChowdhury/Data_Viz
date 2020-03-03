library(shiny)
library(DT)

shinyUI(
  navbarPage(
    title="2018 Florida Wage Data",
    tabPanel("Sarasota-Manatee-Bradendon",
      sidebarLayout(
        sidebarPanel(
          numericInput("hours","Number of Hours Worked", min=1, value=120),
          width=3
        ),
        mainPanel(
          DTOutput("wagedata")
        )
      )
    )
  )
)
