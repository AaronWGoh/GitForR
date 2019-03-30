library(shiny)
library(shinydashboard)
library(shinythemes)
library(tidyverse)

#Map box outputs for generic purposes
value <- map(1:6, function(.x) {
  uiOutput(paste0(.x))
})


body <- dashboardBody(
  fluidPage(  
    #Includes the Bootstrap styling
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "css/main.css")
    ),
            
    #Define the dropdown menu 
    selectInput("boxId", "Fill a Box:",
                c("Select an option", "1", "2", "3", "4", "5", "6", "7")
    ),
    
    br(), #Space out between the dropdown
    
    #Creates two rows with 2 boxes per row
    tags$div(class="container-fluid",
      fluidRow(
        tags$div(id="standard-box", class = "col-sm-3 row1 label1"),
        tags$div(id="standard-box", class = "col-sm-3 row1 label2",
                 tags$p("Healthy Beginnings")
        ),
        tags$div(id="standard-box", class = "col-sm-3 row1 label3",
                 tags$p("Supported Families")
        ),
        tags$div(id="standard-box", class = "col-sm-3 row1 label4",
                 tags$p("Quality Care and Learning")
        )
      ),
      fluidRow(
        tags$div(id="standard-box", class = "col-sm-3 row1 label1",
                 tags$p("Child Family and Outcomes")
        ),
        tags$div(id="standard-box", class = "col-sm-3 row1 label2",
                 uiOutput("box1")
        ),
        tags$div(id="standard-box", class = "col-sm-3 row1 label3",
                 uiOutput("box2")
        ),
        tags$div(id="standard-box", class = "col-sm-3 row1 label4",
                 uiOutput("box3")
        )
      ),
      fluidRow(
        tags$div(id="standard-box", class = "col-sm-3 row3 label1",
                 tags$p("Prenatal to Three Program and Policy Expansion")
        ),
        tags$div(id="standard-box", class = "col-sm-3 row3 label2",
                 uiOutput("box4")
        ),
        tags$div(id="standard-box", class = "col-sm-3 row3 label3",
                 uiOutput("box5"), style= "border-"
        ),
        tags$div(id="standard-box", class = "col-sm-3 row3 label4",
                 uiOutput("box6")
        )
      ),
      fluidRow(
        tags$div(id="standard-box", class = "col-sm-3 row4 label1",
                 tags$p("Prenatal to Three Systems")
        ),
        tags$div(id="standard-box", class = "row col-sm-9 row4 label2",
                 uiOutput("box7")
        )
      )
    )
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
  map(.x = 1:7, .f = function(.x) { # The .x argument is the list/vector the map function (btw map is from purrr library-very useful) iterates over.
    output[[paste0("box", .x)]] <- renderUI({ # paste0 concatenates vectors after converting to character.
      #Case where there should be a checkmark
      if (input$boxId == paste0(.x)) {
        icon("ok", lib = "glyphicon")
      }
    })
  })
}

#####################

# Run the application 
shinyApp(ui = ui, server = server)

