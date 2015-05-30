## Functions to test the concept of Lexical Scopping
## We create an object "makeacheMatrix" which has 
## functions which access to a variable in another scope: the cached result.




## A) Initialize the Object, wrapper, for the Matrix "x". This object/wrapper will contain
## the data of the matrix, the cached result of his inverse (if any) and functions to access
## and modify the cached result, at the same time than the Matrix.

makeCacheMatrix <- function(x = matrix()) {
  
  #vble where to store the cached result:
  cachedInverse <- NULL
  
  #function, reset the matrix (x) content to the matrix sent in the argument (y)
  set <- function(y) {
    x <<- y
    cachedInverse <<- NULL
  }
  
  #function, return the content of the matrix (x)
  get <- function() x
  
  #function, call once inverse is calculated so it will be cached as inverse of the matrix (x)
  setInverse <- function(inverse) cachedInverse <<- inverse
  
  #function, return the inverse cached
  getInverse <- function() cachedInverse
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

}


## B) Function that will get as a parameter the object/wrapper including the matrix to calcualte the 
## inverse from, his cached inverse and functions to set or get these variables.
## This function which check if the inverse has been calculated previously, extracting it from 
## the cache, otherwise, the inverse will be calculated and stored in the wrapper/cache for future usage.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  #extract the cached inverse for the "x" matrix from his wrapper
  inv <- x$getInverse()
  #if it was calculated previously, return the cached inverse, otherwise ... continue
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  #get the content of the Matrix from his wrapper object in "data"
  data <- x$get()
  #calculate the inverse of the Matrix 
  inv <- solve(data, ...)
  #store the inverse in the wrapper object for of the Matrix 
  x$setInverse(inv)
  inv
}


# C) How to use these functions for testing the lexical scoping??
# c.1) Create an object which will store the contenct of the matrix, his inverse, and functions to access them 
#      > wrapper= makeCacheMatrix();
#
# c.2) Assign the content of the matrix to calculate the inverse to this wrapper
#      > wrapper$set(matrix(1:4,2,2))
#
# c.3) The object contains the matrix. Call the function above "cacheSolve" which will check if
#       the invese has been calculated and cached previously. Otherwhise will perform these operations.      
#
# Calculate the inverse (1st time) of the matrix included into the wrapper object
#> cacheSolve(wrapper)
#       [,1] [,2]
#       [1,]   -2  1.5
#       [2,]    1 -0.5
#
# The second time it will retrieve it from cache
# > cacheSolve(wrapper)
#   getting cached data
#   [,1] [,2]
#   [1,]   -2  1.5
#   [2,]    1 -0.5
#
