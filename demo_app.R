library(shiny)
library(quill)
ui = shinyUI(fluidPage(
  div(
    div(
      "hello world",
      quillOutput("editor_1")
    )
  )
))

server = function(input, output) {
  output$editor_1 <- renderQuill({
    quill(
      quill_params = quill_options(
        link = FALSE,
        # formula = TRUE,
        # list = c("ordered", "bullet", "check"),
        # script = c("sub", "super"),
        # direction = 'rtl',
        # indent = c('+1', '-1'),
        # align = c('center', 'right')
        color = c(),
        background = c('red', '#32a852')
      )
    )
  })
  observeEvent(input$editor_1, {
    cat(
      sep = "\n",
      get_editor_content(input$editor_1, format = "JSON"),
      get_editor_content(input$editor_1, format = "HTML"),
      get_editor_content(input$editor_1, format = "Text")
    )
  })
}

shinyApp(ui = ui, server = server)
