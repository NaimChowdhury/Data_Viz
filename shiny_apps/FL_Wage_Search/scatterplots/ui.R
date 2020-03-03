library(shiny)
library(plotly)
library(rsconnect)

shinyUI(
  fluidPage(
    titlePanel("Old Faithful Geyser Data"),
    sidebarLayout(
      sidebarPanel(
        selectInput(inputId = "color",
                    label = "Choose Color:",
                    choices = list("Red"="red", "Blue"="blue", "Green"="green", "Salmon"="salmon")
        ),
        radioButtons(inputId = "symbol", 
                     label = "Choose Plotting Symbol", 
                     choices = list(Circles=21, Squares=22, Triangles=24), 
                     inline = TRUE
        ),
        checkboxInput("linfit", "Linear Fit"),
        checkboxInput("smoothfit", "Smooth Fit")
      ),
      mainPanel(
        plotlyOutput("distPlot"),
        br(),
        conditionalPanel('input.symbol == "22"' ,
          h5(HTML("<u> <b> Parameter Estimates from Linear Regression Model: </b> </u>")),
          tableOutput("IntSlop")
        )
      )
    )
  )
)


## rsconnect;;deployApp('path/to/your/app')