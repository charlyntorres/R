# INSTALLS NECESSARY PACKAGES
library(readr)
library(dplyr)
library(plotly)
library(nnet)

# IMPORTS DATASETS
# NOTE: Download the itjob_header.csv and replace the file path using the same format as below.
itjobs <- read_csv("C:/Users/torre/Documents/itjobs.csv", show_col_types = FALSE)
View(itjobs)

# ------------------------------------------------------------------------------

# -------------------------------- DATA CLEANING -------------------------------

# ------------------------------------------------------------------------------

# CLEAN TECH SPECIALISATION VALUES
clean_tech_specialisation <- function(itjobs) {
  itjobs <- itjobs %>%
    mutate(
      tech_specialisation = case_when(
        grepl("\\bNET\\b|Dot", tech_specialisation, ignore.case = TRUE) ~ ".NET",
        grepl("Agile", tech_specialisation, ignore.case = TRUE) ~ "Agile",
        grepl("Agri", tech_specialisation, ignore.case = TRUE) ~ "Agriculture",
        grepl("\\bIoT\\b|\\bAI\\b|Things|Artificial|Machine", tech_specialisation, ignore.case = TRUE) ~ "AI/IoT/ML",
        grepl("Angular", tech_specialisation, ignore.case = TRUE) ~ "AngularJS",
        grepl("Fraud", tech_specialisation, ignore.case = TRUE) ~ "Anti-Fraud",
        grepl("\\bAPI\\b|FastAPI", tech_specialisation, ignore.case = TRUE) ~ "API",
        grepl("Application", tech_specialisation, ignore.case = TRUE) ~ "Applications",
        grepl("Architect", tech_specialisation, ignore.case = TRUE) ~ "Architecture",
        grepl("Automa", tech_specialisation, ignore.case = TRUE) ~ "Automation",
        grepl("AWS", tech_specialisation, ignore.case = TRUE) ~ "AWS",
        grepl("Back[- ]?end", tech_specialisation, ignore.case = TRUE) ~ "Back-end Development",
        grepl("Bank", tech_specialisation, ignore.case = TRUE) ~ "Banking",
        grepl("Big", tech_specialisation, ignore.case = TRUE) ~ "Big Data",
        grepl("BPM", tech_specialisation, ignore.case = TRUE) ~ "BPM",
        grepl("CCTV", tech_specialisation, ignore.case = TRUE) ~ "CCTV",
        grepl("\\bChat", tech_specialisation, ignore.case = TRUE) ~ "Chatbot Development",
        grepl("Cisco", tech_specialisation, ignore.case = TRUE) ~ "Cisco Technologies",
        grepl("Cloud", tech_specialisation, ignore.case = TRUE) ~ "Cloud Computing",
        grepl("Consult", tech_specialisation, ignore.case = TRUE) ~ "Consulting",
        grepl("Crypto", tech_specialisation, ignore.case = TRUE) ~ "Cryptocurrency",
        grepl("Customer", tech_specialisation, ignore.case = TRUE) ~ "Customer Management",
        grepl("Cyber", tech_specialisation, ignore.case = TRUE) ~ "Cybersecurity",
        grepl("Analytics|Data Analysis|Data Science|Data Center|DataOps|Metadata|Big", tech_specialisation, ignore.case = TRUE) ~ "Data",
        grepl("Database", tech_specialisation, ignore.case = TRUE) ~ "Database",
        grepl("Commerce", tech_specialisation, ignore.case = TRUE) ~ "E-Commerce",
        grepl("Econo", tech_specialisation, ignore.case = TRUE) ~ "Economics",
        grepl("Electri", tech_specialisation, ignore.case = TRUE) ~ "Electrical",
        grepl("Electro", tech_specialisation, ignore.case = TRUE) ~ "Electronics",
        grepl("Embed", tech_specialisation, ignore.case = TRUE) ~ "Embedded Systems",
        grepl("Energy", tech_specialisation, ignore.case = TRUE) ~ "Energy",
        grepl("Engineer", tech_specialisation, ignore.case = TRUE) ~ "Engineering",
        grepl("ERP", tech_specialisation, ignore.case = TRUE) ~ "ERP Systems",
        grepl("Finan|Fintech", tech_specialisation, ignore.case = TRUE) ~ "Finance",
        grepl("Food", tech_specialisation, ignore.case = TRUE) ~ "Food Technology",
        grepl("Front", tech_specialisation, ignore.case = TRUE) ~ "Front-End Development",
        grepl("Full-", tech_specialisation, ignore.case = TRUE) ~ "Full-Stack Development",
        grepl("Gam", tech_specialisation, ignore.case = TRUE) ~ "Game Development",
        grepl("Google", tech_specialisation, ignore.case = TRUE) ~ "Google",
        grepl("Graphic", tech_specialisation, ignore.case = TRUE) ~ "Graphics Design",
        grepl("Hardware", tech_specialisation, ignore.case = TRUE) ~ "Hardware",
        grepl("Health", tech_specialisation, ignore.case = TRUE) ~ "Health IT",
        grepl("Help", tech_specialisation, ignore.case = TRUE) ~ "Help Desk",
        grepl("\\bHR", tech_specialisation, ignore.case = TRUE) ~ "HR",
        grepl("HTML", tech_specialisation, ignore.case = TRUE) ~ "HTML",
        grepl("IBM", tech_specialisation, ignore.case = TRUE) ~ "IBM Technologies",
        grepl("ICT", tech_specialisation, ignore.case = TRUE) ~ "ICT Systems",
        grepl("Information Tech", tech_specialisation, ignore.case = TRUE) ~ "Information Technology",
        grepl("\\bInfra", tech_specialisation, ignore.case = TRUE) ~ "Infrastructure",
        grepl("Integ", tech_specialisation, ignore.case = TRUE) ~ "Integration",
        grepl("Invest", tech_specialisation, ignore.case = TRUE) ~ "Investment Services",
        grepl("Audit", tech_specialisation, ignore.case = TRUE) ~ "IT Audit",
        grepl("Govern", tech_specialisation, ignore.case = TRUE) ~ "IT Governance",
        grepl("Solution", tech_specialisation, ignore.case = TRUE) ~ "IT Solutions",
        grepl("Support", tech_specialisation, ignore.case = TRUE) ~ "IT Support",
        grepl("Kubernetes", tech_specialisation, ignore.case = TRUE) ~ "Kubernetes",
        grepl("Laravel", tech_specialisation, ignore.case = TRUE) ~ "Laravel",
        grepl("Linux", tech_specialisation, ignore.case = TRUE) ~ "Linux",
        grepl("Logistic", tech_specialisation, ignore.case = TRUE) ~ "Logistics",
        grepl("Manage", tech_specialisation, ignore.case = TRUE) ~ "Management",
        grepl("Maritime", tech_specialisation, ignore.case = TRUE) ~ "Maritime",
        grepl("Market", tech_specialisation, ignore.case = TRUE) ~ "Marketing",
        grepl("MERN", tech_specialisation, ignore.case = TRUE) ~ "MERN",
        grepl("Microsoft|365|\\bMS", tech_specialisation, ignore.case = TRUE) ~ "Microsoft Technologies",
        grepl("Mobile", tech_specialisation, ignore.case = TRUE) ~ "Mobile App Development",
        grepl("NetSuite", tech_specialisation, ignore.case = TRUE) ~ "NetSuite",
        grepl("Network", tech_specialisation, ignore.case = TRUE) ~ "Networks",
        grepl("Node", tech_specialisation, ignore.case = TRUE) ~ "NodeJS",
        grepl("Operation", tech_specialisation, ignore.case = TRUE) ~ "Operations",
        grepl("Oracle", tech_specialisation, ignore.case = TRUE) ~ "Oracle Technologies",
        grepl("Payroll", tech_specialisation, ignore.case = TRUE) ~ "Payroll Services",
        grepl("PeopleSoft", tech_specialisation, ignore.case = TRUE) ~ "PeopleSoft Development",
        grepl("\\bBI\\b|Business Int", tech_specialisation, ignore.case = TRUE) ~ "PowerBI",
        grepl("Project", tech_specialisation, ignore.case = TRUE) ~ "Project Administration",
        grepl("Quality|QA", tech_specialisation, ignore.case = TRUE) ~ "Quality Assurance",
        TRUE ~ tech_specialisation # Default to the original value if no match is found
      )
    )
  
  return(itjobs)
}

