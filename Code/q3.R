# Installing packages
install.packages("ggplot2")
install.packages("cluster")

library(ggplot2)
library(cluster)

# Load the iris dataset
data("iris")
iris_dataset <- iris[,1:4]

# Implementing k means clustering
k <- 3
kmeans_result <- kmeans(iris_dataset, centers = k)


# Visualise 
iris_data_with_cluster <- iris_dataset
iris_data_with_cluster$cluster <- as.factor(kmeans_result$cluster)

# Plot sepal length vs sepal width 
ggplot(iris_data_with_cluster, aes(Sepal.Length, Sepal.Width, color=cluster)) + 
  geom_point(size=3) +
  labs(title = "K-Means Clustering Result on Iris Dataset",
       x = "Sepal Length",
       y = "Sepal Width",
       color = "Cluster")
