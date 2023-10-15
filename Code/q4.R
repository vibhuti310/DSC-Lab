# Linear Regression
data("mtcars")

# Fit LM model
lm_model <- lm(mpg ~ wt, data=mtcars)

# Print the summary
summary(lm_model)

# Calculate R-squared and MSE
rsquared <- summary(lm_model)$r.squared
cat("R-squared value for linear regression model:", rsquared, "\n")

mse <- mean(lm_model$residuals^2)
cat("MSE for linear regression : ", mse, "\n")


# Logistic Regression
# Define binary variable based on median of mpg
mtcars$mpg_high <- ifelse(mtcars$mpg > median(mtcars$mpg), 1, 0)


# Fit logistic regression model
logistic_model <- glm(mpg_high ~ wt + hp, data = mtcars, family = binomial)

# Print the summary of the logistic regression model
summary(logistic_model)


# Predicted values from the logistic regression model
mtcars$predicted_values_logit <- ifelse(predict(logistic_model, type = "response") > 0.5, 1, 0)

# Accuracy
accuracy <- mean(mtcars$predicted_values_logit == mtcars$mpg_high)
cat("Accuracy of logistic regression model:", accuracy, "\n")

# Create a confusion matrix for the logistic regression model
conf_matrix <- table(Actual = mtcars$mpg_high, Predicted = mtcars$predicted_values_logit)
print("Confusion Matrix for logistic regression:")
print(conf_matrix)
