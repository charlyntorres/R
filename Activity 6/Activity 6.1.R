# INITIALIZES THE STUDENTS DATA FRAME
students <- data.frame(Name = c("John", "Alice", "Bob", "David", "Emma"),
                       Math = as.numeric(c(85, 90, 78, 92, 88)),
                       Science = as.numeric(c(82, 88, 76, 95, 85)),
                       English = as.numeric(c(89, 91, 80, 88, 94)))

# CALCULATES THE AVERAGE SCORE OF EACH STUDENTS
students_average_apply <- apply(students[,2:4], 1, mean)

# ADDS A NEW COLUMN
students$Average <- students_average_apply

# DISPLAYS THE MODIFIED DATA FRAME
print(students)






