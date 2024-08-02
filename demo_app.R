library(shiny)
library(quill)
ui = shinyUI(fluidPage(
  div(
    div(
      "hello world",
      quillOutput("editor2")
    )
  )
))

server = function(input, output) {
  output$editor2 <- renderQuill({
    quill(
      link = FALSE,
      bold = TRUE,
      formula = TRUE,
      list = c("ordered", "bullet", "check"),
      script = c("sub", "super")
    )
  })
  observeEvent(input$editor2, {
    cat(
      sep = "\n",
      get_editor_content(input$editor2, format = "JSON"),
      get_editor_content(input$editor2, format = "HTML"),
      get_editor_content(input$editor2, format = "Text")
    )
  })
}

shinyApp(ui = ui, server = server)
