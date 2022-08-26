scr_1 <- scrolly_section(
  id = 1,
  img(
    src = 'https://images.pexels.com/photos/7821915/pexels-photo-7821915.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    width = '90%',
    height = 'auto'
  ),
  h2("Overall Financial Health Scores"),
  p(
    "The Financial Health Network's FinHealth Score is \"a metric based on survey questions that align with the", a(href="https://cfsi-innovation-files-2018.s3.amazonaws.com/wp-content/uploads/2016/05/09212818/Consumer-FinHealth-Metrics-FINAL_May.pdf", target="_blank", "eight indicators of financial health."),"\" Respondents receive one aggregate FinHealth Score and four subscores – 'Spend', 'Save', 'Borrow', and 'Plan' – each of which range from 0-100. The top-level FinHealth Score is used to categorize each respondent into one of three financial health tiers: Financially Vulnerable, Financially Coping, or Financially Healthy. (See the", a(href="https://finhealthnetwork.org/tools/financial-health-score/finhealth-score-methodology/", target="_blank", "FinHealth Score methodology"), "for more information."), 
  p(
    "In 2021, non-immigrants and third-generation immigrants were more likely than first- or second-generation immigrants to have a \"Healthy\" FinHealth Score. Similar percentages of non-immigrants, first-generation immigrants, and second-generation immigrants fell into the \"Vulnerable\" category, whereas the share of financially vulnerable third-generation immigrants was noticeably lower."
  )
  )