itjobs <- clean_tech_specialisation(itjobs)

# REMOVES NA VALUES IN SPECIFIC COLUMNS
itjobs <- itjobs[!is.na(itjobs$level), ]
itjobs <- itjobs[!is.na(itjobs$tech_specialisation), ]
itjobs <- itjobs[!is.na(itjobs$salary_from), ]
itjobs <- itjobs[!is.na(itjobs$salary_to), ]
itjobs <- itjobs[!is.na(itjobs$work_experience_years), ]
itjobs <- itjobs[!is.na(itjobs$education_level), ]

# REMOVE COLUMNS WITH MORE THAN HALF VALUES MISSING (STATE AND VISA SPONSORSHIP)
itjobs <- itjobs[, colMeans(is.na(itjobs)) <= 0.5]

# REMOVES TECH SPECIALISATION WITH ONLY 10 OCCURRENCES
itjobs <- itjobs %>%
  group_by(tech_specialisation) %>%
  filter(n() > 10) %>%
  ungroup()

# ------------------------------------------------------------------------------

# --------------------------- DESCRIPTIVE STATISTICS ---------------------------

# ------------------------------------------------------------------------------

desc_stats <- function(column_name) {
  if (is.numeric(column_name)) {
    column_name_clean <- column_name[!is.na(column_name)] 
    
    # CALCULATE MEAN, MEDIAN, AND STANDARD DEVIATION
    column_mean <- mean(column_name_clean, na.rm = TRUE)
    column_median <- median(column_name_clean, na.rm = TRUE)
    column_sd <- sd(column_name_clean, na.rm = TRUE)
    column_variance <- var(column_name_clean, na.rm = TRUE)
    
    count_table <- table(column_name_clean)
    column_mode <- as.numeric(names(count_table)[which.max(count_table)])
    
    cat("Summary of", colnames(itjobs)[i], "Column:\n")
    cat("Mean: ", column_mean, "\n")
    cat("Median: ", column_median, "\n")
    cat("Mode: ", column_mode, "\n")
    cat("Standard Deviation: ", column_sd, "\n")
    cat("Variance: ", column_variance, "\n")
    
    
    return(list(
      mean = column_mean,
      median = column_median,
      mode = column_mode,
      sd = column_sd,
      variance = column_variance
    ))
    
  } else if (is.factor(column_name) || is.character(column_name)) {
    if (colnames(itjobs)[i] == "tech_specialization") {
      column_name <- tolower(column_name) 
      unique_values <- unique(column_name) 
      
      cat("Number of tech_specialization: ", length(unique_values), "\n")
      
      return(unique_values)
      
    } else {
      cat("Summary of",colnames(itjobs)[i], "Column:\n")
      count_table <- table(column_name)
      print(count_table) 
      
      return(count_table)
    }
  }
}

