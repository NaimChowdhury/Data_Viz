library(shiny)
library(ggplot2)
library(plotly)

shinyServer(function(input, output, session) {
  
  output$distPlot <- renderPlotly({
    p <- ggplot(data=faithful, aes(x=eruptions, y=waiting)) +
           geom_point(color="black", 
                      fill=input$color, 
                      shape=as.numeric(input$symbol))
    if(input$linfit) p <- p + geom_smooth(method="lm")
    if(input$smoothfit) p <- p + geom_smooth(color="Salmon")
    
    return(ggplotly(p))
  })
  
  output$IntSlop <- renderTable({
    fit <- lm(waiting~eruptions, data=faithful)
    coef <- coefficients(fit)
    df <- data.frame(Intercept=coef[1], Slope=coef[2])
  },
  digits=4,
  stripe=TRUE,
  bordered = TRUE)
  
})