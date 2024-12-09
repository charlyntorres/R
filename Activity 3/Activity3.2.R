# CREATING DATA FRAME EMPLOYEE
employees <- data.frame(EmployeeID = c(101:105),
                        Name = c("Alice", "Bob", "Charlie", "Diana", "Eve"),
                        Department = c("HR", "IT", "Finance", "Marketing", "IT"),
                        Salary = c(50000, 60000, 70000, 55000, 65000))

# CALCULATING TAX AS 10% OF SALARY
taxes <- employees$Salary * 0.1

# ADDING A NEW COLUMN
employees$Tax <- c(taxes)

# FILTERING OUT EMPLOYEES IN THE IT DEPARTMENT
filter_employees <- employees[employees$Department != "IT", ]

# PRINTS AND VIEWS DATA FRAME EMPLOYEES
cat("Non-IT Employees:\n")
print(filter_employees)
View(employees)
View(filter_employees)


