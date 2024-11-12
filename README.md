# An R interface to Quilljs

<!-- badges: start -->

<!-- badges: end -->

[Quill](https://quilljs.com/) is an open-source JavaScript library for a text editor. This R package makes it easy to create Quill editors from R.

![](man/figures/README-example.png)

## Installation

You can install the development version of quill from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("svalvaro/quill")
```

## Example

Checkout the example shiny app at [inst/examples/shiny/app.R](https://github.com/svalvaro/quill/blob/main/inst/examples/shiny/app.R).

``` r
## basic example of functioning in Shiny
library(quill)

ui <- fluidPage(
  ... 
  quillOutput("text_editor")
  ...
)

server <- function(input, output, ...) {
  ...
  output$text_editor <- renderQuill(quill())

  # You can listen what the user is writing in HTML, JSON, and plain text
  observeEvent(input$text_editor, {
    get_editor_content(input$text_editor, format = "HTML")
  }
  ...
}
```
