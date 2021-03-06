# Functions to generate/remove UI


todayUI <- tabsetPanel(
  tabPanel(
    "Cases world map",
    fluidRow(
      htmlOutput("lastUpdate")
      # h2(paste("The latest update of the data is on the", 
      #         todayData$Last_Update[1]))
    ),
      htmlOutput("displayInfo"),
      absolutePanel(
        #bottom = 0, left = 50, top = 200,
        draggable = TRUE,
        selectInput("dataSource", label = "Which Data", 
                    choices = c("Confirmed", "Deaths", "Recovered"),
                    selected = "Confirmed"),
        uiOutput("selectRegions"),
        actionButton("clearMap", "Clear"),
        style = "opacity: 0.92; z-index:500;"
      ),
      leafletOutput("worldMap", width = 1200, height=600)
    # sidebarLayout(
    #   sidebarPanel(
    #     width = 3,
    #     selectInput("dataSource", label = "Which Data", 
    #                 choices = c("Confirmed", "Deaths", "Recovered"),
    #                 selected = "Confirmed"),
    #     uiOutput("selectRegions"),
    #     actionButton("clearMap", "Clear")
    #   ),
    #   mainPanel(
    #     width = 9,
    #     leafletOutput("worldMap", width = 1200, height=800)
    #   )
    # )
  ),
  tabPanel(
    "World Statistics",
    fluidRow(
      column(
        6,
        highchartOutput("boxPlotContinentsCases")
      ),
      column(
        6,
        highchartOutput("boxPlotContinentDeaths")
      )
    ),
    fluidRow(
      column(12, includeMarkdown("R/ui/byCountry.Rmd"))
    ),
    fluidRow(
      column(6,
      highchartOutput("treeMap")
    ),
    column(6, 
           highchartOutput("treemapRatio")
           )
  )
)
)
