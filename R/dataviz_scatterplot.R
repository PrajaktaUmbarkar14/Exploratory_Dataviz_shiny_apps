# load required libraries
library(shiny)
library(ggplot2)

# define UI block
ui <- fluidPage(
  titlePanel(" scatter plot"),
  sidebarLayout(
    sidebarPanel(
      selectInput("xvar", "X-axis variable:", choices = names(airquality), selected = "Ozone"),
      selectInput("yvar", "Y-axis variable", choices = names(airquality), selected =  "Temp"),
      selectInput("color", "Select color variable", choices = names(airquality), selected =  "Month")
    ),
    mainPanel(
      plotOutput("scatterplot")
    )
  )
)

# define server block 
server <- function(input, output, session) {
  output$scatterplot <- renderPlot({
    df <- airquality
    ggplot(df, aes(x = .data[[input$xvar]], y = .data[[input$yvar]], colour = as.factor(.data[[input$color]]))) +
      geom_point() +
      labs(title = paste("scatter plot of", input$xvar, "Vs", input$yvar),
           x_axis = input$xvar,
           y_axis = input$yvar) +
    theme_minimal()
  })
}

shinyApp(ui = ui, server = server)