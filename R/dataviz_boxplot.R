library(shiny)
library(ggplot2)

# UI
ui <- fluidPage(
  titlePanel("Iris Boxplot with ggplot2"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "variable",
        label = "Select variable:",
        choices = names(iris)[1:4],  # Only numeric columns
        selected = "Sepal.Length"
      )
    ),
    
    mainPanel(
      plotOutput(outputId = "boxplot")
    )
  )
)

# Server logic
server <- function(input, output) {
  
  output$boxplot <- renderPlot({
    ggplot(iris, aes(x = Species, y = .data[[input$variable]], fill = Species)) +
      geom_boxplot() +
      labs(
        title = paste("Boxplot of", input$variable, "by Species"),
        y = input$variable,
        x = "Species"
      ) +
      theme_minimal()
  })
}

# Run the app
shinyApp(ui = ui, server = server)



