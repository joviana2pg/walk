library(shiny)

ui = bootstrapPage(
  # verbatimTextOutput("results"),
  # verbatimTextOutput("point"),
  htmlOutput("board"),
  tags$script('
    downKeyCount = 0;
    $(document).on("keydown", function (e) {
       Shiny.onInputChange("downKey", downKeyCount++);
       Shiny.onInputChange("downKeyId", e.code);
    });'
  )
)