for (i in 2:ncol(itjobs)) {
  column_name <- itjobs[[i]]
  
  cat("====================================\n")
  cat("Statistics for Column:", colnames(itjobs)[i], "\n")
  desc_stats(column_name)  
  cat("====================================\n\n")
}

str(itjobs)
head(itjobs)
tail(itjobs)

# ------------------------------------------------------------------------------

# ----------------------------- DATA VISUALIZATION -----------------------------

# ------------------------------------------------------------------------------

# ARRANGES TECH SPECIALIZATION ALPHABETICALLY
itjobs <- itjobs[order(itjobs$tech_specialisation), ]
View(itjobs)

# NOTES: Kindly "Run", not "Source" the codes individually to see individual output.

# ------------------------------------------------------------------------------

# --------------------------- IT PROFESSIONALS COUNT ---------------------------

# ------------------------------------------------------------------------------

# COUNT OF IT PROFESSIONALS IN EACH COUNTRY 
it_country <- itjobs %>%
  group_by(country) %>%
  summarize(total_count = n()) %>%
  plot_ly(labels = ~country, values = ~total_count, type = "pie") %>%
  layout(title = "Number of IT Professionals in Each Country", 
         showlegend = TRUE)
print(it_country)

# COUNT OF IT PROFESSIONALS IN EACH SPECIALISATION
it_specialisation <- itjobs %>%
  group_by(tech_specialisation) %>%
  summarize(total_count = n()) %>%
  plot_ly(labels = ~tech_specialisation, values = ~total_count, type = "pie") %>%
  layout(title = "Number of IT Professionals in Each Specialisation", 
         showlegend = TRUE)
print(it_specialisation)

# COUNT OF IT PROFESSIONALS IN EACH EDUCATION LEVEL
it_education <- itjobs %>%
  group_by(education_level) %>%
  summarize(total_count = n()) %>%
  plot_ly(x = ~factor(education_level), y = ~total_count, type = "bar") %>%
  layout(title = "Education Level of IT Professionals", 
         xaxis = list(title = "Education Level"), 
         yaxis = list(title = "Number of IT Professionals"))
print(it_education)

# ------------------------------------------------------------------------------

# ------------------------------ PREVIOUS SALARY -------------------------------

# ------------------------------------------------------------------------------

