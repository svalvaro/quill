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
  switch (format,
          "JSON" = input_vector[1],
          "Text" = input_vector[2],
          "HTML" = input_vector[3]
  )
}

format_toolbar_options <- function(params) {

  toolbar <- list(
    params_binary = format_binary_params(params),
    params_align = format_multiple_choice_param(params$align, "align"),
    params_background = format_multiple_choice_param(params$background, "background"),
    params_color = format_multiple_choice_param(params$color, "color"),
    params_list = format_multiple_choice_param(params$list, "list"),
    params_script = format_multiple_choice_param(params$script, "script"),
    params_direction = format_multiple_choice_param(params$direction, "direction"),
    params_indent = format_multiple_choice_param(params$indent, "indent"),
    params_header = format_multiple_choice_param(params$header, "header"),
    params_size = format_multiple_choice_param(params$size, "size")
  )

  toolbar
}

format_binary_params <- function(params) {
  binary_names <- c(
    "blockquote",
    "bold",
    "formula",
    "code",
    "italic",
    "image",
    "link",
    "strike" ,
    "underline",
    "video" ,
    "code-block"
  )
  binary_params <- params[names(params) %in% binary_names]
  purrr::map2(binary_params, names(binary_params), function(value, name) {
    if (isTRUE(value)) name
  }) |>
    purrr::discard(\(x) is.null(x)) |>
    unlist() |>
    jsonlite::toJSON()
}

format_multiple_choice_param <- function(param, name) {
  tibble::tibble(
    !!rlang::sym(name) := param
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
#' @param code Logical; `TRUE` or `FALSE` to include/exclude inline code functionality.
#' @param `code-block` Logical; `TRUE` or `FALSE` to include/exclude code block functionality.
#' @param color A vector of colors for text color. If empty, default colors will appear,
#' e.g., `c('red', 'blue', '#32a852')` or `c()`.
#' @param direction Character; `NULL` or `"rtl"` to set the text input direction.
#' @param font A vector; not implemented yet.
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
#' quill(quill_params = quill_options(align = 'right', bold = FALSE))
quill_options <- function(
    align = c('center', 'right'),
    background = c(),
    blockquote = TRUE,
    bold = TRUE,
    color = c(),
    direction = 'rtl',
    font = NULL,
    formula = FALSE,
    code = FALSE,
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
    size = list(as.list(size)),
    strike = strike,
    script = script,
    underline = underline,
    video = video,
    `code-block` = `code-block`
  )
}
