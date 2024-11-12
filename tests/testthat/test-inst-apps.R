test_that("shiny app works", {
  # Don't run these tests on the CRAN build servers
  skip_on_cran()

  appdir <- system.file(package = "quill", "examples/shiny")
  shinytest2::test_app(app_dir = appdir)
})
