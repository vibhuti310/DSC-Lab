library(arules)
library(arulesViz)

data <- read.csv('Market_Opt.csv')
str(data)
summary(data)

transactions <- as(data, "transactions")
itemFrequencyPlot(transactions, topN = 10)

model <- apriori(data, parameter = list(support = 0.001, confidence = 0.5))
inspect(model)

plot(model, method = "graph", measure = "confidence")