# AVERAGE PREVIOUS SALARY OF EACH IT INDIVIDUAL
# NOTE: Outliers can be observed here.
salary_from <- plot_ly(data = itjobs, x = ~jobid, y = ~salary_from, type = "scatter", mode = "markers") %>%
  layout(title = "Previous Salary of Each IT Individual", 
         xaxis = list(title = "Individual IT Professional"), 
         yaxis = list(title = "Previous Salary"))
print(salary_from)

# AVERAGE (MEAN) PREVIOUS SALARY OF IT JOBS PER SPECIALISATION
# NOTE: Outliers can be observed here.
prev_salary_tech_specialization <- itjobs %>%
  group_by(tech_specialisation) %>%
  summarize(ave_prev_salary = mean(salary_from, na.rm = TRUE)) %>%
  plot_ly(x = ~tech_specialisation, y = ~ave_prev_salary, type = "scatter", mode = "markers") %>%
  layout(title = "Average Previous Salary of IT Jobs per Specialisation", 
         xaxis = list(title = "Tech Specialisation"), 
         yaxis = list(title = "Average Previous Salary"))
print(prev_salary_tech_specialization)

# ------------------------------------------------------------------------------

# ------------------------------- CURRENT SALARY -------------------------------

# ------------------------------------------------------------------------------

# CURRENT SALARY OF EACH IT PROFESSIONAL
# NOTE: Outliers can be observed here.
salary_to <- plot_ly(data = itjobs, x = ~jobid, y = ~salary_to, type = "scatter", mode = "markers") %>%
  layout(title = "Current Salary of Each IT Individual",
         xaxis = list(title = "Individual IT Professional"), 
         yaxis = list(title = "Average Current Salary"))
print(salary_to)

# AVERAGE (MEAN) CURRENT SALARY OF IT JOBS PER SPECIALISATION
curr_salary_tech_specialization <- itjobs %>%
  group_by(tech_specialisation) %>%
  summarize(ave_curr_salary = mean(salary_to, na.rm = TRUE)) %>%
  plot_ly(x = ~tech_specialisation, y = ~ave_curr_salary, type = "scatter", mode = "markers") %>%
  layout(title = "Average Current Salary of IT Jobs per Specialisation", 
         xaxis = list(title = "Tech Specialisation"), 
         yaxis = list(title = "Average Salary"))
print(curr_salary_tech_specialization)

# ------------------------------------------------------------------------------

# --------------------------- SALARY BASED ON LEVEL ----------------------------

# ------------------------------------------------------------------------------

# AVERAGE SALARY OF IT PROFESSIONALS BASED ON THEIR LEVEL
# NOTE: Zoom for a better view.
salary_level_tech <- itjobs %>%
  group_by(tech_specialisation, level) %>%
  summarise(ave_salary = mean(salary_to, na.rm = TRUE), .groups = "drop") %>%
  plot_ly(x = ~tech_specialisation, y = ~ave_salary, color = ~level, type = "bar") %>%
  layout(barmode = "dodge", 
         title = "Average Salary of IT Professionals Based on their Level", 
         xaxis = list(title = "Tech Specialisation"), 
         yaxis = list(title = "Average Salary"))
print(salary_level_tech)

# ------------------------------------------------------------------------------

# -------------------------- SALARY BASED ON COUNTRY ---------------------------

# ------------------------------------------------------------------------------

# AVERAGE SALARY OF IT PROFESSIONALS IN EACH COUNTRY
cleaned_data <- itjobs %>%
  filter(!is.na(country))

salary_country <- cleaned_data %>%
  group_by(country) %>%
  summarize(average_salary = median(salary_to, na.rm = TRUE)) %>%
  plot_ly(x = ~country, y = ~average_salary, type = "bar") %>%
  layout(title = "Average Salary of IT Professionals by Country", 
         xaxis = list(title = "Country"), 
         yaxis = list(title = "Average Salary"))
print(salary_country)

# ------------------------------------------------------------------------------

# ---------------------- SALARY BASED ON WORK EXPERIENCE -----------------------

# ------------------------------------------------------------------------------

# SALARY OF IT PROFESSIONALS BASED ON WORK EXPERIENCE
cleaned_data <- itjobs %>%
  filter(!is.na(work_experience_years))

salary_work_exp <- cleaned_data %>%
  group_by(work_experience_years) %>%
  summarize(average_salary = median(salary_to, na.rm = TRUE)) %>%
  plot_ly(x = ~work_experience_years, y = ~average_salary, type = "bar") %>%
  layout(title = "Average Salary of IT Professionals Based on Work Experience", 
         xaxis = list(title = "Work Experience in Years"), 
         yaxis = list(title = "Average Salary"))
