scr_4 <- scrolly_section(
  id = 4,
  h2(
    icon("magnifying-glass-chart"),
    " Drill Down: Spending Behaviors"
  ),
  radioButtons(
    "id4",
    width = "100%",
    label = "Select a question to display it in the graph to the right.",
    choices = split(as.character(stack(q_spend)$ind), stack(q_spend)$values)
  ),
  br(),
  hr(),
  p(
    span(icon("lightbulb"), "Takeaways: ", style = "font-weight:bold; color:firebrick"),
    "were significantly more likely to report that their households were able to pay their bills on time or nearly all of the time. They were also more likely to report that they spent less than they earned over the past year."
  )
)