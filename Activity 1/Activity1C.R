
num1 = FALSE
num2 = TRUE

logical_not1 <- !num1
paste("Logical Not 1: ", "!", num1, " = ", logical_not1)

logical_not2 <- !num2
paste("Logical Not 2: ", "!", num2, " = ", logical_not2)

elementwise_logical_and <- num1 & num2
paste("Element-wise logical AND: ", num1, " & ", num2, " = ", elementwise_logical_and)

logical_AND <- num1 && num2
paste("Logical AND: ", num1, " && ", num2, " = ", logical_AND)

elementwise_logical_OR <- num1 | num2
paste("Element-wise logical OR: ", num1, " | ", num2, " = ", elementwise_logical_OR)

logical_OR <- num1 || num2
paste("Logical OR: ", num1, " || ", num2, " = ", logical_OR)


