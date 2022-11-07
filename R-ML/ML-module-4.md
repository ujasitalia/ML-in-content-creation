## ML-module-4
Hello and welcome to the fourth module on Machine Learning.
In this module we will learn about train/test of datasets.

## Train/Test
In Machine Learning we create models to predict the outcome of certain events
To measure if the model is good enough, we can use a method called Train/Test.

## What is Train/Test
Train/Test is a method to measure the accuracy of your model.
It is called Train/Test because you split the the data set into two sets: a training set and a testing set.
80% for training, and 20% for testing.
You train the model using the training set.
You test the model using the testing set.
Train the model means create the model.
Test the model means test the accuracy of the model.

## Split Into Train/Test
The training set should be a random selection of 80% of the original data.
The testing set should be the remaining 20%.
train_x = x[:80]
train_y = y[:80]
test_x = x[80:]
test_y = y[80:]

## Display the Training Set
Display the scatter plot with the training set:
Example
plt.scatter(train_x, train_y)
plt.show()

## Display the Testing Set
To make sure the testing set is not completely different, we will take a look at the testing set as well.
Example
plt.scatter(test_x, test_y)
plt.show()

## Conclusion
Thank you.