about <- fluidRow(
  column(
    8, 
    style = "border-right: 1px solid #eaeaea",
  div(
  class = "card",
  h2(class = "card-header", "About the Data"),
  p(
    class = "card-text",
    "The",
    strong("Financial Health Network’s (FHN)"),
    a(href = "https://finhealthnetwork.org/programs/financial-health-pulse/", target =
        "_blank", "Pulse surveys"),
    "assess the financial health of U.S. households across a large number of indicators. The Pulse reports draw upon survey data as well as opt-in transactional and account information from participants of",
    a(
      href = "https://uasdata.usc.edu/index.php",
      target = "_blank",
      "USC’s Understanding America Study (UAS)."
    )
  ),
  p(
    "The key innovation of the FHN Pulse is the",
    a(href = "https://finhealthnetwork.org/tools/financial-health-score/", target =
        "_blank", "FinHealth Score,"),
    "which estimates survey respondent’s financial health on a spectrum from “Financially Vulnerable” to 'Financially Healthy.' This score is a composite number based on a respondent's reported spending, saving, borrowing, and planning behaviors."
  )
)), 
 column(
   4,
   img(
     src = 'https://images.pexels.com/photos/3833052/pexels-photo-3833052.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
     width = '100%',
     height = 'auto',
     style = "display:block; margin:auto"
   )
 )
)