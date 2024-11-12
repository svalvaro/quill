library(shinytest2)

test_that("{shinytest2} recording: shiny-e2e", {
  app <- AppDriver$new(variant = platform_variant(), name = "shiny-e2e", seed = 123,
      height = 992, width = 1619)
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
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello t\"},{\"insert\":\"\\n\"}]}",
      "hello t\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello t</span></p>"),
      allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello th\"},{\"insert\":\"\\n\"}]}",
      "hello th\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello th</span></p>"),
      allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello the\"},{\"insert\":\"\\n\"}]}",
      "hello the\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello the</span></p>"),
      allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello ther\"},{\"insert\":\"\\n\"}]}",
      "hello ther\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello ther</span></p>"),
      allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello there\"},{\"insert\":\"\\n\"}]}",
      "hello there\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello there</span></p>"),
      allow_no_input_binding_ = TRUE)
  app$set_inputs(editor_1 = c("{\"ops\":[{\"attributes\":{\"color\":\"#e60000\"},\"insert\":\"hello there!\"},{\"insert\":\"\\n\"}]}",
      "hello there!\n", "<p><span style=\"color: rgb(230, 0, 0);\">hello there!</span></p>"),
      allow_no_input_binding_ = TRUE)
  app$expect_screenshot()
})
