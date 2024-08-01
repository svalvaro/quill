get_editor_content <- function(input_vector, format = "HTML") {
  switch (format,
          "JSON" = input_vector[1],
          "Text" = input_vector[2],
          "HTML" = input_vector[3]
  )
}

generate_toolbar_options <- function(params) {
  toolbar <- params |>
    add_toolbar_binary_params() #|>
    #add_param_list(params)

  print(toolbar)
  toolbar
}

add_toolbar_binary_params <- function(params) {
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
    #list = NULL,
    #size = TRUE,
    "strike" ,
    #script = TRUE,
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

add_param_list <- function(json_string, params) {
  if (is.null(params$list)) return(json_string)
  stopifnot(all(params$list %in% c("ordered", "bullet", "check")))

  list(
    list = "ordered",
    list = "bullet",
    list = "check"
  ) |> jsonlite::toJSON()

  x <- list(foo = "", bar = 0)
  params$list |>  jsonlite::toJSON()

  json_list <- paste0("{ 'list' : '", params$list, "' }", collapse = ", ")
  json_list2 <- paste0('\'', json_string, '\'', collapse = ',')
  browser()
  glue::glue(
    "{json_list2}, {json_list}") |>
    jsonlite::toJSON()

}
