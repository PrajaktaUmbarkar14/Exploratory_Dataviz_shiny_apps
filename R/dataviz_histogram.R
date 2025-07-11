library(shiny)
library(ggplot2)

# load the data
df <- mtcars

# Visualize the data using shiny app
ui <- fluidPage(
  titlePanel("Data Visualization"),
  sidebarLayout(
    sidebarPanel(
      selectInput("xvar", "X-axis variable", choices = names(df), selected = "mpg"),
      selectInput("color", "color_by", choices = c("red", "green", "pink"), selected = "pink"),
      sliderInput("bins", "Number of bins:", min = 1, max = 20, value = 3)),
     
     mainPanel(plotOutput("Histogram"))
  )
)

server <- function(input, output) {
  
  output$Histogram <- renderPlot({
    ggplot(df, aes_string(x = input$xvar)) +
      geom_histogram(binwidth = input$bins, fill = input$color, color = "black") +
      labs(title = paste("Histogram of", input$xvar), x = input$xvar, y = "Frequency")
  })
}
shinyApp(ui = ui, server = server)
