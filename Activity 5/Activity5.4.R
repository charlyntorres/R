# INITIALIZING VECTOR AND VARIABLES
scores <- c(70, 85, 90, 65, 95, 88)
total_sum = 0
total_length = 0

# LOOPING TO CALCULATE VECTOR SUM
for (score in scores) {
  # CHECKING IF ELEMENT IS GREATER THAN 80
  if (score > 80) {
    total_sum <- total_sum + score
    total_length <- total_length + 1
    # SKIPPING THE ELEMENT IF IT IS LESS THAN 80
  } else {
    next
  }
}

# CALCULATING THE AVERAGE SCORE
average_score <- (total_sum / total_length)

# DISPLAYING THE RESULT
cat("Total Sum: ", total_sum, "\n")
cat("Average Score: ", average_score)

