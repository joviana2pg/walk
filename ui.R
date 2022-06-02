library(shiny)

ui <- fluidPage(
  # verbatimTextOutput("results"),
  # verbatimTextOutput("point"),
  titlePanel("he walkin"),
  htmlOutput("board"),
  tags$script('
    downKeyCount = 0;
    $(document).on("keydown", function (e) {
       Shiny.onInputChange("downKey", downKeyCount++);
       Shiny.onInputChange("downKeyId", e.code);
    });'
  )
)