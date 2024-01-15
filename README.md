Intro to Neural Networks
Overview:
This project aims to predict the strength of concrete used in construction using machine learning. The neuralnet algorithm is employed for this purpose. The dataset used can be obtained from Regression with Neural Networking.

Author:Njoroge
Date: 08-03-2023

Instructions:
Dataset Source:
Access the dataset from  "https://www.kaggle.com/datasets/prathamtripathi/regression-with-neural-networking".

Library Used:
The primary library used for this project is neuralnet.

library(neuralnet)
Data Exploration:
Examine the structure of the concrete data:

str(concrete_data)
Data Normalization:
Neural networks work best when input data are scaled. Normalize the data:

normalize <- function(x){
  (((x)-min(x))/(max(x) - min(x)))
}
concrete_norm <- as.data.frame(lapply(concrete_data, normalize))
Check if the data has been normalized:

summary(concrete_data$Strength)
summary(concrete_norm$Strength)
Data Splitting:
Split the normalized data into training and testing sets:

concrete_train <- concrete_norm[1:830, ]
concrete_test <- concrete_norm[831:1030, ]
Model Creation:
Create the neural network model using the neuralnet algorithm:

concrete_model <- neuralnet(Strength~., data = concrete_train)
Plot the model to visualize how the algorithm works:

plot(concrete_model)
Save the results of the model:

concrete_result <- compute(concrete_model, concrete_test[1:8])
Save the predictions made by the model:

predicted_strength <- concrete_result$net.result
Evaluate the correlation between predictions and real values:

cor(predicted_strength, concrete_test$Strength)
Model Improvement:
Improve the model by increasing the number of nodes in the neural network:

concrete_model2 <- neuralnet(Strength~., data = concrete_train, hidden = 5)
Plot the updated model to observe changes:

plot(concrete_model2)
Save the results of the updated model:

concrete_result2 <- compute(concrete_model2, concrete_test[1:8])
Save the predictions made by the updated model:

concrete_prediction_strength_2 <- concrete_result2$net.result
Check the correlation between predictions and real values:

cor(concrete_prediction_strength_2, concrete_test$Strength)

Note:
Don't be alarmed if correlation values fluctuate; neural networks can behave differently.
Have Fun Coding!
