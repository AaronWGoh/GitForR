library(shiny)
library(shinydashboard)
library(shinythemes)
library(tidyverse)

body <- dashboardBody(
  #Define the dropdown menu 
  selectInput("boxId", "Fill a Box:",
              c("Select an option", "1", "2", "3", "4")
  ),
  
  #Creates two rows with 2 boxes per row
  fluidRow(
    uiOutput("box1"),
    uiOutput("box2")
  ),
  fluidRow(
    uiOutput("box3"),
    uiOutput("box4")
  )
)
    

# Define UI 
ui <- ## Body content
  dashboardPage(
    dashboardHeader(title = "Dynamic Dropdown Injection"),
    dashboardSidebar(disable = TRUE),
    body
  )

###############################3

# Define server logic
server <- function(input, output) {
  # Experimenting on making code below more generic
  # for (x in 1:4) {local({
  #   i <- x
  #   output[[paste('result', i, sep='')]] <- reactive(function(){
  #     if (input[[paste('run', i, sep='')]] == 0)
  #       return()
  #     return(isolate({
  #       runCode(input[[paste('code', i, sep='')]])
  #     }))
  #   })
  # })}
  
  output$box1 <- renderUI({
    if (input$boxId == "1") {
      box(title = "Box 1", width = 4, height = 80, solidHeader = TRUE, status = "primary", align = "center", icon("ok", lib = "glyphicon"))
    } else {
      box(title = "Box 1", width = 4, height = 80, solidHeader = TRUE, status = "primary")
    }
  })
  output$box2 <- renderUI({
    if (input$boxId == "2") {
      box(title = "Box 2", width = 4, height = 80, solidHeader = TRUE, status = "primary", align = "center", icon("ok", lib = "glyphicon"))
    } else {
      box(title = "Box 2", width = 4, height = 80, solidHeader = TRUE, status = "primary")
    }
  })
  output$box3 <- renderUI({
    if (input$boxId == "3") {
      box(title = "Box 3", width = 4, height = 80, solidHeader = TRUE, status = "primary", align = "center", icon("ok", lib = "glyphicon"))
    } else {
      box(title = "Box 3", width = 4, height = 80, solidHeader = TRUE, status = "primary")
    }
  })
  output$box4 <- renderUI({
    if (input$boxId == "4") {
      box(title = "Box 4", width = 4, height = 80, solidHeader = TRUE, status = "primary", align = "center", icon("ok", lib = "glyphicon"))
    } else {
      box(title = "Box 4", width = 4, height = 80, solidHeader = TRUE, status = "primary")
    }
  })
}

#####################

# Run the application 
shinyApp(ui = ui, server = server)

