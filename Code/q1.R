data <- read.csv("play_tennis.csv")

# Dimensions of data
dim(data)

str(data)

#Checking missing data values again
sapply(data, function(x) sum(is.na(x)))

# Factorising attributes
data$day = as.factor(data$day)
data$outlook = as.factor(data$outlook)
data$temp = as.factor(data$temp)
data$humidity = as.factor(data$humidity)
data$wind = as.factor(data$wind)
data$play = as.factor(data$play)

str(data)

install.packages("randomForest")

library("randomForest")

# Splitting into test and training dataset
set.seed(123)
split_ratio <- 0.7
index <- sample(1:nrow(data), nrow(data)*split_ratio)
train_data <- data[index, ]
test_data <- data[-index, ]

# Model definition
model <- randomForest(
  x = train_data,
  y = train_data$play,
  ntree = 100
)

# Predictions
y_pred = predict(model, newdata = test_data)

vec <- as.vector(test_data$play)

confusion_mat = table(vec, y_pred)
confusion_mat

plot(model)

dim(data)
