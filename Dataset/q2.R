install.packages("arules")
library(arules)

transactions <- list(
  c("milk", "butter", "bread"),
  c("milk", "bread"),
  c("milk", "diapers"),
  c("bread", "butter"),
  c("milk", "bread"),
  c("bread", "diapers"),
  c("bread", "sugar"),
  c("milk", "butter", "bread", "sugar")
)

transactions <- as(transactions, "transactions")

association_rules <- apriori(transactions, parameter = list(support = 0.2, confidence = 0.6, target = "rules"))


inspect(association_rules)
