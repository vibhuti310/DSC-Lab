library(randomForest)
library(caTools)

data <- read.csv("play_tennis.csv")
str(data)
summary(data)

data$day <- as.factor(data$day)
data$outlook <- as.factor(data$outlook)
data$temp <- as.factor(data$temp)
data$humidity <- as.factor(data$humidity)
data$wind <- as.factor(data$wind)
data$play <- as.factor(data$play)

split <- sample.split(data, SplitRatio = 0.7)
train <- subset(data, split == TRUE)
test <- subset(data, split == FALSE)

model <- randomForest(
  x = train,
  y = train$play,
  ntree = 100
)

predicted_values <- predict(model, newdata = test)
predicted_values

confmat <- table(actual = test$play, predicted = predicted_values)
print(confmat)
