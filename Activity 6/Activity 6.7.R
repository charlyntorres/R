# INITIALIZES THE STUDENTS DATA FRAME
students <- data.frame(Name = c("John", "Alice", "Bob", "David", "Emma"),
                       Math = c(85, 90, 78, 92, 88),
                       Science = c(82, 88, 76, 95, 85),
                       English = c(89, 91, 80, 88, 94))

# CALCULATE AVERAGES USING APPLY
students$Average <- apply(students[,2:4], 1, mean)

# ASSIGN REMARKS USING APPLY
students$ Remarks <- apply(students[,2:4], 1, function(x) {
  if (mean(x) >= 85) "Pass" else "Fail"
})

# DISPLAY RESULTS
print(students)




