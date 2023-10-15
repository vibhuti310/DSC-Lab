# Install packages
install.packages("arules")
library(arules)

# Load dataset
data("Groceries")

# Display dataset
str(Groceries)

# Perform analysis
association_rules <- apriori(Groceries, parameter=list(support = 0.001, confidence = 0.5))


# Results
inspect(association_rules)

install.packages("arulesViz")
library(arulesViz)
# Visualize the association rules
plot(association_rules, method = "graph", control = list(type = "items"))
