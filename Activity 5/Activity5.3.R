# PROMPTING USER TO ENTER NUMBERS SEPARATED BY SPACE
cat("Enter numbers (separate by space): ")
user_vector <- scan(what = numeric(), quiet = TRUE)

# CHECKING IF VECTOR IS EMPTY
if (!is.null(user_vector)) {
  # LOOPING TO CHECK USER_VECTOR VALUES AGAINST SET CONDITIONS
  for (num in user_vector) {
    if (num > 0) {
      cat(num, " = Positive.", "\n")
    } else if (num < 0) {
      cat(num, " = Negative.", "\n")
    } else if (num == 0) {
      cat(num, " = Zero.", "\n")
    }
  }
  # DISPLAYING OUTPUT
} else {
  cat("The vector is empty.")
}