print(salary_work_exp)

# ------------------------------------------------------------------------------

# ---------------------- SALARY BASED ON EDUCATION LEVEL -----------------------

# ------------------------------------------------------------------------------

# SALARY OF IT PROFESSIONALS BASED ON EDUCATION LEVEL
cleaned_data <- itjobs %>%
  filter(!is.na(education_level))

salary_education <- cleaned_data %>%
  group_by(education_level) %>%
  summarize(ave_salary = median(salary_to, na.rm = TRUE)) %>%
  plot_ly(x = ~education_level, y = ~ave_salary, type = "bar") %>%
  layout(title = "Average Salary of IT Professionals Based on Education Level", 
         xaxis = list(title = "Education Level"), 
         yaxis = list(title = "Average Salary"))
print(salary_education)

# ------------------------------------------------------------------------------

# ------------ SALARY BASED ON EDUCATION LEVEL AND WORK EXPERIENCE -------------

# ------------------------------------------------------------------------------

# AVERAGE SALARY OF IT PROFESSIONALS BASED ON EDUCATION LEVEL AND WORK EXPERIENCE
salary_education_work <- itjobs %>%
  group_by(education_level, work_experience_years) %>%
  summarize(ave_salary = mean(salary_to, na.rm = TRUE), .groups = "drop") %>%
  plot_ly(x = ~work_experience_years, y = ~ave_salary, color = ~education_level, type = "bar") %>%
  layout(barmode = "dodge", 
         title = "Average Salary of IT Professionals Based on Education Level and Work Experience", 
         xaxis = list(title = "Work Experience"), 
         yaxis = list(title = "Average Salary"))
print(salary_education_work)

# ------------------------------------------------------------------------------

# ------------------ TOP TECH SPECIALISATION IN EACH COUNTRY -------------------

# ------------------------------------------------------------------------------

# NOTE: If masiyadong marami yung values inside the pie chart (e.g., u want to 
# lessen the pie chart to 5-7 slices), just go to this part:
# filter(cumu_percentage <= 0.5) %>%
# and then change the value to 0.4, 0.3, 0.2, or 0.1 (depends on what u want)

# ------------------------------------------------------------------------------

# AUSTRALIA
australia_it <- itjobs %>%
  filter(country == "Australia") %>%
  group_by(tech_specialisation) %>%
  summarize(total_count = n()) %>%
  arrange(desc(total_count)) %>%
  mutate(cumu_percentage = cumsum(total_count) / sum(total_count)) %>%
  filter(cumu_percentage <= 0.5) %>%
  plot_ly(labels = ~tech_specialisation, values = ~total_count, type = "pie") %>%
  layout(title = "Top 50% Tech Specialisation in Australia", showlegend = TRUE)
print(australia_it)

# HONG KONG
hongkong_it <- itjobs %>%
  filter(country == "Hong Kong") %>%
  group_by(tech_specialisation) %>%
  summarize(total_count = n()) %>%
  arrange(desc(total_count)) %>%
  mutate(cumu_percentage = cumsum(total_count) / sum(total_count)) %>%
  filter(cumu_percentage <= 0.5) %>%
  plot_ly(labels = ~tech_specialisation, values = ~total_count, type = "pie") %>%
  layout(title = "Top 50% Tech Specialisation in Hong Kong", showlegend = TRUE)
print(hongkong_it)

# INDONESIA
indonesia_it <- itjobs %>%
  filter(country == "Indonesia") %>%
  group_by(tech_specialisation) %>%
  summarize(total_count = n()) %>%
  arrange(desc(total_count)) %>%
  mutate(cumu_percentage = cumsum(total_count) / sum(total_count)) %>%
  filter(cumu_percentage <= 0.5) %>%
  plot_ly(labels = ~tech_specialisation, values = ~total_count, type = "pie") %>%
  layout(title = "Top 50% Tech Specialisation in Indonesia", showlegend = TRUE)
print(indonesia_it)

# MALAYSIA
malaysia_it <- itjobs %>%
  filter(country == "Malaysia") %>%
  group_by(tech_specialisation) %>%
  summarize(total_count = n()) %>%
  arrange(desc(total_count)) %>%
  mutate(cumu_percentage = cumsum(total_count) / sum(total_count)) %>%
  filter(cumu_percentage <= 0.5) %>%
  plot_ly(labels = ~tech_specialisation, values = ~total_count, type = "pie") %>%
  layout(title = "Top 50% Tech Specialisation in Malaysia", showlegend = TRUE)
print(malaysia_it)

