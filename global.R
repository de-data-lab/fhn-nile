library(shiny)
library(shinythemes)
library(shinydashboard)
library(highcharter)
library(tidyverse)
library(shinyjs)
library(scrollytell)
library(here)

here::i_am("global.R")
source("question_lists.R")

pulse_2021 <- read.csv("~/Documents/Projects/2022-8 Mock Project/fhn-nile/data/Pulse_2021_survey_public_data (4).csv")
pulse_2021$immigrant_status <- trimws(gsub("[0-9]","",pulse_2021$immigrant_status))


# ===== Function to generate frequency column 

get_freq <- function(var) {
  d <- pulse_2021 %>% 
    group_by(immigrant_status, {{var}}) %>% 
    filter(! {{var}} %in% c(".a",".e", NA) & !immigrant_status %in% c("Unknown immigrant status")) %>% 
    summarise(n = n()) %>% 
    mutate(freq = round(n / sum(n), 2) * 100) %>% 
    ungroup()

   label <- d %>% pull({{ var }})
   d$label <- as.character(trimws(gsub("^[0-9]{1}","",label)))

  return(d) 
}

# ===== Function to generate numeric column 

get_mean <- function(var) {
  d <- pulse_2021 %>% 
    group_by(immigrant_status) %>% 
    filter(! {{var}} %in% c(".a",".e", NA) & !immigrant_status %in% c("Unknown immigrant status")) %>% 
    summarise(var2 = round(mean(as.numeric( {{var}} ), na.rm = T), 2), n = n()) %>% 
    ungroup()
  
  return(d) 
} 

# ===== Function to create chart from numeric column 

make_hc_num <- function(title, subtitle, data, var) {
  highchart() %>% 
    hc_add_series(data, hcaes(x = immigrant_status, 
                              y = var2),
                  name = title,
                  showInLegend = F,
                  type="column") %>% 
    hc_plotOptions(title = list(text = "Hello world"), 
                   column = list(
      dataLabels = list(
        enabled = TRUE,
        inside = TRUE,
        formatter = JS(
          "function(){console.log(this); return `${this.point.y} <br/> n = ${this.point.n}` }"
        )
      ))) %>% 
    hc_title(text = title)  %>%
    hc_subtitle(text = subtitle) %>% 
    hc_xAxis(
      type="category",
      labels = list(style = list(color =  "#000000")), 
      title = list(text= ""),
      lineWidth = 0,
      tickWidth = 0
    ) %>% hc_add_theme(hc_theme_gridlight())
}  
make_hc_num("Average \"Borrow\" Score", 
            "Debt-to-Income Ratio, credit score or credit quality tier", 
            get_mean(Scores_Borrow), 
            var2)

make_hc_num("Average \"Spend\" Score", 
            "<em>Spend less than income, Pay bills on time and in full</em>", 
            get_mean(Scores_Spend), 
            var2)


# ===== Function to create chart from categorical column 

make_hc_cat <- function(title, subtitle, data, var) {
  highchart() %>% 
    hc_add_series(data, hcaes(x = label, y = freq, group = immigrant_status),type="bar")  %>% 
    hc_plotOptions(title = list(text = "Hello world"), 
                   bar = list(
                     dataLabels = list(
                       enabled = TRUE,
                       inside = F,
                       formatter = JS(
                         "function(){console.log(this); return `${this.point.y}%` }"
                       )
                     ))) %>% 
    hc_title(text = title)  %>%
    hc_xAxis(
      type="category",
      labels = list(style = list(color =  "#000000")), 
      title = list(text= ""),
      lineWidth = 0,
      tickWidth = 0
    ) %>% hc_add_theme(hc_theme_google())
}

