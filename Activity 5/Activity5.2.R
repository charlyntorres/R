# FUNCTION TO COMPUTE THE CENTRAL TENDENCY
compute <- function(num_vector) {
  # RETURNS A LIST OF VALUES CONTAINING THE CALCULATED VALUES
  return(list(
    Mean = mean(num_vector), 
    Median = median(num_vector), 
    Standard_Deviation = sd(num_vector)
  ))
}

# TESTING THE FUNCTION WITH A RANDOM VECTOR OF 20 VALUES
set.seed(89191)
num_vector <- rnorm(20)

# CALLING THE COMPUTE() FUNCTION AND ASSIGNING VALUE
central_tendency <- compute(num_vector)

# PRINTING THE RESULT
print(central_tendency)



