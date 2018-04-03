#install library
install.packages("arules")
library("arules")
#read transactions from csv file 

# for format single,  the file format is id, item. additional parameter cols=c(1,2) needed for this type. eg:
# 1,Pencil
# 1,Eraser
# 1,Pen
# 2,Pencil
# 2,Pen
#
# for format basket, each row contains all the items in a transactions. There is no transaction id. eg:
# Pencil, Eraser, Pen
# Eraser, Pen
#
data = read.transactions(file.choose(),format="basket" ,sep=',')
# use inspect to see the tranactions
inspect(data)

# Run the apriori algorithm
basket_rules <- apriori(data,parameter = list(sup = 0.3, conf = 0.6, target="rules"))
inspect(basket_rules)

# plot item frequency
itemFrequencyPlot(data)


# sort the rules based on lift, confidence or support
rules.sorted <- sort(basket_rules, by= "confidence")
inspect(rules.sorted)
