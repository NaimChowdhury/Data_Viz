#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(ggplot2)
library(readr)

shinyServer(function(input, output, session) {
    
    df <- reactiveFileReader(
        intervalMillis = 10000, 
        session = session,
        filePath = './data/membership_data.csv',
        readFunc = read_csv)
    
    output$mydata <-renderTable({df()})
    
    output$myplot <- renderPlot({
        df <- df()
        #p <- ggplot()
        # return(p)
    })
    
    output$nrows <- renderValueBox({
        nr <- nrow(df())
        valueBox(
            value = nr,
            subtitle = "Number of Rows",
            icon = icon("table"),
            color = if (nr <=6) "yellow" else "aqua"
        )
    })
    
    output$ncol <- renderInfoBox({
        nc <- ncol(df())
        infoBox(
            value = nc,
            title = "Colums",
            icon = icon("list"),
            color = "purple",
            fill=TRUE)
    })
    
})
