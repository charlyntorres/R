# CREATING NUMERIC VECTOR X
x <- as.numeric(c(1:50))
cat("Vector X = ", x, "\n")
cat("\n")

# EXTRACTING ALL EVEN NUMBERS
even_numbers <- x[x%%2==0]
cat("Even Numbers = ", even_numbers, "\n")
cat("\n")

# COMPUTING SUM OF ALL EVEN NUMBERS
sum_of_even_numbers = sum(even_numbers)
cat("Sum of Even Numbers: ", sum_of_even_numbers, "\n")
