definitions <- div(
  h2("Key Definitions and Limitations"),
  p("The data about immigration status in the FHN dataset come from USC's Understanding America Study, and the response options are as follows (emphasis added):"),
  tags$ul(
    tags$li(strong("Non-immigrant;")),
    tags$li(strong("First generation immigrant"), "(immigrant who
migrated to the U.S);"),
    tags$li(strong("Second generation immigrant"), "(U.S.-born children of at least one foreign-born parent);"),
    tags$li(strong("Third generation immigrant"), "(U.S.-born children of at least one U.S.-born parent, where at least one grandparent is foreign-born);"),
    tags$li(strong("Unknown immigrant status"), em("[excluded from this report.]"))
  ),
  p("Importantly, generational status in the FHN survey is self-reported. Consider that a second- or third-generation immigrant may or may not identify as an immigrant at all depending on the context, their connection to their family's country of origin, etc. Keeping in mind that immigrant status is often more a matter of identity than an exact definition, we can still identify several interesting intergenerational trends."),
  p("This report looks at the FHN survey data from 2021. Due to the outsize impact of the COVID-19 pandemic on Americans' actual and perceived financial health, averaging over multiple years of pre- and post-pandemic survey data could possibly paint a more accurate longer-term picture of these indicators, but this report provides an interesting snapshot of the current status quo.")
)