scr_2 <- scrolly_section(
  id = 2,
  h2(icon("magnifying-glass-chart"), " Drill Down: Financial Health"),
  br(),
  p(
    "Use the dropdown below to explore respondents' perceptions of their financial wellbeing in 2021."
  ),
  br(),
  radioButtons(
    inputId = "id2",
    width = "100%",
    label = "Select a question to display it in the graph to the right.",
    choices = split(as.character(stack(q_overall)$ind), stack(q_overall)$values)
  ),
  br(),
  hr(),
  p(
    span(icon("lightbulb"), "Takeaways: ", style = "font-weight:bold; color:firebrick"),
    "Third-generation immigrants generally report lower stress levels, lower levels of concern about food insecurity, and fewer overall worries about money even when compared to those who identified as non-immigrants. A plurality of all respondents are 'somewhat satisfied' with their financial situation, but non-immigrants and third-generation immigrants are significantly more likely to be 'very' or 'extremely satisfied.'"
  )
)