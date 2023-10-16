data <- data.frame(
  Outlook = c("Sunny", "Sunny", "Overcast", "Rainy", "Sunny", "Overcast", "Rainy", "Sunny", "Overcast", "Sunny"),
  Temperature = c("Hot", "Hot", "Mild", "Cool", "Hot", "Mild", "Cool", "Hot", "Cool", "Hot"),
  Humidity = c("High", "High", "Low", "Low", "High", "Low", "Low", "High", "Low", "High"),
  Wind = c("Weak", "Weak", "Strong", "Strong", "Weak", "Strong", "Weak", "Weak", "Strong", "Weak"),
  Play = c("Yes", "Yes", "Yes", "No", "Yes", "No", "No", "Yes", "No", "Yes")
)


dim(data)
str(data)

data$Outlook = as.factor(data$Outlook)
data$Temperature = as.factor(data$Temperature)
data$Humidity = as.factor(data$Humidity)
data$Wind = as.factor(data$Wind)
data$Play = as.factor(data$Play)

install.packages("randomForest")
install.packages("caTools")

library(randomForest)
library(caTools)

split <- sample.split(data, SplitRatio = 0.7)

train <- subset(data, split == TRUE)
test <- subset(data, split == FALSE)


rf_model <- randomForest(
  x = train,
  y = train$Play,
  ntree = 100
)

y_preds <- predict(rf_model, newdata = test)

conmat <- table(test$Play, y_preds)
conmat

plot(rf_model)
importance(rf_model)
varImpPlot(rf_model)
