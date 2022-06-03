library(shinyjs)

PLAYER <- "🧍"

server = function(input, output, session){
  coords = reactiveValues(point = c(0, 0))
  output$board <- renderUI({HTML(PLAYER)})
  
  observeEvent(input$downKey, { 
    coords$key <- input$downKeyId
    output$results = renderPrint({ coords$key }) 
    if (coords$key == "KeyW") {
      if (coords$point[2] > 0) coords$point[2] <- coords$point[2] - 1
      updateScreen()
    } else if (coords$key == "KeyA") {
      if (coords$point[1] > 0) coords$point[1] <- coords$point[1] - 1
      updateScreen()
    } else if (coords$key == "KeyS") {
      coords$point[2] <- coords$point[2] + 1
      updateScreen()
    } else if (coords$key == "KeyD") {
      coords$point[1] <- coords$point[1] + 1
      updateScreen()
    }
    output$point = renderPrint(sprintf("(%s, %s)", as.character(coords$point[1]), as.character(coords$point[2])))
  });
  
  updateScreen <- function() {
    req(coords$point[1] >= 0 && coords$point[2] >= 0)
    str <- ""
    for (y in seq_len(coords$point[2])) {
      str <- paste0(str, "<br/>")
    }
    for (x in seq_len(coords$point[1])) {
      str <- paste0(str, "&nbsp&nbsp&nbsp&nbsp")
    }
    str <- paste0(str, PLAYER)
    output$board <- renderUI({ HTML(str) })
  }
  
  output$keep_alive <- renderText({
    req(input$alive_count)
    input$alive_count
  })
}