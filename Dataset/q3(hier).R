set.seed(123)

data <- data.frame(
  x = rnorm(10),
  y = rnorm(10)
)

distance_matrix <- dist(data)
hc <- hclust(distance_matrix, method="complete")


plot(hc, cex = 0.6, hang = -1)
