#' Create a text editor
#'
#' This function creates a QuillJS text editor widget using \pkg{htmlwidgets}. The
#' widget can be rendered on HTML pages generated from R Markdown, Shiny, or
#' other applications.
#'
#' @param toolbar Use the function `toolbar_options()` to define the parameters of the toolbar.
#' @param width The width of the editor.
#' @param height The height of the editor.
#' @param theme Either 'snow' or 'bubble' are the supported themes.
#' @param placeholder Placeholder text that will appear in the editor.
#' @param elementId Use an explicit element ID for the widget
#' (rather than an automatically generated one).
#'
#' @return A HTML widget object.
#'
#' @import htmlwidgets
#' @examples
#' quill(toolbar = toolbar_options(align = 'right'))
#'
#' @export
quill <- function( # Sort Alphabetically lint
  toolbar = toolbar_options(),
  width = NULL,
  height = NULL,
  theme = "snow",
  placeholder = "Placeholder message",
  elementId = NULL
) {

  # create widget
  htmlwidgets::createWidget(
    name = 'quillWidget',
    x = list(
      toolbar_options = format_toolbar_options(toolbar),
      theme = theme,
      placeholder = placeholder
    ),
    width = width,
    height = height,
    package = 'quill',
    elementId = elementId
  )
}

#' Shiny bindings for quill
#'
#' Output and render functions for using quill within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a quill editor
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name quill-shiny
#'
#' @export
quillOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'quillWidget', width, height, package = 'quill')
}

#' @rdname quill-shiny
#' @export
renderQuill <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, quillOutput, env, quoted = TRUE)
}
