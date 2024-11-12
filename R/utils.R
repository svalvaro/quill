#' Retrieve the content that the user has typed
#'
#' This function retrieves the content that the user has writen in the editor.
#' It can output it in three formats: "HTML, "JSON" or plain text.
#'
#' @param input_vector The input from the editor.
#' @param format one of the three options: "HTML", "JSON" or "Text".
#'
#' @return character
#' @export
get_editor_content <- function(input_vector, format = "HTML") {
  stopifnot(format %in% c("JSON", "Text", "HTML"))

  switch (format,
          "JSON" = input_vector[1],
          "Text" = input_vector[2],
          "HTML" = input_vector[3]
  )
}

#' It formats the toolbar options selected by the user into a JSON format
#'
#' @param params Toolbar options selected by the user, the output of `toolbar_options()`.
#'
#' @return A list containing all the choices for the toolbar in JSON format.
format_toolbar_options <- function(params) {
  multiple_choice_names <- c("align", "background", "color", "direction", "header", "indent",
    "list", "size", "script")

  multiple_choice_options <- params[names(params) %in% multiple_choice_names]

  toolbar_opts_json  <-  purrr::map2(
    multiple_choice_options,
    names(multiple_choice_options),
    format_multiple_choice_options
  )
  toolbar_opts_json$binary_options <- format_binary_options(params)
  toolbar_opts_json
}

#' Function that transforms the toolbar options that are either TRUE/FALSE to JSON format
#'
#' @param params Toolbar options selected by the user, the output of `toolbar_options()`.
#'
#' @return a json chr with the toolbar options that were set to TRUE
format_binary_options <- function(params) {
  purrr::map2(params, names(params), function(value, name) {
    if (isTRUE(value)) name
  }) |>
    purrr::discard(is.null) |>
    unlist() |>
    jsonlite::toJSON()
}

#' Function that transforms a toolbar option that is a vector/list of choices to JSON format
#'
#' @param value The value(s) of the choice, e.g. c("center", "right")
#' @param name The name of the choice, e.g. "align"
#'
#' @return a json chr with the toolbar option and its values
format_multiple_choice_options <- function(value, name) {
  tibble::tibble(
    !!rlang::sym(name) := value
  ) |>
    jsonlite::toJSON()
}

#' Configure the Toolbar Options
#'
#' This function configures toolbar options for the editor, allowing customization of
#' formatting features such as alignment, color, font styles, and more.
#'
#' @param align A vector containing types of alignment, e.g., `c('center', 'right')`.
#' @param background A vector of colors for the background. If empty, default colors will appear,
#' e.g., `c('red', 'blue', '#32a852')` or `c()`.
#' @param bold Logical; `TRUE` or `FALSE` to include/exclude bold functionality.
#' @param clean Logical; `TRUE` or `FALSE` to include/exclude clean functionality.
#' @param code Logical; `TRUE` or `FALSE` to include/exclude inline code functionality.
#' @param `code-block` Logical; `TRUE` or `FALSE` to include/exclude code block functionality.
#' @param color A vector of colors for text color. If empty, default colors will appear,
#' e.g., `c('red', 'blue', '#32a852')` or `c()`.
#' @param direction Character; `NULL` or `"rtl"` to set the text input direction.
#' @param formula Logical; `TRUE` or `FALSE` to include/exclude formula functionality.
#' @param header A vector or list for header options. Example: `c(1, 2)` creates H1 and H2 buttons.
#' Use `list(list(1, 2, 3))` for a collapsed dropdown with H1, H2, and H3.
#' `TRUE`/`FALSE` can add or exclude the "Normal" button; `header = c(1, 2, 3, TRUE)`.
#' @param image Logical; `TRUE` or `FALSE` to include/exclude image embedding functionality.
#' @param indent A vector for indentation controls, e.g., `c('-1', '+1')` or `NULL`.
#' @param italic Logical; `TRUE` or `FALSE` to include/exclude italic functionality.
#' @param link Logical; `TRUE` or `FALSE` to include/exclude hyperlink functionality.
#' @param list A vector specifying list types, e.g., `c("ordered", "bullet", "check")`.
#' @param script A vector for script options, e.g., `c("sub", "super")`.
#' @param size A vector specifying size options: `c('small', FALSE/TRUE, 'large', 'huge')`.
#'  `FALSE`/`TRUE` controls the "Normal" button's inclusion, with selection depending on the
#' current default.
#' @param strike Logical; `TRUE` or `FALSE` to include/exclude strikethrough functionality.
#'
#' @return list
#' @export
#'
#' @examples
#' quill(toolbar = toolbar_options(align = 'right', bold = FALSE))
toolbar_options <- function(
    align = c('center', 'right'),
    background = c(),
    blockquote = TRUE,
    bold = TRUE,
    clean = TRUE,
    color = c(),
    direction = 'rtl',
    formula = TRUE,
    code = TRUE,
    italic = TRUE,
    image = TRUE,
    header = list(list(1, 2, FALSE)),
    indent = c('-1', '+1'),
    link = TRUE,
    list = c("ordered", "bullet", "check"),
    size = c('small', 'large', 'huge'),
    strike = TRUE,
    script = c("sub", "super"),
    underline = TRUE,
    video = FALSE,
    `code-block` = TRUE
) {
  list(
    align = align,
    background = list(as.list(background)),
    blockquote = blockquote,
    bold = bold,
    color = list(as.list(color)),
    clean = clean,
    direction = direction,
    formula = formula,
    code = code,
    italic = italic,
    image = image,
    header = header,
    indent = indent,
    link = link,
    list = list,
    size = list(as.list(size)),
    strike = strike,
    script = script,
    underline = underline,
    video = video,
    `code-block` = `code-block`
  )
}
