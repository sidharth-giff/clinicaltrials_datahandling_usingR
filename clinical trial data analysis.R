library(tidyverse)

clinical_data <- data.frame(
  
  patient_id = c(
    "P101","P102","P103","P104",
    "P105","P106","P107","P108",
    "P109","P110","P110","P112"
  ),
  patient_name = c(  
    "Arun", 
    "navya",
    " MEERA",
    "divya ",
    "KIRAN",
    "Anjali",
    "rohit",
    "Sneha",
    "arjun",
    "RAVI",
    "RAVI",
    "Meera"
  ),
   
  
  
  
  treatment_group = c(
    "Control",
    "Drug A",
    "drug a",
    "CONTROL",
    "Drug B",
    "drug b",
    "Control",
    "Drug A",
    "Drug B",
    "CONTROL",
    "CONTROL",
    "Drug B"
  ),
  
  blood_pressure = c(
    120,
    135,
    250,
    118,
    140,
    NA,
    125,
    130,
    -20,
    145,
    145,
    138
  ),
  
  glucose_level = c(
    90,
    110,
    105,
    500,
    115,
    120,
    NA,
    108,
    112,
    118,
    118,
    109
  ),
  
  cholesterol = c(
    180,
    220,
    210,
    190,
    250,
    240,
    200,
    215,
    230,
    225,
    225,
    NA
  ),
  
  visit_date = c(
    "2024-01-10",
    "12-02-2024",
    "2024/03/01",
    "invalid",
    "2024-04-12",
    "2024-05-01",
    "2024/06/15",
    "01-07-2024",
    "not recorded",
    "2024-08-10",
    "2024-08-10",
    "18-09-2024"
  ),
  
  stringsAsFactors = FALSE
)
print(clinical_data)

head(clinical_data)

tail(clinical_data)

summary(clinical_data)

library(dplyr)
library(stringr)
glimpse(clinical_data)

str_trim(clinical_data)

str_to_title(clinical_data)

duplicated(clinical_data)

distinct(clinical_data)

clinical_data$newcolumn <- ifelse(clinical_data$blood_pressure > 200, NA,
                                  ifelse(clinical_data$blood_pressure < 0, NA,
                                         ifelse(clinical_data$glucose_level > 100, NA,
                                                "Valid")))

print(clinical_data)

library(lubridate)

clinical_data$visit_date <- parse_date_time(
  clinical_data$visit_date,
  orders = c("ymd", "dmy", "Y/m/d")
)

print(clinical_data)

clinical_data$year <- year(clinical_data$visit_date)

clinical_data$month <- month(clinical_data$visit_date)

print(clinical_data)

mean(clinical_data$blood_pressure,na.rm = TRUE)

median(clinical_data$glucose_level,na.rm = TRUE)

sd(clinical_data$cholesterol,na.rm = TRUE)

var(clinical_data,na.rm = TRUE)

min(clinical_data$blood_pressure,na.rm = TRUE)

max(clinical_data$blood_pressure,na.rm = TRUE)

range(clinical_data$blood_pressure,na.rm = TRUE)

quantile(clinical_data$glucose_level,na.rm=TRUE)

IQR(clinical_data$glucose_level,na.rm=TRUE)

correlation <- cor(
  clinical_data$glucose_level,
  clinical_data$cholesterol,
  use = "complete.obs"
)

print(correlation)

write.csv(clinical_data,"Clinical Trial Drug Response Analysis using R.csv")
getwd()