# NEW ZEALAND
newzealand_it <- itjobs %>%
  filter(country == "New Zealand") %>%
  group_by(tech_specialisation) %>%
  summarize(total_count = n()) %>%
  arrange(desc(total_count)) %>%
  mutate(cumu_percentage = cumsum(total_count) / sum(total_count)) %>%
  filter(cumu_percentage <= 0.5) %>%
  plot_ly(labels = ~tech_specialisation, values = ~total_count, type = "pie") %>%
  layout(title = "Top 50% Tech Specialisation in New Zealand", showlegend = TRUE)
print(newzealand_it)

# PHILIPPINES
philippines_it <- itjobs %>%
  filter(country == "Philippines") %>%
  group_by(tech_specialisation) %>%
  summarize(total_count = n()) %>%
  arrange(desc(total_count)) %>%
  mutate(cumu_percentage = cumsum(total_count) / sum(total_count)) %>%
  filter(cumu_percentage <= 0.5) %>%
  plot_ly(labels = ~tech_specialisation, values = ~total_count, type = "pie") %>%
  layout(title = "Top 50% Tech Specialisation in Philippines", showlegend = TRUE)
print(philippines_it)

# SINGAPORE
singapore_it <- itjobs %>%
  filter(country == "Singapore") %>%
  group_by(tech_specialisation) %>%
  summarize(total_count = n()) %>%
  arrange(desc(total_count)) %>%
  mutate(cumu_percentage = cumsum(total_count) / sum(total_count)) %>%
  filter(cumu_percentage <= 0.5) %>%
  plot_ly(labels = ~tech_specialisation, values = ~total_count, type = "pie") %>%
  layout(title = "Top 50% Tech Specialisation in Singapore", showlegend = TRUE)
print(singapore_it)

# THAILAND
thailand_it <- itjobs %>%
  filter(country == "Thailand") %>%
  group_by(tech_specialisation) %>%
  summarize(total_count = n()) %>%
  arrange(desc(total_count)) %>%
  mutate(cumu_percentage = cumsum(total_count) / sum(total_count)) %>%
  filter(cumu_percentage <= 0.5) %>%
  plot_ly(labels = ~tech_specialisation, values = ~total_count, type = "pie") %>%
  layout(title = "Top 50% Tech Specialisation in Thailand", showlegend = TRUE)
print(thailand_it)

# ------------------------------------------------------------------------------

# ---------------------------- STATISTICAL ANALYSIS ----------------------------

# ------------------------------------------------------------------------------

# REMOVE ROWS WITH NA VALUES
itjobs <- na.omit(itjobs)

# ------------------------------------------------------------------------------

# ----------------------------------- ANOVA ------------------------------------
# If PR(>F) is less than 0.05, results are statistically significant, meaning, there is a relationship.

# ------------------------------------------------------------------------------

# TESTS IF THERE IS A DIFFERENCE IN SALARY AMONG DIFFERENT JOB LEVELS
anova_salary_level <- aov(salary_to ~ level, data = itjobs)
summary(anova_salary_level)

# VISUALIZATION
salary_level_stats <- itjobs %>%
  group_by(level) %>%
  summarise(ave_salary = mean(salary_to, na.rm = TRUE), 
            stderr = sd(salary_to, na.rm = TRUE) / sqrt(n()))

plot_ly(salary_level_stats, x = ~level, y = ~ave_salary, type = "bar", 
        error_y = list(type = "data", array = ~stderr, visible = TRUE)) %>%
  layout(title = "ANOVA: Bar Plot with Error Bars for Salary by Job Level",
         xaxis = list(title = "Job Level"),
         yaxis = list(title = "Average Salary"))



# TESTS IF THERE IS A DIFFERENCE IN SALARY AMONG DIFFERENT EDUCATION LEVELS
anova_salary_educ <- aov(salary_to ~ education_level, data = itjobs)
summary(anova_salary_educ)

# VISUALIZATION
salary_educ_stats <- itjobs %>%
  group_by(education_level) %>%
  summarise(ave_salary = mean(salary_to, na.rm = TRUE), 
            stderr = sd(salary_to, na.rm = TRUE) / sqrt(n()))

plot_ly(salary_educ_stats, x = ~education_level, y = ~ave_salary, type = "bar", 
        error_y = list(type = "data", array = ~stderr, visible = TRUE)) %>%
  layout(title = "ANOVA: Bar Plot with Error Bars for Salary by Education Level",
         xaxis = list(title = "Education Level"),
         yaxis = list(title = "Average Salary"))



