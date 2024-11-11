library(shiny)
library(quill)
ui = shinyUI(fluidPage(
  div(
    div(
      "This is your new text editor",
      quillOutput("editor_1")
    ),
    div(
      "You can easily render what the user is writing as HTML",
      htmlOutput('rendered_output')
    )
  )
))

server = function(input, output) {
  output$editor_1 <- renderQuill({
    quill(
      quill_params = quill_options()
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
  output$rendered_output <- shiny::renderUI(HTML(get_editor_content(input$editor_1, format = "HTML")))
}

shinyApp(ui = ui, server = server)
