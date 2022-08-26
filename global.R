library(shiny)
library(shinythemes)
library(highcharter)
library(tidyverse)
library(shinyjs)
library(scrollytell)
library(here)
library(shinyWidgets)



here::i_am("global.R")
source("question_lists.R")

source("scrolly_sections/scr_overall_1.R")
source("scrolly_sections/scr_overall_2.R")
source("scrolly_sections/scr_spend_1.R")
source("scrolly_sections/scr_spend_2.R")
source("scrolly_sections/scr_save_1.R")
source("scrolly_sections/scr_save_2.R")
source("scrolly_sections/scr_plan_1.R")
source("scrolly_sections/scr_plan_2.R")
source("scrolly_sections/scr_borrow_1.R")
source("scrolly_sections/scr_borrow_2.R")
source("components/text/intro.R")
source("components/text/about.R")
source("components/text/definitions.R")
source("components/text/conclusion.R")
source("theme_techimpact.R")

pulse_2021 <-
  read.csv(
    "~/Documents/Projects/2022-8 Mock Project/fhn-nile/data/Pulse_2021_survey_public_data (4).csv"
  )

pulse_2021$immigrant_status <-
  trimws(gsub("[0-9]", "", pulse_2021$immigrant_status))

pulse_2021$immigrant_status <-
  factor(
    pulse_2021$immigrant_status,
    levels = c(
      "Non-immigrant",
      "First generation immigrant",
      "Second generation immigrant",
      "Third generation immigrant"
    )
  )

pulse_2021$FinancialHealth <- fct_relevel(pulse_2021$FinancialHealth,c("Vulnerable","Coping","Healthy"))

# ===== Function to generate frequency column

get_freq <- function(var) {
  l <- var
  d <- pulse_2021 %>%
    group_by(immigrant_status, .data[[var]]) %>%
    filter(!.data[[var]] %in% c(".a", ".e", "", NA) &
             !is.na(immigrant_status)) %>%
    summarise(n = n()) %>%
    mutate(freq = round(n / sum(n), 2) * 100) %>%
    ungroup()
  
  
  label <- d %>% pull(.data[[var]])
  
  d$label <- label
  # d$label <- trimws(gsub("^[0-9]","",d$label))
  
  
  return(d)
}

# ===== Function to generate numeric column

get_mean <- function(var) {
  l <- syms(var)
  d <- pulse_2021 %>%
    group_by(immigrant_status) %>%
    filter(!!!!l %in% c(".a", ".e", NA) &
             !is.na(immigrant_status)) %>%
    summarise(var2 = round(mean(as.numeric(!!!l), na.rm = T), 2), n = n()) %>%
    ungroup()
  
  return(d)
}

# ===== Function to create chart from numeric column

make_hc_num <- function(title, subtitle, caption, data) {
  highchart() %>%
    hc_add_series(
      data,
      hcaes(x = immigrant_status, color = immigrant_status, y = var2),
      name = title,
      showInLegend = F,
      type = "bar",
      inverted = TRUE
    ) %>%
    hc_add_series(
      data,
      hcaes(x = immigrant_status, color = immigrant_status, y = var2),
      name = title,
      showInLegend = F,
      type = "lollipop",
      inverted = TRUE
    ) %>%
    hc_plotOptions(
      lollipop = list(
        connectorWidth = 0,
        marker = list(radius = 8, lineWidth = 1, symbol="diamond"),
        dataLabels = list(
          enabled = TRUE,
          inside = FALSE,
          padding = 20,
          style = list(fontSize = "1.5rem"),
          formatter = JS("function(){return `${this.point.y}` }")
        )
      ),
      bar = list(dataLabels = list(
        enabled = F,
        inside = TRUE,
        formatter = JS("function(){return `${this.point.y}` }")
      ))
    ) %>%
    hc_title(text = title) %>%
    hc_subtitle(text = subtitle) %>%
    hc_caption(text = caption,
               verticalAlign = "bottom",
               align = "center")    %>%
    hc_xAxis(
      type = "category",
      labels = list(style = list(color =  "#000000"),
                    formatter = JS("function() { return `${this.value}s` }")),
      title = list(text = ""),
      lineWidth = 0,
      tickWidth = 0
    ) %>% 
    hc_yAxis(min = 0, max = 100)  %>% 
    hc_add_theme(hc_theme_techimpact) %>% 
    hc_size(height = 700)
}





