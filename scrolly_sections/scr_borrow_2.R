scr_8 <- scrolly_section(
  id = 8,
  h2(icon("magnifying-glass-chart"),
     " Drill Down: Borrowing Behaviors"),
  radioButtons(
    "id8",
    width = "100%",
    label = "Select a question to display it in the graph to the right.",
    choices = split(as.character(stack(q_borrow)$ind), stack(q_borrow)$values)
  ),
  br(),
  hr(),
  p(
    span(icon("lightbulb"), "Takeaways: ", style = "font-weight:bold; color:firebrick"),
    "Third-generation immigrants and non-immigrants were notably more likely to have health insurance, to have one or more credit cards, and to have an 'excellent' or 'very good' credit score. They were also the most likely to report not having any debt. Other populations reported more difficulties managing debts. Some immigrant populations may experience underbanking and/or",a(href="https://www.badcredit.org/exploring-credit-behaviors-undocumented-immigrants/","may become targets of predatory payday lending institutions",target="_blank"),"which can lead to unmanageable debt burdens."
  )
)