data('mtcars')
str(mtcars)

model <- lm(mpg ~ wt, data = mtcars)
plot(model)

r_squared <- summary(model)$r.squared
cat("R squared: ", r_squared)

mse <- mean(model$residuals^2)
cat("MSE: ", mse)


library(dplyr)

mtcars$mpg_high <- ifelse(mtcars$mpg > median(mtcars$mpg), 1, 0)

model_glm <- glm(mpg_high ~ mpg + wt, data = mtcars, family = binomial)
summary(model_glm)

mtcars$predicted_values = ifelse(predict(model_glm, type='response') > 0.5, 1, 0)

Accuracy <- mean(mtcars$mpg_high == mtcars$predicted_values)
cat("Accuracy: ", Accuracy)

confmat <- table(actual = mtcars$mpg_high, predicted = mtcars$predicted_values)
print(confmat)