# ==== Function to create gauge chart from numeric column

make_hc_gauge <- function(var, status, title) {
  d <- get_mean(var)
  val <- d$var2[d$immigrant_status == {
    {
      status
    }
  }]
  
  highchart() %>% hc_chart(
    type = "gauge",
    plotBackgroundColor = NA,
    plotBackgroundImage = NA,
    plotShadow = F,
    plotBorderWidth = 0
  ) %>%
    hc_pane(
      startAngle = -89,
      endAngle = 89,
      background = NA,
      center = c('50%', '55%')
    ) %>%
    hc_yAxis(
      min = 0,
      max = 100,
      plotBands = list(
        list(
          from = 0,
          to = 40,
          color = "#ED8B00",
          thickness = 30
        ),
        list(
          from = 40,
          to = 80,
          color = "#0057B8",
          thickness = 30
        ),
        list(
          from = 80,
          to = 100,
          color = "#78BE20",
          thickness = 30
        )
      ),
      tickPosition = "inside",
      tickWidth = 1,
      minorTickInterval = NA,
      tickLength = 30,
      labels = list(distance = 20),
      tickPixelInterval = 72
    ) %>%
    hc_plotOptions(gauge = list(
      dial = list(
        radius = "70%",
        baseLength = "0%",
        rearLength = "0%"
      ),
      dataLabels = list(
        enabled = T,
        borderWidth = 0,
        style = list(fontSize = "1.5rem", textAlign = "center"),
        formatter = JS(
          paste0("function(){return `${this.y}`}")
        )
      )
    )) %>%
    hc_add_series(data = list({
      {
        val
      }
    })) %>%
    hc_title(text = paste0(title, ": ", status, "s")) %>%
    hc_add_theme(hc_theme_techimpact)
}

# ===== Function to create chart from categorical column

make_hc_cat <- function(title, subtitle, caption, data) {
  highchart() %>%
    hc_add_series(
      data,
      hcaes(
        x = immigrant_status,
        y = freq,
        group = label,
        opacity = ifelse(immigrant_status == "Non-immigrant", .5, 1)
      ),
      type = "bar",
      stacking = "percent"
    )  %>%
    hc_plotOptions(bar = list(dataLabels = list(
      enabled = T,
      inside = T,
      formatter = JS("function(){return `${this.point.y}%` }")
    ))) %>%
    hc_tooltip(
      useHTML = T,
      formatter = JS(
        "function() { 
            if(/\\d/.test(this.point.label)) {this.point.label = this.point.label.split(/^[0-9]/)[1].trim()}
             return `${this.point.label} <br/> ${this.point.name}: ${this.point.y}% (n = ${this.point.n})`} "
      )
    ) %>%
    hc_title(text = title)  %>%
    hc_subtitle(text = subtitle) %>%
    hc_caption(text = caption,
               verticalAlign = "bottom",
               align = "center") %>%
    hc_xAxis(
      type = "category",
      title = list(text = caption, align = "left"),
      labels = list(
        style = list(color =  "#000000", fontSize="1.4rem"),
        formatter = JS("function() { return `${this.value}s` }")),
      lineWidth = 0,
      gridLineWidth = 0,
      tickWidth = 1
    ) %>% 
    hc_add_theme(hc_theme_techimpact) %>% 
    hc_legend(verticalAlign = "top", itemDistance = 50) %>%
    hc_yAxis(reversedStacks = F,
             lineWidth = 0,
             gridLineWidth = 0,
             visible = F,
             labels = list(formatter = JS("function() { return `${this.value}%` }"))) %>% 
    hc_size(height =  700) %>% 
    hc_legend(labelFormatter = JS("function() { 
                                if(/\\d/.test(this.name)) {return `${this.name.split(/^[0-9]/)[1].trim()}`}
                                else { return this.name }
                                  }"))
}  
make_hc_cat(
  title = "Overall Financial Health Ratings, 2021*",
  subtitle = "",
  '<br/><br/>*Based on scores of 0-100. <strong>0-39:</strong> "Financially Vulnerable"; <strong>40-79:</strong> "Financially Coping"; <strong>80-100:</strong> "Financially Healthy"',
  data = get_freq("q003")
)


