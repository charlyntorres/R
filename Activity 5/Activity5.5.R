# FUNCTION TO COMPUTE THE NTH FIBONACCI NUMBER
recursive_fibonacci <- function(nth) {
  # CHECKING THE VALUE OF NTH
  if (nth <= 0) {
    return(0)
  } else if (nth == 1) {
    return(1)
  } else {
    # RECURSIVE FUNCTION
    return(recursive_fibonacci(nth - 1) + recursive_fibonacci(nth - 2))
  }
}

# DISPLAYING THE FUNCTION WITH NTH AS 5
cat("Fibonacci(5):", recursive_fibonacci(5), "\n")

# DISPLAYING THE FUNCTION WITH NTH AS 10
cat("Fibonacci(10):", recursive_fibonacci(10), "\n")


