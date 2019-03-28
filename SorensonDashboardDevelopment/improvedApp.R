library(shiny)
library(shinydashboard)
library(shinythemes)
library(tidyverse)

#Creates two rows with 2 boxes per row
value <- map(1:4, function(.x) {
  uiOutput(paste0(.x))
})

# UI output
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


# UI SIDE
ui <- ## Body content
  dashboardPage(
    dashboardHeader(title = "Dynamic Dropdown Injection"),
    dashboardSidebar(disable = TRUE),
    body
  )


# SERVER SIDE
server <- function(input, output) {
  map(.x = 1:4, .f = function(.x) { # The .x argument is the list/vector the map function (btw map is from purrr library-very useful) iterates over.
    output[[paste0("box", .x)]] <- renderUI({ # paste0 concatenates vectors after converting to character.
      if (input$boxId == paste0(.x)) {
        box(title = paste0("Box ", .x), width = 4, height = 80, solidHeader = TRUE, status = "primary", align = "center", icon("ok", lib = "glyphicon"))
      } else {
        box(title = paste0("Box ", .x), width = 4, height = 80, solidHeader = TRUE, status = "primary")
      }
    })
  } )
}


# Run the application 
shinyApp(ui = ui, server = server)

