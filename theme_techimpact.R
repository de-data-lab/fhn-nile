# defines a custom highcharter theme for Tech Impact 
hc_theme_techimpact =
  hc_theme_merge(
    hc_theme_google(),
    hc_theme(
      colors = c(
        "#C1C6C8",
        "#0057B8",
        "#78BE20",
        "#ED8B00",
        "#9C4CED",
        "firebrick"
      ),
      chart = list(style = list(fontFamily = "Josefin Sans")),
      # Seems titles are outside chart area so need own font specification
      title = list(
        style = list(
          fontFamily = "Libre Franklin",
          fontStyle = "bold",
          fontWeight = "900",
          fontSize = "2.4rem"
        )
      ),
      subtitle = list(style = list(fontFamily = "Josefin Sans")),
      plotOptions = list(line = list(
        marker = list(
          symbol = "circle",
          lineWidth = 2,
          radius = 5
        )
      ))
    )
  )