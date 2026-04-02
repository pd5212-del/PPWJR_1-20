library(shiny)
ui <- fluidPage(
  titlePanel("Pierwsza aplikacja w Shiny"),
  sidebarLayout(
    sidebarPanel(
      fileInput("plik", "Wczytaj plik csv"),
      actionButton("analizuj", "Uruchom analizę"),
      selectInput("zmienna", "Wybierz zmienną do wykresu", choices = NULL),
      sliderInput("bins", "Liczba przedziałów (bins)", min = 10, max = 50, value = 10)
    ),

    
    mainPanel(
      h3("Wyniki analizy"),
      tableOutput("tabela"),
      verbatimTextOutput("statystyki"),
      plotOutput("wykres")
    )
  )
)
server <- function(input, output, session) {
  dane <- eventReactive(input$analizuj, {
    req(input$plik)
    read.csv(input$plik$datapath, header = TRUE, sep = ",")
  })
  output$tabela <- renderTable({
    dane()
  })
  output$statystyki <- renderPrint({
    summary(dane())
  })
  observeEvent(dane(), {
    dane_df <- dane()
    numeryczne <- names(dane_df)[sapply(dane_df, is.numeric)]
    updateSelectInput(session, "zmienna", choices = numeryczne)
  })
  output$wykres <- renderPlot({
    req(dane(), input$zmienna)
    hist(dane()[[input$zmienna]],
         breaks = input$bins,
         main = paste("Histrogram zmiennej", input$zmienna),
         xlab = input$zmienna,
         col = "green",
         border = "black")
  })
}
shinyApp(ui = ui, server = server)
