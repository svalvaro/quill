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
    params_list = format_multiple_choice_param(params$list, "list"),
    params_script = format_multiple_choice_param(params$script, "script")
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
    #color = TRUE,
    #direction = TRUE,
    #font = TRUE,
    "formula",
    "code",
    "italic",
    "image",
    #header = TRUE,
    #indent = TRUE,
    "link",
    #list = NULL, ## done
    #size = TRUE,
    "strike" ,
    #script = TRUE, ## done
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

quill_options <- function(
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
    script = NULL,
    underline = TRUE,
    video = FALSE,
    `code-block` = TRUE
) {
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
}
