---
title : "Intro to Neural networks"
author : "Njoroge"
date : "08-03-2023"
---
#Today we try to predict the strength of concrete used in construction using machine learning
#We will use the neuralnet algorithm
#where to get the data
("https://www.kaggle.com/datasets/prathamtripathi/regression-with-neural-networking")
  
  
#The library we are going to use
#The neuralnet algorithm
library(neuralnet)
#lets have a look at our data
str(concrete_data)
#Neural networks 
#work best when the input data are scaled to a narrow range around zero, and here 
#we see values ranging anywhere from zero up to over a thousand
normalize <- function(x){
  (((x)-min(x))/(max(x) - min(x)))
}
#After creating the normalizing function we test it
summary(normalize((c(1, 2, 3, 4))))
#After confirming it works we apply it in to our dataset using the lapply function
concrete_norm <- as.data.frame(lapply(concrete_data, normalize))
#we check to see if the data has been normalized
summary(concrete_data$Strength)
summary(concrete_norm$Strength)
#we separete our data in to two , to train and to test our model
concrete_train <- concrete_norm[1:830, ]
concrete_test <- concrete_norm[831:1030, ]
#we create our model using neuralnet algorithm
concrete_model <- neuralnet(Strength~., data = concrete_train)
#we plot the model to have a look at how the algorithm works
plot(concrete_model)
#we save the results of the model
concrete_result <-compute(concrete_model, concrete_test[1:8])
#now we save the prediction of our model
predicted_strength <- concrete_result$net.result
#we look at the correlation between the prediction made by our model and the real values
cor(predicted_strength, concrete_test$Strength)
#improving our model by increasing the number of nodes in our neural network
concrete_model2 <- neuralnet(Strength~., data = concrete_train, hidden = 5)
#now we plot our model and see the changes the algorithm has made 
#hint:: look at how the number of errors reduces as we increase the numder of nodes
plot(concrete_model2)
#we save the result of the second model
concrete_result2 <- compute(concrete_model2, concrete_test[1:8])
concrete_predediction_strength_2 <- concrete_result2$net.result
#we check the correlition between our model prediction and the real values
cor(concrete_preda, concrete_test$Strength)
#Don't be alarmed if your corrrelation values tend to decrease with increase in number of nodes
#Neuralnetwork tends to work differently at times
#have fun coding