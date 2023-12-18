data <- data.frame(
  X = c(1, 1, 7, 4, 6, 5, 1, 4, 3),
  Y = c(9, 6, 3, 8, 6, 5, 2, 9, 9)
)

dist_matrix <- dist(data, method = "euclidean")
dist_matrix

model <- hclust(dist_matrix, method = "average")
model

plot(model)

rect.hclust(model, k = 3)
cutree_model <- cutree(model, k = 3)
print(cutree_model)
plot(cutree_model)
