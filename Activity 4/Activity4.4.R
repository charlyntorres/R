# SORTING BY SUBJECT IN ASCENDING ORDER
sorted_by_subject <- joined_df[order(joined_df$Subject, decreasing = FALSE), ]
View(sorted_by_subject)

# SORTING BY SCORE IN DESCENDING ORDER
sorted_by_score <- joined_df[order(joined_df$Score, decreasing = TRUE), ]
View(sorted_by_score)



