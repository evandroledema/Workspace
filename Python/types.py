mon_sales = "121"
tues_sales = "105"
wed_sales = "110"
thurs_sales = "98"
fri_sales = "95"


mon_sales = int(mon_sales,10)
tues_sales = int(tues_sales,10)
wed_sales = int(wed_sales,10)
thurs_sales = int(thurs_sales,10)
fri_sales = int(fri_sales,10)

average = ((mon_sales + tues_sales + wed_sales + thurs_sales + fri_sales)/5)

#TODO: Print a string with this format: This week's total sales: xxx
# You will probably need to write some lines of code before the print statement.
print("This week's total sales: ", end="")
print(average)