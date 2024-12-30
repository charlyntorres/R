# INITIALIZES THE STUDENTS DATA FRAME
students <- data.frame(Name = c("John", "Alice", "Bob", "David", "Emma"),
                       Math = c(85, 90, 78, 92, 88),
                       Science = c(82, 88, 76, 95, 85),
                       English = c(89, 91, 80, 88, 94))

# COUNTS THE SCORES GREATER THAN OR EQUAL TO 90 IN EACH SUBJECT
students_scorecount_lapply <- lapply(students[,2:4], function(x) sum(x >= 90))

# DISPLAYS THE RESULT
cat("Count of scores greater than or equal to 90 in each subject:\n")
print(students_scorecount_lapply)
cat("")

# COUNTS THE STUDENTS WITH SCORES GREATER THAN OR EQUAL TO 90 IN ALL SUBJECTS
cat("Count of students with scores greater than or equal to 90 across all subjects:\n")
students_studentcount_apply <- sum(apply(students[2:4], 1, function(x) any(x >= 90)))
print(students_studentcount_apply)



