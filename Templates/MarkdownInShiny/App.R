library(shinydashboard)
library(shiny)

#---- Define UI ----
# Read in header, sidebar, and body definitions
source("UIDefinitiones.R")

ui.obj <- dashboardPage(
  header = app.header,
  sidebar = app.sidebar,
  body = app.body,
  skin="green"
)
#---- End UI ----


#---- Define Server ----

server.obj <-
  function(input, output, session){

  }

#---- End Server ----

#---- Run Shiny App ----
shinyApp(ui.obj, server.obj)
#-----------------------
