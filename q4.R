data <- data.frame(
  X = c(2, 2, 8, 5, 7, 6, 1, 4, 3),
  Y = c(10, 5, 4, 8, 5, 4, 2, 9, 9)
)

dist_matrix <- dist(data, method = 'euclidean')
dist_matrix

hclust_model <- hclust(dist_matrix, method = 'average')
hclust_model


summary(hclust_model)
plot(hclust_model)
rect.hclust(hclust_model, k = 3)

cutree_model <- cutree(hclust_model, k = 3)
print(cutree_model)

plot(cutree_model)
