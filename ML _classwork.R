#############################################
# Machine Learning with R                   #
# Date 23rd October 2022                    #
# Data Science Mar'22 class                 #
#############################################

# Import Libraries
# install.packages ("mlbench")
library (mlbench)
# install.packages ("caret")

library (caret)

# Load the Boston Housing Dataset from mlbench library

 data (BostonHousing)

# visualize the data
 plot (BostonHousing$crim)
 hist (BostonHousing$age)

# split the dataset using strtify random sampling
myData <- createDataPartition(BostonHousing$medv, p=0.8, list =FALSE)

# Visualzing the 80% data for training
hist (myData)
plot (myData)

# Training the Machine algorithm
Training_Dataset <- BostonHousing[myData,]
Testing_Dataset <- BostonHousing[-myData,]

# Building the Linear regression model
Model <-  train(
  medv ~.,
  data = Training_Dataset,
  na.action = na.omit,     # incase there is a missing data, omit
  preProcess = c("scale", "center"),
  method = "lm",
  trControl = trainControl(method = "none")
)

# To predict using our model
Model.Training <- predict(Model, Training_Dataset)
Model.Testing <- predict(Model, Testing_Dataset)

# Model summary
summary(Model)
