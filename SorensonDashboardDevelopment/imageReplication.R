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
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "css/bootstrap.css")
    ),
            
    #Define the dropdown menu 
    selectInput("boxId", "Fill a Box:",
                c("Select an option", "1", "2", "3", "4", "5", "6", "7")
    ),
    
    br(), #Space out between the dropdown
    
    #Creates two rows with 2 boxes per row
    tags$div(class="container", id="imageInfo",
      fluidRow(
        tags$div(id="standard-box", class = "col-3 row1 col1 box1"),
        tags$div(id="standard-box", class = "col-3 row1 col2 label1 box2",
           tags$div(class = "content", 
              tags$p("Healthy Beginnings")
           )
        ),
        tags$div(id="standard-box", class = "col-3 row1 col3 label2 box3 ",
           tags$div(class = "content", 
              tags$p("Supported Families")
           )
        ),
        tags$div(id="standard-box", class = "col-3 row1 col4 label3 box4",
           tags$div(class = "content", 
              tags$p("Quality Care and Learning")
           )
        )
      ),
      fluidRow(
        tags$div(id="standard-box", class = "col-3 row2 col1 label1 box5",
           tags$div(class = "content", 
              tags$p("Child Family and Outcomes")
           )
        ),
        tags$div(id="standard-box", class = "col-3 row2 col2 box6",
           tags$div(class = "content icon-content", 
              uiOutput("box1")
           )
        ),
        tags$div(id="standard-box", class = "col-3 row2 col3 box7",
           tags$div(class = "content icon-content", 
              uiOutput("box2")
           )
        ),
        tags$div(id="standard-box", class = "col-3 row2 col4 box8",
           tags$div(class = "content icon-content", 
              uiOutput("box3")
           )
        )
      ),
      fluidRow(
        tags$div(id="standard-box", class = "col-3 row3 col1 label1 box9",
           tags$div(class = "content", 
              tags$p("Prenatal to Three Program and Policy Expansion")
           )
        ),
        tags$div(id="standard-box", class = "col-3 row3 col2 box10",
           tags$div(class = "content icon-content", 
              uiOutput("box4")
           )
        ),
        tags$div(id="standard-box", class = "col-3 row3 col3 box11",
           tags$div(class = "content icon-content", 
              uiOutput("box5")
           )
        ),
        tags$div(id="standard-box", class = "col-3 row3 col4 box12",
           tags$div(class = "content icon-content", 
              uiOutput("box6")
           )
        )
      ),
      fluidRow(
        tags$div(id="standard-box", class = "col-3 row4 col1 label1 box13",
           tags$div(class = "content", 
              tags$p("Prenatal to Three Systems")
           )
        ),
        tags$div(id="long-box", class = "col-9 row4 col2 box14",
           tags$div(class = "content icon-content", 
              uiOutput("box7")
           )
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

###############################

# Define server logic
server <- function(input, output) {
  map(.x = 1:7, .f = function(.x) { # The .x argument is the list/vector the map function (btw map is from purrr library-very useful) iterates over.
    output[[paste0("box", .x)]] <- renderUI({ # paste0 concatenates vectors after converting to character.
      #Case where there should be a checkmark
      if (input$boxId == paste0(.x)) {
        icon("remove", lib = "glyphicon")
      }
    })
  })
}

#####################
# Run the application 
shinyApp(ui = ui, server = server)
