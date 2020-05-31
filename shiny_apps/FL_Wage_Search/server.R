library(shiny)
library(DT)
library(readr)
library(tidyverse)

df <- read_csv('./data/FL2018Wages.csv') 

shinyServer(function(input, output, session) {
  
  output$endresult <- renderText({
    hours <- input$hours
    wages <- input$wage
    earnings <- hours * wages
    print(c('The total earnings of working ', hours, ' hours at $', wages, ' dollars per hour is $', earnings, 'before tax.'))
  })

  output$wagedata <- renderDT({
    wagetype = input$wagetype
    df <- df %>% 
      select(Code, Title, wagetype) %>% 
      mutate('Earnings by No. of Hrs' = input$hours * as.numeric(wagetype))
    df <- datatable(df,  filter = 'top')
    return(df)
  })
  

  
})