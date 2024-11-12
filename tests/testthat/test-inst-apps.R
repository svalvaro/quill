test_that("shiny app works", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  appdir <- system.file(package = "quill", "examples/shiny")
  test_app(appdir)
})
