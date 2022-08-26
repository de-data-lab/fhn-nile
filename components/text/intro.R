intro <- div(
  h1(
    "Tracking the Financial Health of Immigrants to the U.S. Across Generations"
  ),
  br(),
  br(),
  br(),
  p(
    "According to the Financial Health Network,",
    strong("'[f]inancial health"),
    "is a composite framework that considers the totality of people’s financial lives: whether they are spending, saving, borrowing, and planning in ways that will enable them to be resilient and pursue opportunities.' Analyzing trends in financial health for specific populations can help nonprofit leaders, policymakers, and advocates develop targeted outreach services and financial tools.",
    br(),
    br(),
    "This report uses the ",
    a(
      href = "https://finhealthnetwork.org/research/financial-health-pulse-2021-u-s-trends/",
      target = "_blank",
      "Financial Health Network's 2021 Pulse Survey and Trends Report"
    ),
    "to provide a snapshot of first-, second-, and third-generation immigrants' financial health and how it compares to that of the non-immigrant population."
  ),
  div(class="alert alert-info",
  p(
    span(style = "color:#ed8b00", icon("lightbulb")),
    strong(HTML('&nbsp;'),"Key questions for consideration:")
  ),
  tags$ul(
    tags$li(
      "How does the financial health of immigrant populations compare to that of non-immigrant populations in the United States?"
    ),
    tags$li(
      "How does the financial health of immigrant populations evolve across generations?"
    ),
    tags$li(
      "What implications may these findings have on the development of outreach services, financial tools, and advocacy initiatives targeted to immigrant populations in the United States?"
    )
  )
)
)