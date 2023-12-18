data <- data.frame(
  X = c(2, 2, 8, 5, 7, 6, 1, 4, 3),
  Y = c(10, 5, 4, 8, 5, 4, 2, 9, 9)
)

k <- 3
model <- kmeans(x = data, centers = k)
summary(model)

library(ggplot2)
library(cluster)

data$clusters <- as.factor(model$cluster)

clusplot(data, model$cluster)

ggplot(data, aes(x = X, y = Y, color = clusters)) +
  geom_point(size = 4) +
  labs(title = "K Means Clustering")

clusplot(data, model$cluster) # pca values - standardised values converted by the func

