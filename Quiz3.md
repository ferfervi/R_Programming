# QUIZ 3

-

### Question 1
Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:
library(datasets)
data(iris)
A description of the dataset can be found by running
?iris
There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica? (Please only enter the numeric result and nothing else.)
```
Answer for Question 1
You entered:

Your Answer		Score	Explanation
6.588	Correct	1.00	To get the answer here, you can use 'tapply' to calculate the mean of 'Sepal.Length' within each species.
```
-

### Question 2

Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
```
Your Answer		Score	Explanation
1. apply(iris, 1, mean)			
2. apply(iris, 2, mean)			
3. colMeans(iris)			
4. apply(iris[, 1:4], 2, mean)	Correct	1.00	
```

-
	
### Question 3
Load the 'mtcars' dataset in R with the following code
library(datasets)
data(mtcars)
There will be an object names 'mtcars' in your workspace. You can find some information about the dataset by running
?mtcars
How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
```
Your Answer		Score	Explanation
1. sapply(mtcars, cyl, mean)			
2. sapply(split(mtcars$mpg, mtcars$cyl), mean)	Correct	1.00	
3. split(mtcars, mtcars$cyl)			
4. lapply(mtcars, mean)	
```		

-
	
### Question 4
Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

```
Answer for Question 4
You entered:

126.5779	Correct	1.00	
```

-

### Question 5

If you run debug(ls) what happens when you next call the 'ls' function?
```

Your Answer		Score	Explanation
1. Execution of the 'ls' function will suspend at the 4th line of the function and you will be in the browser.			
2. Execution of 'ls' will suspend at the beginning of the function and you will be in the browser.	Correct	1.00	
3. The 'ls' function will execute as usual.			
4. You will be prompted to specify at which line of the function you would like to suspend execution and enter the browser.			
```

