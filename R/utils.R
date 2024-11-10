#' Title
#'
#' @param input_vector
#' @param format
#'
#' @return
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
    params_indent = format_multiple_choice_param(params$indent, "indent")
  )

  print(toolbar)
  toolbar
}

format_binary_params <- function(params) {
  binary_names <- c(
    #align = TRUE,
    #background = TRUE,
    "blockquote",
    "bold",
    #font = TRUE,
    "formula",
    "code",
    "italic",
    "image",
    #header = TRUE,
    "link",
    #size = TRUE,
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

#' Options for the text editor
#'
#' @param align A vector containing what types of list to include, e.g c('center', 'right')
#' @param background A vector with the colors, if the vector is empty the defaults colours will appear. e.g
#' c('red', 'blue', ''#32a852') or c().
#' @param blockquote Either TRUE or FALSE
#' @param bold Either TRUE or FALSE
#' @param color A vector with the colors, if the vector is empty the defaults colours will appear. e.g
#' c('red', 'blue', ''#32a852') or c().
#' @param direction NULL or 'rtl'. Is the direction from which the text will be typed.
#' @param font TO BE IMPLEMENTED
#' @param formula Either TRUE or FALSE
#' @param code Either TRUE or FALSE
#' @param italic Either TRUE or FALSE
#' @param image Either TRUE or FALSE
#' @param header TO BE IMPLEMENTED
#' @param indent A vector: c('-1', '+1') or NULL. To outdent/indent
#' @param link Either TRUE or FALSE
#' @param list A vector containing what types of list to include, e.g. c("ordered", "bullet", "check")
#' @param size TO BE IMPLEMENTED
#' @param strike Either TRUE or FALSE
#' @param script  A vector containing what types of script to include, e.g. c("sub", "super")
#' @param underline Either TRUE or FALSE
#' @param video Either TRUE or FALSE
#' @param `code-block` Either TRUE or FALSE
#'
#' @return
#' @export
#'
#' @examples
quill_options <- function(
    align = c('center', 'right'),
    background = NULL,
    blockquote = TRUE,
    bold = TRUE,
    color = NULL,
    direction = 'rtl',
    font = NULL,
    formula = FALSE,
    code = FALSE,
    italic = TRUE,
    image = TRUE,
    header = NULL,
    indent = c('-1', '+1'),
    link = TRUE,
    list = c("ordered", "bullet", "check"),
    size = NULL,
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
    size = size,
    strike = strike,
    script = script,
    underline = underline,
    video = video,
    `code-block` = `code-block`
  )
}
