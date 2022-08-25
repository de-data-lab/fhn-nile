source("global.R")


ui <- bootstrapPage(
  tags$style(
    "@import url('https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@100;200;400;500;600;700;800;900&display=swap');
             body { font-family: 'Libre Franklin'; }
    h1 { color: #0057B8; font-weight: bold; }
    h2 { color: #78BE20; font-weight: bold }
    .scrolly-sections { padding: 1.5rem; background-color: rgba(234,234,234,0.1); border-right: 1px solid #eaeaea; }
    .scrolly-graph { padding-top:10vh;  }
    #hero::after { content: ''; width:100%; height:100%; background-color:#eaeaea; top:0; left: 0; position:absolute; z-index: 40; opacity: .4; z-index:-1; }"
  ),
  fluidRow(
    column(
      12,
      div(
        id = "hero",
        style = "
                 padding:1rem;
                 height: 200px;
                 width:100%;
                 position:relative;
                 border-bottom: 1px solid #eaeaea;
                 background-repeat: no-repeat;
                 background-size:cover;
                 z-index:-2;
                 overflow:hidden;
                 background-position: center bottom;
                  background-attachment: fixed;
                 background-image: url('https://images.pexels.com/photos/7821685/pexels-photo-7821685.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')",
        img(src = "https://offers.techimpact.org/hs-fs/hubfs/social-suggested-images/cdn2.hubspot.nethub575821hubfsLogostechimpact-logo-600x186.png?width=600&name=cdn2.hubspot.nethub575821hubfsLogostechimpact-logo-600x186.png", style =
              "display:block; height: 70px; position: absolute; bottom:0; right:0; padding-right:1rem; ")
      )
    ),
    column(1),
    column(
      10,
      style = "margin-top:3rem",
      intro,
      br(),
      hr(),
      about,
      br(),
      hr(),
      definitions
    ),
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
                 scr_3,
                 hr(),
                 scr_4,
                 scr_5,
                 scr_6,
                 scr_7,
                 scr_8,
                 scr_9,
                 scr_10,
               )
             )
           ))
) 

server <- function(input, output, session) {
  data <- reactive({
    scroll <- input$scr
    
    if (!length(scroll) == 0) {
      if (scroll == 1) {
        make_hc_cat(
          title = "Overall Financial Health Ratings, 2021*",
          subtitle = "",
          '<br/><br/>*Based on scores of 0-100. <strong>0-39:</strong> "Financially Vulnerable"; <strong>40-79:</strong> "Financially Coping"; <strong>80-100:</strong> "Financially Healthy"',
          data = get_freq("FinancialHealth")
        )
      }
      else if (scroll == 2) {
        make_hc_cat(as.character(q_overall[input$id2]), "", "", get_freq(input$id2))
      }
      else if (scroll == 3) {
        make_hc_num(
          title = "Average 'Spend' Scores",
          subtitle = "Indicators:'Spend less than income'; 'Pay bills on time'",
          data = get_mean("Scores_Spend")
        )
      }
      else if (scroll == 4) {
        make_hc_cat(as.character(q_spend[input$id4]), "", "", get_freq(input$id4))
      }
      else if (scroll == 5) {
        make_hc_num(
          title = "Average 'Save' Scores",
          subtitle = "Indicators:'Have sufficient living expenses in liquid savings', 'Have sufficient long-term savings or assets'",
          data = get_mean("Scores_Save")
        )
      }
      else if (scroll == 6) {
        make_hc_cat(as.character(q_save[input$id6]), "", "", get_freq(input$id6))
      }
      else if (scroll == 7) {
        make_hc_num(
          title = "Average 'Borrow' Scores",
          subtitle = "Indicators:'Have sustainable debt load', 'Have a prime credit score'",
          data = get_mean("Scores_Borrow")
        )
      }
      else if (scroll == 8) {
        make_hc_cat(as.character(q_borrow[input$id8]), "", "", get_freq(input$id8))
      }
      else if (scroll == 9) {
        make_hc_num(
          title = "Average 'Plan' Scores",
          subtitle = "Indicators:'Have appropriate insurance', 'Plan ahead for expenses'",
          data = get_mean("Scores_Plan")
        )
      }
      else if (scroll == 10) {
        make_hc_cat(as.character(q_plan[input$id10]), "", "", get_freq(input$id10))
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
