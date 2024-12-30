# INITIALIZES THE STUDENTS DATA FRAME
students <- data.frame(Name = c("John", "Alice", "Bob", "David", "Emma"),
                       Math = as.numeric(c(85, 90, 78, 92, 88)),
                       Science = as.numeric(c(82, 88, 76, 95, 85)),
                       English = as.numeric(c(89, 91, 80, 88, 94)))

# CALCULATES THE HIGHEST SCORE IN EACH SUBJECT
students_highestscore_apply <- apply(students[,2:4], 2, max, simplify = TRUE)

# DISPLAYS THE RESULT
print(students_highestscore_apply)





