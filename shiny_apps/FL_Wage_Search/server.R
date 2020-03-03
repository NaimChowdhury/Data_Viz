library(shiny)
library(DT)
library(readr)

df <- read_csv('./data/FL2018Wages.csv') 

shinyServer(function(input, output, session) {
  
  output$wagedata <- renderDT({
    df <- datatable(df,  filter = 'top')
    return(df)
  })
  
})