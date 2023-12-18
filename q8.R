library(ggplot2)
data <- data.frame(
  X = c(1, 1, 7, 4, 6, 5, 1, 4, 3),
  Y = c(9, 6, 3, 8, 6, 5, 2, 9, 9)
)


model <- kmeans(data, centers = 3)
summary(model)

ggplot(data, aes(x = X, y = Y, color = model$cluster)) +
  geom_point(size = 3) +
  labs(title = "K Means Clustering")

library(cluster)
clusplot(data, model$cluster)
