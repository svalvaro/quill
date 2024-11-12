library(shinytest2)
test_that("{shinytest2} recording: shiny", {
  app <- AppDriver$new(variant = platform_variant(os_name = FALSE), name = "shiny", seed = 1, height = 992,
      width = 1619, app_dir = system.file("examples/shiny", package = "quill"))
  app$expect_screenshot()
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"h\"},{\"insert\":\"\\n\"}]}",
      "h\n", "<p><span style=\"color: rgb(230, 0, 0);\">h</span></p>"), allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"he\"},{\"insert\":\"\\n\"}]}",
      "he\n", "<p><span style=\"color: rgb(230, 0, 0);\">he</span></p>"), allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hel\"},{\"insert\":\"\\n\"}]}",
      "hel\n", "<p><span style=\"color: rgb(230, 0, 0);\">hel</span></p>"), allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hell\"},{\"insert\":\"\\n\"}]}",
      "hell\n", "<p><span style=\"color: rgb(230, 0, 0);\">hell</span></p>"), allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello\"},{\"insert\":\"\\n\"}]}",
      "hello\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello</span></p>"), allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello \"},{\"insert\":\"\\n\"}]}",
      "hello \n", "<p><span style=\"color: rgb(230, 0, 0);\">hello </span></p>"),
      allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello \"},{\"attributes\":{\"code\":true},\"insert\":\"w\"},{\"insert\":\"\\n\"}]}",
      "hello w\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello </span><code>w</code></p>"),
      allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello \"},{\"insert\":\"\\n\"}]}",
      "hello \n", "<p><span style=\"color: rgb(230, 0, 0);\">hello </span></p>"),
      allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello \"},{\"attributes\":{\"color\":\"#0066cc\"},\"insert\":\"w\"},{\"insert\":\"\\n\"}]}",
      "hello w\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello </span><span style=\"color: rgb(0, 102, 204);\">w</span></p>"),
      allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello \"},{\"attributes\":{\"color\":\"#0066cc\"},\"insert\":\"wo\"},{\"insert\":\"\\n\"}]}",
      "hello wo\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello </span><span style=\"color: rgb(0, 102, 204);\">wo</span></p>"),
      allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello \"},{\"attributes\":{\"color\":\"#0066cc\"},\"insert\":\"wor\"},{\"insert\":\"\\n\"}]}",
      "hello wor\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello </span><span style=\"color: rgb(0, 102, 204);\">wor</span></p>"),
      allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello \"},{\"attributes\":{\"color\":\"#0066cc\"},\"insert\":\"worl\"},{\"insert\":\"\\n\"}]}",
      "hello worl\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello </span><span style=\"color: rgb(0, 102, 204);\">worl</span></p>"),
      allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello \"},{\"attributes\":{\"color\":\"#0066cc\"},\"insert\":\"world\"},{\"insert\":\"\\n\"}]}",
      "hello world\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello </span><span style=\"color: rgb(0, 102, 204);\">world</span></p>"),
      allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello \"},{\"attributes\":{\"color\":\"#0066cc\"},\"insert\":\"world!\"},{\"insert\":\"\\n\"}]}",
      "hello world!\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello </span><span style=\"color: rgb(0, 102, 204);\">world!</span></p>"),
      allow_no_input_binding_ = TRUE)
  app$expect_screenshot()
})
