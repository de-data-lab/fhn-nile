source("global.R")


ui <- bootstrapPage(
  includeCSS("styles.css"),
  fluidRow(
    column(
      12,
      div(
        id = "hero",
        style = "",
        img(id = "logo", src = "https://offers.techimpact.org/hs-fs/hubfs/social-suggested-images/cdn2.hubspot.nethub575821hubfsLogostechimpact-logo-600x186.png?width=600&name=cdn2.hubspot.nethub575821hubfsLogostechimpact-logo-600x186.png"))
    ),
    column(1),
    column(10,
           style = "margin-top:3rem",
           intro,
           br(),
           hr(),
           about,
           br(),
           hr(),
           definitions),
    column(1)
  ),
  br(),
  br(),
  br(),
  fluidRow(column(1),
           column(
             11,
             scrolly_container(
               "scr",
               scrolly_graph(textOutput("section"),
                             div(highchartOutput(height = "50%", "hc"))),
               scrolly_sections(
                 scr_1,
                 hr(),
                 scr_2,
                 hr(),
                 scr_3,
                 hr(),
                 scr_4,
                 hr(),
                 scr_5,
                 hr(),
                 scr_6,
                 hr(),
                 scr_7,
                 hr(),
                 scr_8,
                 hr(),
                 scr_9,
                 hr(),
                 scr_10,
               )
             )
           )),
  fluidRow(
    column(1),
    column(10,
           conclusion),
    column(1)
  )
)

server <- function(input, output, session) {
  data <- reactive({
    scroll <- input$scr
    
    if (!length(scroll) == 0) {
      if (scroll == 1) {
        data <- get_freq("FinancialHealth")
        caption = paste("n = ", sum(data$n))
        
        make_hc_cat(
          title = "Overall Financial Health Scores, 2021*",
          subtitle = paste("n = ", sum(data$n)),
          caption = '<br/><br/>*Based on scores of 0-100. <strong>0-39:</strong> "Financially Vulnerable"; <strong>40-79:</strong> "Financially Coping"; <strong>80-100:</strong> "Financially Healthy" <br/>',
          data
        )
      }
      else if (scroll == 2) {
        data <- get_freq(input$id2)
        caption = paste("n = ", sum(data$n))
        make_hc_cat(as.character(q_overall[input$id2]), "", caption, data)
      }
      else if (scroll == 3) {
        data <- get_mean("Scores_Spend")
        caption = paste("n = ", sum(data$n))
        
        make_hc_num(title = "Average 'Spend' Scores",
          subtitle = "Indicators: 'Spend less than income'; 'Pay bills on time'",
          caption,
          data
        )
      }
      else if (scroll == 4) {
        data <- get_freq(input$id4)
        caption  <- paste("n = ", sum(data$n))
        
        make_hc_cat(as.character(q_spend[input$id4]), "", caption, data)
      }
      else if (scroll == 5) {
        data <- get_mean("Scores_Save")
        caption = paste("n = ", sum(data$n))
        
        make_hc_num(
          title = "Average 'Save' Scores",
          subtitle = "Indicators:'Have sufficient living expenses in liquid savings', 'Have sufficient long-term savings or assets'",
          caption,
          data
        )
      }
      else if (scroll == 6) {
        data <- get_freq(input$id6)
        caption <- paste("n = ", sum(data$n))
        
        make_hc_cat(as.character(q_save[input$id6]), "", caption, data)
      }
      else if (scroll == 7) {
        data <- get_mean("Scores_Borrow")
        caption <-  paste("n = ", sum(data$n))
        
        make_hc_num(
          title = "Average 'Borrow' Scores",
          subtitle = "Indicators:'Have sustainable debt load', 'Have a prime credit score'",
          caption,
          data
        )
      }
      else if (scroll == 8) {
        data <- get_freq(input$id8)
        caption <- paste("n = ", sum(data$n))
        
        make_hc_cat(as.character(q_borrow[input$id8]), "", caption, data)
      }
      else if (scroll == 9) {
        data <- get_mean("Scores_Plan")
        caption <- paste("n = ", sum(data$n))
        
        make_hc_num(
          title = "Average 'Plan' Scores",
          subtitle = "Indicators:'Have appropriate insurance', 'Plan ahead for expenses'",
          caption,
          data
        )
      }
      else if (scroll == 10) {
        data <- get_freq(input$id10)
        caption <- paste("n = ", sum(data$n))
        
        make_hc_cat(as.character(q_plan[input$id10]), "", caption,data)
      }
    } else {
      make_hc_cat(
        title = "Overall FinHealth Scores, 2021*",
        subtitle = "",
        '<br/><br/>*<strong>0-39:</strong> "Financially Vulnerable"; <strong>40-79:</strong> "Financially Coping"; <strong>80-100:</strong> "Financially Healthy"',
        data = get_freq("FinancialHealth")
      )
    }
    
  })
  
  output$hc <- renderHighchart(data())
  
  observeEvent(input$scr, {
    print(data())
  })
  
  output$scr <- renderScrollytell({
    scrollytell()
  })
}

shinyApp(ui = ui, server = server)
