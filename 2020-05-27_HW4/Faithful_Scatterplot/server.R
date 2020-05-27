library(shiny)
shinyServer(function(input, output, session) {
    output$distPlot <- renderPlot({
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        p <- hist(x, breaks = bins, col = input$color, border = 'white')
        return(p)
    })
})
