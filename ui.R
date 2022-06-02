library(shiny)

ui <- fluidPage(
  # verbatimTextOutput("results"),
  # verbatimTextOutput("point"),
  titlePanel("he walkin"),
  HTML("<h3>Try using WASD. A test project and an example of reactivity in <a href='https://shiny.rstudio.com/'>RShiny</a>.</h3>"),
  htmlOutput("board"),
  tags$script('
    downKeyCount = 0;
    $(document).on("keydown", function (e) {
       Shiny.onInputChange("downKey", downKeyCount++);
       Shiny.onInputChange("downKeyId", e.code);
    });'
  ),
  tags$style("* {font-family: 'EB Garamond';}"),
  tags$style("h2 {font-weight: bold;}")
)