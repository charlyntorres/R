# INITIALIZES THE STUDENTS DATA FRAME
students <- data.frame(Name = c("John", "Alice", "Bob", "David", "Emma"),
                       Math = as.numeric(c(85, 90, 78, 92, 88)),
                       Science = as.numeric(c(82, 88, 76, 95, 85)),
                       English = as.numeric(c(89, 91, 80, 88, 94)))

# EXTRACTS THE SCORES GREATER THAN OR EQUAL TO 85
students_greaterthan85_lapply <- lapply(students[,2:4], function(x) x[x >= 85])

# DISPLAYS THE RESULT AS A LIST
print(students_greaterthan85_lapply)





