set.seed(123)
x <- c(rnorm(20, mean = 0), rnorm(20, mean = 5))
y <- c(rnorm(20, mean = 0), rnorm(20, mean = 5))

data <- data.frame(x, y)
head(data)

k <- 3
set.seed(123)
kmeans_result <- kmeans(data, centers = k, nstart = 25)

kmeans_result$cluster

library("ggplot2")
ggplot(data, aes(x, y, color=as.factor(kmeans_result$cluster))) + geom_point(size=3) + 
  geom_point(data=as.data.frame(kmeans_result$centers), aes(x, y), color="black", size=5, shape=17)+
  labs(title="KMeans", x="X", y="Y")
