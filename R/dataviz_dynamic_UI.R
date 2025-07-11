
# simple example of dynamic UI
# load the required library
library(shiny)

#define UI
ui <- fluidPage(
  titlePanel("example of dynamic UI"),
  checkboxInput("show_slider", "show slider", FALSE),
  uiOutput("slider_ui")
)
# write a server logic
server <- function(input, output, session) {
  output$slider_ui <- renderUI({
    if (input$show_slider) {
      sliderInput("slider", "select a value", min = 1, max = 100, value = 50)
    }
  })
}
#run the shiny app
shinyApp(ui = ui, server = server)