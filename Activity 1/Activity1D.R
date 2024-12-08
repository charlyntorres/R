
num1 = 76
num2 = 56
num3 = 74
num4 = 43
num5 = FALSE
num6 = TRUE
num7 = TRUE

item_one <- (num1 > num2) || (!num6) || (!num5) || (num2 != num3) 
paste("Item 1: ", item_one)

item_two <- (num1 > num4) || (!num7) || (!num4) || (num2 <= num3) 
paste("Item 2: ", item_two)

item_three <- (num5 > num4) || (!num1) || (!num6) || (num1 >= num5) 
paste("Item 3: ", item_three)


