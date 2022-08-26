scr_10 <- scrolly_section(
  id = 10,
  h2(
    icon("magnifying-glass-chart"),
    " Drill Down: Planning Behaviors"
  ),
  radioButtons(
    "id10",
    width = "100%",
    label = "Select a question to display it in the graph to the right.",
    choices = split(as.character(stack(q_plan)$ind), stack(q_plan)$values)
  ),
  br(),
  hr(),
  p(
    span(icon("lightbulb"), "Takeaways: ", style = "font-weight:bold; color:firebrick"),
    "First- and second-generation immigrants were more likely to have overdrawn their checking accounts and less likely to plan ahead financially. Interestingly, non-immigrants were more likely to respond that they had trouble paying medical bills and to carry a credit card balance for 3-5+ months. A possible hypothesis for the first phenomena is that non-immigrants are more likely to seek out healthcare, making them more likely to incur medical costs. Non-immigrants may also carry larger credit card balances, making it more difficult to make payments in a timely manner."
  )
)