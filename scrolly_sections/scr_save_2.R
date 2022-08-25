scr_6 <- scrolly_section(
  id = 6,
  h2(icon("magnifying-glass-chart"),
     " Drill Down: Saving Behaviors"),
  radioButtons(
    "id6",
    width = "100%",
    label = "Select a question to display it in the graph to the right.",
    choices = split(as.character(stack(q_save)$ind), stack(q_save)$values)
  ),
  br(),
  hr(),
  p(
    span(icon("lightbulb"), "Takeaways: ", style = "font-weight:bold; color:firebrick"),
    "Individuals across all populations displayed similar levels of likelihood to set money aside for an emergency. However, third-generation immigrants were significantly more likely to report having enough liquid funds to make it through the next 6 months or more. This group also displayed the highest level of confidence in their long-term financial behaviors."
  )
)