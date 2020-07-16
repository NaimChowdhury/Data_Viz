#
# This is the CLSAS Membership Dashboard
# To be hosted on shiny, accessible by password.
#
# 
#
# 
#

library(shiny)
library(shinydashboard)


# Define UI for application that draws a histogram
dashboardPage(
    dashboardHeader(title = "CLSAS Membership"),
    dashboardSidebar(
        sliderInput("size", "Size of Points:", min=0.2, max=5, value=2)
    ),
    dashboardBody(
        # Boxes need to be put in a row (or column)
        fluidRow(
            box(width=6, 
                status="info", 
                title="Plot",
                solidHeader = TRUE,
                plotOutput("myplot")
            ),
            box(width=6, 
                status="warning", 
                title = "Membership Data",
                solidHeader = TRUE, 
                collapsible = TRUE, 
                footer="Read Remotely from File",
                tableOutput("mydata")
            )
        ),
        ## Add some more info boxes
        fluidRow(
            valueBoxOutput(width=4, "nrows"),
            infoBoxOutput(width=6, "ncol")
        )
    )
)

