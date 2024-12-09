# TAKING USER INPUT
column_name <- readline(prompt = "Enter column: ")

# CHECKING IF COLUMN EXISTS
if (column_name %in% colnames(employees)) {
  
  # IDENTIFYING ALL UNIQUE VALUES
  unique_values <- unique(employees[[column_name]])
  
  # RETURNING ALL UNIQUE VALUES
  cat("Unique Values of ", column_name, " = ", unique_values, "\n")
} else {
  cat("Invalid column name.")
}


