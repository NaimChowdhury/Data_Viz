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
library(tidyverse)

shinyServer(function(input, output, session) {
    
    df <- reactiveFileReader(
        intervalMillis = 10000, 
        session = session,
        filePath = './data/all_membership_info.csv',
        readFunc = read_csv)
    
    removed_empty_rows <- reactive({
        df() %>% filter_all(any_vars(!is.na(.)))
    })
    
    states_df <- reactive({
        removed_empty_rows() %>% 
            mutate(cnt = 1) %>% 
            mutate(Location = replace_na(`If located in the US, which state?`, 'YoverseasY')) %>% 
            select(Location, cnt) %>% 
            group_by(Location) %>% 
            summarise(total = sum(cnt))
    })
    
    output$statedata <-renderTable({states_df()})
    
    output$stateplot <- renderPlot({
        states_df <- states_df()
        p <- ggplot(data = states_df, aes(x = Location, y = total, fill = Location)) +
            geom_bar(stat = "identity") +
            labs(title = "Number of CLSAS Members by State", x = "Location", y = "Count")
        return(p)
    })
    
    output$nrows <- renderValueBox({
        nr <- nrow(removed_empty_rows())
        valueBox(
            value = nr,
            subtitle = "Number of Current Members",
            icon = icon("table"),
            color = if (nr <=6) "yellow" else "aqua"
        )
    })
    
    output$ncol <- renderInfoBox({
        nc <- ncol(df())
        infoBox(
            value = nc,
            title = "Columns",
            icon = icon("list"),
            color = "purple",
            fill=TRUE)
    })
    
})
