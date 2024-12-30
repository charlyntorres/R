# CREATING DATA FRAME DF1
df1 <- data.frame(ID = c(1, 2, 3, 4, 5),
                  Name = c("Ana", "Bea", "Clara", "Diane", "Ella"),
                  Age = c(20, 38, 18, 29, 42))

# CREATING DATA FRAME DF2
df2 <- data.frame(ID = c(1, 2, 3, 4, 5),
                  Score = c(93, 89, 90, 87, 95),
                  Subject = c("Math", "Science", "English", "Filipino", "Music"))

# CHECKING OF CLASS ATTRIBUTES MATCH
if (class(df1$ID) == class(df2$ID)) {
  
  # JOINING DF1 AND DF2 USING INNER JOIN
  joined_df <- inner_join(df1, df2, by="ID")
  
  # VIEWING RESULTS
  View(df1)
  View(df2)
  View(joined_df)
} else {
  cat("Class attributes do not match.")
}

