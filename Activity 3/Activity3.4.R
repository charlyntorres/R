# CHECKS IF SALARY IS WITHIN RANGE
if (any(employees$Salary > 70000)) {
  cat("High Salary Detected")
} else {
  cat("All salaries are within range.")
}


