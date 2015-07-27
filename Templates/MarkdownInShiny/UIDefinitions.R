
# valid colors: red, yellow, aqua, blue, light-blue, green, navy, teal, olive, lime, orange, fuchsia, purple, maroon, black

# icons can come from fontawesome.io/icons or getbootstrap.com/components/#glyphicons
# icon("calendar", "fa-3x") - font awesome, 3x icon size
# icon("cog", lib = "glyphicon") - glyphicon library


#----- Header -----
app.header <-
  dashboardHeader(
#     # Dropdown menus go here
#     dropdownMenu(
#       # messageItems go here
#       type = "messages",
#       badgeStatus = "primary", # bootstrap status/button type (primary, success, info, warning, danger)
#       icon = NULL # bootstrap icon (default chosen by task type)
#     ),
#     dropdownMenu(
#       # notificationItems go here
#       type = "notifications",
#       badgeStatus = "primary", # bootstrap status/button type (primary, success, info, warning, danger)
#       icon = NULL # bootstrap icon (default chosen by task type)
#     ),
#     dropdownMenu(
#       # taskItems go here
#       type = "tasks",
#       badgeStatus = "primary", # bootstrap status/button type (primary, success, info, warning, danger)
#       icon = NULL # bootstrap icon (default chosen by task type)
#     ),
    title = "Dynamic Documents",
    disable = FALSE
  )

#----- Sidebar -----
app.sidebar <-
  dashboardSidebar(
    sidebarMenu(
      id = NULL,
      # Menu Items
      menuItem(
        tabName = "textInput",
        text = "Input Today's Values",
        # MenuSubItems?
        icon = icon("pencil", lib="font-awesome")
      ),
      menuItem(
        tabName = "internal",
        text = "Internal Report",
        # MenuSubItems?
        icon = icon("bolt", lib="font-awesome")
      ),
      menuItem(
        tabName = "external",
        text = "External Report",
        # MenuSubItems?
        icon = icon("globe", lib="font-awesome")
      )
      # menuItem(
      #   text=NULL,
      #   # MenuSubItems?
      #   icon=NULL,
      #   badgeLabel=NULL,
      #   badgeColor=NULL,
      #   tabName=NULL,
      #   href=NULL, # not compatible with tabName
      #   newtab=TRUE, # if href is supplied, should open in new tab?
      #   selected=NULL # should this menu item be selected initially?
      # ),
      # menuSubItem(
      #   text = NULL,
      #   # MenuSubItems?
      #   icon = NULL,
      #   badgeLabel = NULL,
      #   badgeColor = NULL,
      #   tabName = NULL,
      #   href = NULL,
      #   newtab = TRUE, # if href is supplied, should open in new tab?
      #   selected = NULL # should this menu item be selected initially?
      # ),
    )
  )

#----- Body -----
# Read in template for text input
template.text <- readLines("testInput.txt")

app.body <-
  dashboardBody(
    tabItems(
      # Text Input content
      tabItem(
        tabName = "textInput",
        fluidRow(
          tags$textarea(id="textfile", rows=10, cols=40, paste(template.text, collapse="\n"))
        )
      ),
      # Output format 1 content
      tabItem(
        tabName = "internal",
        fluidRow(

        )
      ),
      # Output format 2 content
      tabItem(
        tabName = "external",
        fluidRow(

        )
      )
    )
    #
    # # fluidRows, then boxes within the fluidRows (or columns and boxes within columns)
    # fluidRow(
    #   box(
    #     # Contents of the box go here
    #     title = NULL,
    #     footer = NULL,
    #     status = NULL, #
    #     solidHeader = TRUE,
    #     background = NULL,
    #     width = 4,
    #     height = NULL,
    #     collapsible = TRUE,
    #     collapse = FALSE
    #   ),
    #   tabBox(
    #     # Contents go here - tabPanel elements
    #     id = NULL, # Determine which tab is active
    #     selected = NULL,
    #     title = NULL,
    #     width = 4,
    #     height = NULL,
    #     side = "left" # or right
    #   ),
    #   infoBox(
    #     # displays a large icon on the left and a title, value (number) and smaller subtitle on the right
    #     title = "",
    #     value = NULL,
    #     subtitle = NULL,
    #     icon = shiny::icon("bar-chart"),
    #     color = "aqua",
    #     width = 2,
    #     href = NULL,
    #     fill = FALSE
    #   ),
    #   valueBox(
    #     # Displays a value in large text with a smaller subtitle underneath and a large icon on the right side
    #     value = "",
    #     subtitle = NULL,
    #     icon = NULL,
    #     color = "orange",
    #     width = 2,
    #     href = NULL
    #   )
    # )
  )
