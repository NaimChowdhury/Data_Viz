library(shiny)
library(DT)
library(readr)

df <- read_csv('./data/FL2018Wages.csv') 

shinyServer(function(input, output, session) {
  
  output$wagedata <- renderDT({
    df <- datatable(df,  filter = 'top')
    return(df)
  })
  
  output$endresult <- renderText({
    hours <- input$hours
    wages <- input$wage
    earnings <- hours * wages
    print(c('The total earnings of working ', hours, ' hours at $', wages, ' dollars per hour is $', earnings, 'before tax.'))
  })
  
})