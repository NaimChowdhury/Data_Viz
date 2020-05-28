
# Define UI for application that draws a histogram
library(shiny)
library(RColorBrewer)
shinyUI(
    fluidPage(
        titlePanel("Old Faithful Geyser Data"),
        sidebarLayout(
            sidebarPanel(
                selectInput("color", "Choose Color", 
                             choices = brewer.pal(n = 8, name = "Dark2"),
                             selected="#7570B3",
                ),
                selectInput("shape", "Choose Shape",
                            choices = list(Circle = 16, Square = 15, Diamond = 18, Triangle = 17)
                            )
            ),
            mainPanel(
                plotOutput("scatterPlot")
            )
        )
    )
)