# TESTS IF THERE IS A DIFFERENCE IN SALARY AMONG DIFFERENT TECH SPECIALISATIONS
anova_salary_tech <- aov(salary_to ~ tech_specialisation, data = itjobs)
summary(anova_salary_tech)

# VISUALIZATION
salary_tech_stats <- itjobs %>%
  group_by(tech_specialisation) %>%
  summarise(ave_salary = mean(salary_to, na.rm = TRUE), 
            stderr = sd(salary_to, na.rm = TRUE) / sqrt(n()))

plot_ly(salary_tech_stats, x = ~tech_specialisation, y = ~ave_salary, type = "bar", 
        error_y = list(type = "data", array = ~stderr, visible = TRUE)) %>%
  layout(title = "ANOVA: Bar Plot with Error Bars for Salary by Tech Specialisation",
         xaxis = list(title = "Tech Specialisation"),
         yaxis = list(title = "Average Salary"))



# TESTS IF THERE IS A DIFFERENCE IN SALARY AMONG DIFFERENT COUNTRIES
anova_salary_country <- aov(salary_to ~ country, data = itjobs)
summary(anova_salary_country)

# VISUALIZATION
salary_country_stats <- itjobs %>%
  group_by(country) %>%
  summarise(ave_salary = mean(salary_to, na.rm = TRUE), 
            stderr = sd(salary_to, na.rm = TRUE) / sqrt(n()))

plot_ly(salary_country_stats, x = ~country, y = ~ave_salary, type = "bar", 
        error_y = list(type = "data", array = ~stderr, visible = TRUE)) %>%
  layout(title = "ANOVA: Bar Plot with Error Bars for Salary by Country",
         xaxis = list(title = "Country"),
         yaxis = list(title = "Average Salary"))

# ------------------------------------------------------------------------------

# ----------------------------- LINEAR REGRESSION ------------------------------
# If PR(>F) is less than 0.05, results are statistically significant, meaning, there is a relationship.

# ------------------------------------------------------------------------------

# TESTS HOW JOB LEVEL AFFECTS SALARY
linreg_salary_level <- lm(salary_to ~ level, data = itjobs)
summary(linreg_salary_level)

# VISUALIZATION
# NOTE: Zoom to see where the lines intersect.
salary_level_stats <- itjobs %>%
  group_by(level) %>%
  summarise(ave_salary = mean(salary_to, na.rm = TRUE),
            stderr = sd(salary_to, na.rm = TRUE) / sqrt(n()))

# Create a bar plot with error bars
plot_ly(data = salary_level_stats, 
        x = ~level, 
        y = ~ave_salary, 
        type = "bar", 
        error_y = list(type = "data", array = salary_exp_stats$stderr, visible = TRUE), 
        name = "Average Salary") %>%
  layout(title = "LINEAR REGRESSION: Bar Plot with Error Bars for Salary and Job Level",
         xaxis = list(title = "Job Level"),
         yaxis = list(title = "Average Salary"),
         showlegend = FALSE)



# TESTS HOW COUNTRY AFFECTS SALARY
linreg_salary_country <- lm(salary_to ~ country, data = itjobs)
summary(linreg_salary_country)

# VISUALIZATION
# NOTE: Zoom to see where the lines intersect.
salary_country_stats <- itjobs %>%
  group_by(country) %>%
  summarise(ave_salary = mean(salary_to, na.rm = TRUE),
            stderr = sd(salary_to, na.rm = TRUE) / sqrt(n()))

# Create a bar plot with error bars
plot_ly(data = salary_country_stats, 
        x = ~country, 
        y = ~ave_salary, 
        type = "bar", 
        error_y = list(type = "data", array = salary_exp_stats$stderr, visible = TRUE), 
        name = "Average Salary") %>%
  layout(title = "LINEAR REGRESSION: Bar Plot with Error Bars for Salary and Country",
         xaxis = list(title = "Country"),
         yaxis = list(title = "Average Salary"),
         showlegend = FALSE)



# TESTS HOW EDUCATION LEVEL AFFECTS SALARY
linreg_salary_educ <- lm(salary_to ~ education_level, data = itjobs)
summary(linreg_salary_educ)

# VISUALIZATION
# NOTE: Zoom to see where the lines intersect.
salary_educ_stats <- itjobs %>%
  group_by(education_level) %>%
  summarise(ave_salary = mean(salary_to, na.rm = TRUE),
            stderr = sd(salary_to, na.rm = TRUE) / sqrt(n()))

