# INITIALIZING NAMES VECTOR
names <- c("alice", "BOB", "Charlie", "DIANA")

# CONVERTING ALL NAMES TO TITLE CASE
modified_names <- toTitleCase(tolower(names))
cat("Title Case: \n", modified_names)
cat("\n\n")

# ADDING A PREFIX TO EACH ELEMENT
with_prefix <- paste0("ID_", modified_names)
cat("Modified names with prefix: \n", with_prefix)
