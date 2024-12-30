# CALCULATING THE AVERAGE SCORE FOR EACH AGE GROUP
average_scores <- summarise(
  group_by(joined_df, AgeGroup),
  Average_Score = mean(Score, na.rm = TRUE)
)

# DISPLAYING THE AVERAGE SCORES
View(average_scores)
