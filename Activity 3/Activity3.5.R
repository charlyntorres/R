# MODIFYING AN ELEMENT
employees$Salary[1] <- NA
View(employees)

# CALCULATE TOTAL SALARY EXCLUDING NA VALUES
total_salary <- sum(employees$Salary, na.rm = TRUE)
cat("Total Salary: ", total_salary)


