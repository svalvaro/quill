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
        c("blockquote", "bold", "italic", "image", "link", "strike", "underline", "code-block")
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
    result_header <- format_multiple_choice_options("header", list(c(1, 2, "normal_unselected")))
    result_size <- format_multiple_choice_options(
      "size",
      list(c("small", "normal_unselected", "large"))
    )

    # Assert
    expect_equal(result_header, structure("[{\"header\":[\"1\",\"2\",true]}]", class = "json"))
    expect_equal(result_size, structure("[{\"size\":[\"small\",true,\"large\"]}]", class = "json"))
  })
})


describe("format_toolbar_options", {
  it("formats correctly into a list of json strings a couple of params", {
    # Arrange
    demo_toolbar_choices <- list(
      align = c("center", "right"),
      underline = FALSE,
      video = TRUE,
      `code-block` = TRUE
    )

    # Act
    results <- format_toolbar_options(demo_toolbar_choices)

    # Assert
    expected_result <- list(
      align = structure("[{\"align\":\"center\"},{\"align\":\"right\"}]", class = "json"),
      binary_options = structure("[\"video\",\"code-block\"]", class = "json")
    )

    expect_equal(results, expected_result)
  })

  it("formats correctly when there are many choices of different type", {
    # Arrange
    demo_toolbar_choices <- list(
      align = c("center", "right"),
      background = list(list()),
      blockquote = TRUE,
      bold = TRUE,
      color = list(list()),
      clean = TRUE,
      direction = "rtl",
      formula = TRUE,
      code = TRUE,
      italic = TRUE,
      image = TRUE,
      header = list(c("1", "2", "normal_selected", "3", "4")),
      indent = c("-1", "+1"),
      link = TRUE,
      list = c("ordered", "bullet", "check"),
      size = list(c("large", "normal_selected")),
      strike = TRUE,
      script = c("sub", "super"),
      underline = TRUE,
      video = FALSE,
      `code-block` = TRUE
    )

    # Act
    results <- format_toolbar_options(demo_toolbar_choices)

    # Assert

    expected_result <- list(
      align = structure("[{\"align\":\"center\"},{\"align\":\"right\"}]", class = "json"),
      background = structure("[{\"background\":[]}]", class = "json"),
      color = structure("[{\"color\":[]}]", class = "json"),
      direction = structure("[{\"direction\":\"rtl\"}]", class = "json"),
      header = structure("[{\"header\":[\"1\",\"2\",false,\"3\",\"4\"]}]", class = "json"),
      indent = structure("[{\"indent\":\"-1\"},{\"indent\":\"+1\"}]", class = "json"),
      list = structure(
        "[{\"list\":\"ordered\"},{\"list\":\"bullet\"},{\"list\":\"check\"}]",
        class = "json"
      ),
      size = structure("[{\"size\":[\"large\",false]}]", class = "json"),
      script = structure("[{\"script\":\"sub\"},{\"script\":\"super\"}]", class = "json"),
      binary_options = structure(
        "[\"blockquote\",\"bold\",\"clean\",\"formula\",\"code\",\"italic\",\"image\",\"link\",\"strike\",\"underline\",\"code-block\"]", #nolint
        class = "json"
      )
    )

    expect_equal(results, expected_result)
  })
})
