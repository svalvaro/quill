library(shiny)
library(quill)
ui <- shinyUI(fluidPage(
  div(
    div(
      "This is your new text editor",
      quillOutput("editor_1")
    ),
    div(
      hr(),
      "You can easily render what the user is writing as HTML",
      htmlOutput("rendered_output")
    )
  )
))

server <-  function(input, output) {
  output$editor_1 <- renderQuill({
    quill(
      toolbar = toolbar_options(
        header = list(c(1, 2, "normal_selected", 3, 4)),
        size = c("large", "normal_selected")
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
  output$rendered_output <- renderUI(HTML(get_editor_content(input$editor_1, format = "HTML")))
}

shinyApp(ui = ui, server = server)
