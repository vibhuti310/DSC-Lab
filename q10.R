library(arules)
library(arulesViz)

data("Groceries")
str(Groceries)
summary(Groceries)

model <- apriori(Groceries, parameter = list(support = 0.001, confidence = 0.5))
summary(model)

inspect(model)

plot(model, method = "graph", control = list(type = "items"))
