definitions <- div(
  h2("Scope and Key Definitions"),
  p("The data about immigration status in the FHN dataset come from USC's Understanding America Study, and the response options are as follows:"),
  tags$ul(class = "list-group list-group-flush",
    tags$li(class="list-group-item", strong("Non-immigrant")),
    tags$li(class="list-group-item", strong("First generation immigrant:"), "immigrant who
migrated to the U.S."),
    tags$li(class="list-group-item", strong("Second generation immigrant:"), "U.S.-born children of at least one foreign-born parent."),
    tags$li(class="list-group-item", strong("Third generation immigrant:"), "U.S.-born children of at least one U.S.-born parent, where at least one grandparent is foreign-born."),
    tags$li(class="list-group-item", strong("Unknown immigrant status"), em("(excluded from this report.)"))
  ),
  br(),
  p("This report looks at the FHN survey data from 2021. Due to the outsize impact of the COVID-19 pandemic on Americans' actual and perceived financial health, averaging over multiple years of pre- and post-pandemic survey data could possibly paint a more accurate longer-term picture of these indicators, but this report provides an interesting snapshot of the current status quo."), 
  p("The sections that follow explore each of the FinHealth scores in detail. Graphs depicting the top-level scores for each indicator (Spend, Save, Borrow, Plan) are accompanied by a curated selection of survey questions that provide additional insights and context. You can hover over any bar item to view sample size information.")
)