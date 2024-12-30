# PROMPTING USER TO INPUT DESIRED NUMBER OF DATA FRAMES
number_of_dfs <- as.integer(readline(prompt = "Enter number of data frames: "))

# INITIALIZING LISTS TO STORE DATA FRAME NAMES, COLUMN NUMBERS, AND COLUMN NAMES
df_names <- character(number_of_dfs)
cols <- integer(number_of_dfs)                  
colnames_list <- vector("list", number_of_dfs)

# LOOPING TO COLLECT COLUMN DETAILS FOR EACH DATA FRAME
for (i in 1:number_of_dfs) {
  # PROMPTING USER TO INPUT DESIRED DATA FRAME NAME
  df_names[i] <- toupper(readline(prompt = paste0("Enter name for data frame ", i, ": ")))
  
  # PROMPTING USER TO INPUT DESIRED NUMBER OF COLUMNS
  cols[i] <- as.integer(readline(prompt = paste0("Enter number of columns for data frame ", df_names[i], ": ")))
  
  # PROMPTING USER TO INPUT DESIRED COLUMN NAMES
  cat("Enter column names for data frame ", df_names[i], " (separate by space): ")
  colnames_list[[i]] <- scan(what = "", quiet = TRUE)
}

# CHECKING WHETHER COLUMN NUMBERS MATCH
if (length(unique(cols)) != 1) {
  # STOPS THE PROGRAM IF COLUMN NUMBERS DO NOT MATCH
  stop("ERROR: Data frames must have the same number of columns.")
}

# CHECKING WHETHER COLUMN NAMES MATCH
check_col_names <- length(unique(lapply(colnames_list, function(x) paste(sort(x), collapse = ",")))) == 1
if (!check_col_names) {
  # STOPS THE PROGRAM IF COLUMN NUMBERS DO NOT MATCH
  stop("ERROR: Data frames must have identical column names.")
}

# CREATES AN EMPTY LIST WITH USER-SPECIFIED LENGTH
df_list <- vector("list", number_of_dfs)

# LOOPING TO SPECIFY COLUMN NAMES
for (i in 1:number_of_dfs) {
  # PROMPTING USER TO INPUT DESIRED NUMBER OF ROWS
  row_num <- as.integer(readline(prompt = paste0("Enter number of rows for ", df_names[i], ": "))) 
  
  # CREATES DATA FRAME USING USER-SPECIFIED ROWS AND COLUMNS
  df_list[[i]] <- data.frame(matrix(ncol = cols[i], nrow = row_num))
  colnames(df_list[[i]]) <- colnames_list[[i]]
  
  # NESTED LOOPING TO POPULATE EACH COLUMN WITH USER-SPECIFIED VALUES
  for (j in 1:row_num) {
    for (k in 1:cols[i]) {
      # PROMPTING USER TO INPUT DESIRED VALUES
      df_list[[i]][j, k] <- readline(prompt = paste0("Enter value for ", colnames_list[[i]][k], " in row ", j, ": "))
    }
    cat("\n")
  }
  cat("\n")
}

# LOOPING TO DISPLAY ALL DATA FRAMES
for (i in 1:number_of_dfs) {
  cat(paste0("Data Frame ", df_names[i], ":\n"))
  print(df_list[[i]])
  cat("\n")
}

# COMBINING ALL DATA FRAMES INTO ONE DATA FRAME
combined_dfs <- do.call(rbind, df_list)
View(combined_dfs)



