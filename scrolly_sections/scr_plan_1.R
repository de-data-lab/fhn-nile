scr_9 <- scrolly_section(
  id = 9,
  img(
    src = 'https://images.pexels.com/photos/3811082/pexels-photo-3811082.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    width = '90%',
    height = 'auto'
  ),
  h2("Planning Behaviors"),
  br(),
  p(
    "The ",
    strong("Plan"),
    " indicators look at individuals' insurance coverage (as a proxy for their ability to manage financial shocks and protect their assets) and their ability to budget and plan for the future."
  ),
  p(
    "Past analyses (e.g.", a(href="https://www.guttmacher.org/report/new-analyses-us-immigrant-health-care-access-underscore-need-eliminate-discriminatory", target="_blank", "Fuentes, Desai and Dawson 2022"), "have revealed significant disparities in access to insurance by immigration status, which is borne out in the findings of the FHN survey and may underscore the need to develop targeted outreach and education initiatives."
  )
)