# Linear Regression
set.seed(123)

x <- 1:60
y <- 2 * x + rnorm(50, mean = 0, sd = 5)
linear_data <- data.frame(x = x, y = y)

head(linear_data)
summary(linear_data)

lmodel <- lm(y ~ x, data = linear_data)
summary(lmodel)

plot(linear_data$x, linear_data$y, main = "Linear Regression example", xlab = "X", ylab = "Y")
abline(lmodel, color="blue")


# Logistic regression
