# INITIALIZES THE STUDENTS DATA FRAME
students <- data.frame(Name = c("John", "Alice", "Bob", "David", "Emma"),
                       Math = as.numeric(c(85, 90, 78, 92, 88)),
                       Science = as.numeric(c(82, 88, 76, 95, 85)),
                       English = as.numeric(c(89, 91, 80, 88, 94)))

# CALCULATES THE STANDARD DEVIATION OF EACH SUBJECT
students_Sd_sapply <- sapply(students[,2:4], sd, simplify = TRUE, USE.NAMES = TRUE)

# DISPLAYS THE RESULT AS A VECTOR
print(students_Sd_sapply)