# Create a bar plot with error bars
plot_ly(data = salary_educ_stats, 
        x = ~education_level, 
        y = ~ave_salary, 
        type = "bar", 
        error_y = list(type = "data", array = salary_exp_stats$stderr, visible = TRUE), 
        name = "Average Salary") %>%
  layout(title = "LINEAR REGRESSION: Bar Plot with Error Bars for Salary and Education Level",
         xaxis = list(title = "Education Level"),
         yaxis = list(title = "Average Salary"),
         showlegend = FALSE)



# TESTS HOW WORK EXPERIENCE AFFECTS SALARY
linreg_salary_experience <- lm(salary_to ~ work_experience_years, data = itjobs)
summary(linreg_salary_experience)

# VISUALIZATION
# NOTE: Zoom to see where the lines intersect.
salary_exp_stats <- itjobs %>%
  group_by(work_experience_years) %>%
  summarise(ave_salary = mean(salary_to, na.rm = TRUE),
            stderr = sd(salary_to, na.rm = TRUE) / sqrt(n()))

# Create a bar plot with error bars
plot_ly(data = salary_exp_stats, 
        x = ~work_experience_years, 
        y = ~ave_salary, 
        type = "bar", 
        error_y = list(type = 'data', array = salary_exp_stats$stderr, visible = TRUE), 
        name = "Average Salary") %>%
  layout(title = "LINEAR REGRESSION: Bar Plot with Error Bars for Salary and Work Experience in Years",
         xaxis = list(title = "Work Experience in Years"),
         yaxis = list(title = "Average Salary"),
         showlegend = FALSE)


# ------------------------------------------------------------------------------

# ----------------------------------- U-TEST -----------------------------------
# If PR(>F) is less than 0.05, results are statistically significant, meaning, there is a relationship.

# ------------------------------------------------------------------------------

# TESTS IF THERE IS A DIFFERENCE IN THE SALARIES BETWEEN JUNIOR AND SENIOR LEVELS
filtered_level <- subset(itjobs, level %in% c("Junior", "Senior"))

junior_salary <- filtered_level$salary_to[filtered_level$level == "Junior"]
senior_salary <- filtered_level$salary_to[filtered_level$level == "Senior"]

utest_salary_level <- wilcox.test(junior_salary, senior_salary)
print(utest_salary_level)

# VISUALIZATION
salary_level_stats <- filtered_level %>%
  group_by(level) %>%
  summarise(mean_salary = mean(salary_to, na.rm = TRUE),
            stderr = sd(salary_to, na.rm = TRUE) / sqrt(n()))

# Create a bar plot with error bars
plot_ly(data = salary_level_stats, 
        x = ~mean_salary, 
        y = ~level, 
        type = "bar", 
        orientation = "h", 
        color = ~level,  # Color by level (Junior, Senior)
        colors = c("lightblue", "pink"),
        error_x = list(type = "data", array = salary_level_stats$stderr, visible = TRUE)) %>%
  layout(title = "U-TEST: Horizontal Bar Graph with Error Bars for Comparing Salaries between Junior and Senior Levels",
         xaxis = list(title = "Mean Salary"),
         yaxis = list(title = "Level"),
         showlegend = FALSE)



# TESTS IF THERE IS A DIFFERENCE IN THE SALARIES BETWEEN BACHELOR DEGREE AND MASTER'S DEGREE HOLDERS
filtered_educ <- subset(itjobs, education_level %in% c("Bachelor Degree", "Master's Degree"))

bachelor_salary <- filtered_educ$salary_to[filtered_educ$education_level == "Bachelor Degree"]
master_salary <- filtered_educ$salary_to[filtered_educ$education_level == "Master's Degree"]

utest_salary_educ <- wilcox.test(bachelor_salary, master_salary)
print(utest_salary_educ)

# VISUALIZATION
salary_educ_stats <- filtered_educ %>%
  group_by(education_level) %>%
  summarise(ave_salary = mean(salary_to, na.rm = TRUE),
            stderr = sd(salary_to, na.rm = TRUE) / sqrt(n()))

# Create bar plot with error bars
plot_ly(data = salary_educ_stats, 
        x = ~ave_salary, 
        y = ~education_level, 
        type = "bar", 
        orientation = "h", 
        color = ~education_level,  # Color by education level
        colors = c("lightblue", "pink"), 
        error_x = list(type = 'data', array = salary_educ_stats$stderr, visible = TRUE)) %>%
  layout(title = "U-TEST: Horizontal Bar Graph with Error Bars for Comparing Salaries between Bachelor and Master's Degree Holders",
         xaxis = list(title = "Average Salary"),
         yaxis = list(title = "Education Level"),
         showlegend = FALSE)

