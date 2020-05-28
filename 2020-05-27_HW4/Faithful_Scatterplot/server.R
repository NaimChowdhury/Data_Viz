library(shiny)
library(RColorBrewer)
library(ggplot2)
shinyServer(function(input, output, session) {
    output$scatterPlot <- renderPlot({
        p <- ggplot(faithful, aes(x = waiting, y = eruptions))+
            geom_point(shape = as.numeric(input$shape), color = input$color)
        return(p)
    })
})
