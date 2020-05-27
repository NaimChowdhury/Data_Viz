
# Define UI for application that draws a histogram
library(shiny)
shinyUI(
    fluidPage(
        titlePanel("Old Faithful Geyser Data"),
        sidebarLayout(
            sidebarPanel(
                sliderInput("bins",
                            "Number of Bins:",
                            min = 1,
                            max = 100,
                            value = 37),
                radioButtons("color", "Choose Color", 
                             choices = list(Red="red",Blue="blue", Gray="gray"),
                             selected="blue", inline=TRUE
                )
            ),
            mainPanel(
                plotOutput("distPlot")
            )
        )
    )
)
