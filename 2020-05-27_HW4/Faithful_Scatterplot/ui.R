
# Define UI for application that draws a histogram
library(shiny)
library(RColorBrewer)
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
                selectInput("color", "Choose Color", 
                             choices = brewer.pal(n = 8, name = "Dark2"),
                             selected="#7570B3",
                ),
            ),
            mainPanel(
                plotOutput("distPlot")
            )
        )
    )
)
