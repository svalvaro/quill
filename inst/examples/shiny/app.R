library(shiny)
library(quill)
ui <- shinyUI(fluidPage(
  div(
    div(
      "This is your new text editor",
      quillOutput("editor")
    ),
    div(
      hr(),
      "You can easily render what the user is writing as HTML",
      htmlOutput("rendered_output")
    )
  )
))

server <-  function(input, output) {
  output$editor <- renderQuill({
    quill(
      toolbar = toolbar_options(
        header = list(c(1, 2, "normal_selected", 3, 4)),
        size = c("large", "normal_selected")
      )
    )
  })
  observeEvent(input$editor_content, {
    cat(
      sep = "\n",
      get_editor_content(input$editor_content, format = "JSON"),
      get_editor_content(input$editor_content, format = "HTML"),
      get_editor_content(input$editor_content, format = "Text")
    )
  })
  output$rendered_output <- renderUI(HTML(get_editor_content(input$editor_content, format = "HTML")))
}

shinyApp(ui = ui, server = server)
