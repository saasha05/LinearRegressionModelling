library(datasets)
library(ggplot2)
library(GGally)

data("trees")

GGally::ggpairs(data=trees) ## To visualize relations between variables

## Models relation between volume and girth
linear_model <- lm(Volume ~ Girth, data = trees)

## Creates a histogram of the residual values
model_residuals <- ggplot(data=trees, aes(linear_model$residuals)) + 
  geom_histogram(binwidth = 1) +
  labs( title = "Histogram for Model Residuals", x = "Residuals") 

## Creates the line of best fit for the linear model
linear_model <- ggplot(data = trees, aes(x = Girth, y = Volume)) + geom_point() +
  stat_smooth(method = "lm") +
  ggtitle("Linear Model Fitted to Data")

## Makes prediction given values in a dataframe(girth in this case), using the linear model
predict(linear_model, data.frame(Girth = 18.2), se.fit = TRUE)

## Linear model that takes into account all three variables- girth, height and volume to make predictions
linear_model2 <- lm(Volume ~ Girth * Height, data = trees)

## Predicts alue of volume given the girth and height using the second linear model
predict(linear_model2, data.frame(Girth = 18.2, Height = 72))
