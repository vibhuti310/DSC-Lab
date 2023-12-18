data("mtcars")
mtcars

model <- lm(mpg ~ wt, data = mtcars)

r_squared <- summary(model)$r.squared
cat("R squared: ", r_squared)

mse <- mean(model$residuals^2)
cat("MSE: ", mse)

plot(model)


mtcars$mpg_high <- ifelse(mtcars$mpg > median(mtcars$mpg), 1, 0)
glmodel <- glm(mpg_high ~ wt + hp, data = mtcars, family = binomial)
summary(model)

predicted_values <- ifelse(predict(glmodel, newdata = mtcars) > 0.5, 1, 0)
predicted_values

accuracy <- mean(predicted_values == mtcars$mpg_high)
print(accuracy)

confmat <- table(actual = mtcars$mpg_high, predicted = predicted_values)
print(confmat)
