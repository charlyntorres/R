# ADDING NEW COLUMN AND CATEGORIZING AGE GROUPS
joined_df <- mutate(joined_df, AgeGroup = case_when(
    Age <= 25 ~ "Young",
    Age > 25 & Age <= 40 ~ "Middle-aged",
    Age > 40 ~ "Senior"
  ))

# DISPLAYING UPDATED DATA FRAME
View(joined_df)
