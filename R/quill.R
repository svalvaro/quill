#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
quill <- function( # Sort Alphabetically lint
  quill_params = quill_options(),
  width = NULL,
  height = NULL,
  theme = "snow",
  custom_toolbar = NULL,
  placeholder = "Placeholder message",
  elementId = NULL
) {

  toolbar_options <- format_toolbar_options(quill_params)

  if (!is.null(custom_toolbar)) toolbar_options <- toolbar

  params <- list(
    toolbar_options = toolbar_options,
    theme = theme,
    placeholder = placeholder
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'quillWidget',
    x = params,
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
