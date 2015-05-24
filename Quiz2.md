# QUIZ 2

### Question 1
Suppose I define the following function in R
> cube <- function(x, n) {
        x^3
}

What is the result of running
cube(3) in R after defining this function?
```
1. The users is prompted to specify the value of 'n'.			
2. An error is returned because 'n' is not specified in the call to 'cube'			
3. The number 27 is returned	Correct	1.00	Because 'n' is not evaluated, it is not needed even though it is a formal argument.
4. A warning is given with no value returned.
```			

-
### Question 2

The following code will produce a warning in R.
> x <- 1:10
if(x > 5) {
        x <- 0
}

Why?
```
1. You cannot set 'x' to be 0 because 'x' is a vector and 0 is a scalar.			
2. There are no elements in 'x' that are greater than 5			
3. The syntax of this R expression is incorrect.			
'x' is a vector of length 10 and 'if' can only test a single logical statement.	Correct	1.00	
4. The expression uses curly braces.			
```
-
### Question 3

Consider the following function
> f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}

If I then run in R
> z <- 10
f(3)

What value is returned?
```
1. 7			
2. 10	Correct	1.00	
3. 16			
4. 4			
```
-

### Question 4

Consider the following expression:
> x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}

What is the value of "y" after evaluating this expression?

```
1. 3			
2. NA			
3. 5			
4. 10	Correct	1.00	

```
-
	
### Question 5

Consider the following R function
> h <- function(x, y = NULL, d = 3L) {
>        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}

Which symbol in the above function is a free variable?

```
1. f	Correct	1.00	
2. z			
3. d			
4. L			
5. g			

```

--	

### Question 6

What is an environment in R?
```
1. a list whose elements are all functions			
2. a collection of symbol/value pairs	Correct	1.00	
3. an R package that only contains data			
4. a special type of function			
```	
-

### Question 7

The R language uses what type of scoping rule for resolving free variables?
```
1. lexical scoping	Correct	1.00	
2. compilation scoping			
3. global scoping			
4. dynamic scoping			
```
-

### Question 8

How are free variables in R functions resolved?
```
1. The values of free variables are searched for in the environment in which the function was defined	Correct	1.00	
2. The values of free variables are searched for in the global environment			
3. The values of free variables are searched for in the working directory			
4. The values of free variables are searched for in the environment in which the function was called			
```
-
	
### Question 9

What is one of the consequences of the scoping rules used in R?
```
1. Functions cannot be nested			
2. R objects cannot be larger than 100 MB			
3. All objects can be stored on the disk			
4. All objects must be stored in memory	Correct	1.00	
```	
-
### Question 10
In R, what is the parent frame?
http://stackoverflow.com/questions/7439110/what-is-the-difference-between-parent-frame-and-parent-env-in-r-how-do-they

```
1. It is the environment in which a function was defined			
2. It is the package search list			
3. It is the environment in which a function was called	Correct	1.00	
4. It is always the global environment	
```		

