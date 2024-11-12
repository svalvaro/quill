describe("get_editor_content", {
  it("returns correctly the content from the editor in the selected format", {
    # Arrange
    mock_content <- list(
      "{\"ops\":[{\"attributes\":{\"color\":\"#0066cc\"},\"insert\":\"Hello, world!\"}]}",
      "Hello, world!",
      "<p><span style=\"color: rgb(0, 102, 204);\">Hello, world!</span></p>"
    ) |> as.character()

    # Assert
    expect_equal(get_editor_content(mock_content, "JSON"), mock_content[1])
    expect_equal(get_editor_content(mock_content, "Text"), mock_content[2])
    expect_equal(get_editor_content(mock_content, "HTML"), mock_content[3])
  })

  it("Returns an error if the user selects a wrong format", {
    expect_error(get_editor_content(mock_content, "LaTeX"))
  })
})

describe("format_binary_options", {
  it("returns a JSON string with the options that were set to TRUE", {
    # Arrange
    demo_parameters <- list(
      code = TRUE,
      bold = FALSE,
      italic = TRUE,
      align = c("center", "right")
    )

    # Act
    result <- format_binary_options(demo_parameters)

    # Assert
    expect_equal(result, jsonlite::toJSON(c("code", "italic")))
  })

  it("returns a JSON string with the options that were set to TRUE in a more complex scenario", {
    # Arrange
    demo_parameters <- list(
      align = c("center", "right"),
      background = list(list()),
      blockquote = TRUE,
      bold = TRUE,
      color = list(list()),
      direction = "rtl",
      font = NULL,
      formula = FALSE,
      code = FALSE,
      italic = TRUE,
      image = TRUE,
      header = list(list(1, 2, FALSE)),
      indent = c("-1", "+1"),
      link = TRUE,
      list = c("ordered", "bullet", "check"),
      size = list(list("small", "large", "huge")),
      strike = TRUE,
      script = c("sub", "super"),
      underline = TRUE,
      video = FALSE,
      `code-block` = TRUE
    )

    # Act
    result <- format_binary_options(demo_parameters)

    # Assert
    expect_equal(
      result,
      jsonlite::toJSON(
        c("blockquote","bold","italic","image","link","strike","underline","code-block")
      )
    )
  })
})

describe("format_multiple_choice_options", {
  it("returns a JSON chr with the name adevnd choices selected by the user", {
    # Act
      result <- format_multiple_choice_options("align", c("center", "right"))

    # Assert
      expect_equal(
        result,
        structure("[{\"align\":\"center\"},{\"align\":\"right\"}]", class = "json")
      )
  })

  it("correctly transforms the 'normal_unselected' or 'normal_selected' to true or false", {
    # Act
    result_header<- format_multiple_choice_options("header", list(c(1, 2, "normal_unselected")))
    result_size <- format_multiple_choice_options(
      "size",
      list(c('small', "normal_unselected", 'large'))
    )

    # Assert
    expect_equal(result_header, structure("[{\"header\":[\"1\",\"2\",true]}]", class = "json"))
    expect_equal(result_size, structure("[{\"size\":[\"small\",true,\"large\"]}]", class = "json"))
  })
})
