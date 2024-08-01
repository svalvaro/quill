#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
quill <- function( # Sort Alphabetically lint
  align = TRUE,
  background = TRUE,
  blockquote = TRUE,
  bold = TRUE,
  color = TRUE,
  direction = TRUE,
  font = TRUE,
  formula = FALSE,
  code = FALSE,
  italic = TRUE,
  image = TRUE,
  header = TRUE,
  indent = TRUE,
  link = TRUE,
  list = NULL,
  size = TRUE,
  strike = TRUE,
  script = TRUE,
  underline = TRUE,
  video = FALSE,
  `code-block` = TRUE,
  width = NULL,
  height = NULL,
  theme = "snow",
  toolbar = NULL,
  placeholder = "Placeholder message",
  elementId = NULL
) {

  toolbar_options <- generate_toolbar_options(
    list(
      align = align,
      background = background,
      blockquote = blockquote,
      bold = bold,
      color = color,
      direction = direction,
      font = font,
      formula = formula,
      code = code,
      italic = italic,
      image = image,
      header = header,
      indent = indent,
      link = link,
      list = list,
      size = size,
      strike = strike,
      script = script,
      underline = underline,
      video = video,
      `code-block` = `code-block`
    )
  )

  if (!is.null(toolbar)) toolbar_options <- toolbar

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
