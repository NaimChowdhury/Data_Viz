library(shiny)
library(RColorBrewer)
library(ggplot2)
shinyServer(function(input, output, session) {
    output$scatterPlot <- renderPlot({
        x <- faithful[,1]
        y <- faithful[,2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        p <- ggplot(faithful, aes(x = waiting, y = eruptions))+
            geom_point(shape = as.numeric(input$shape), color = input$color)
        return(p)
    })
})
