## Put comments here that give an overall description of what your
## functions do

## Below are two functions that are used to create a special object
## that stores a matrix and caches its inverse.

## Write a short comment describing this function

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

s <- NULL
set <- function(y) {
x <<- y
s <<- NULL
}

## set the value of the matrix

get <- function() x

## get the value of the matrix

setsolve <- function(solve) s <<- solve

## set the value of the inverse

getsolve <- function() s

## get the value of the inverse

list(set = set, get = get,
setsolve = setsolve,
getsolve = getsolve)

}


## Write a short comment describing this function

## This function computes the inverse of the special "matrix" returned by
## makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not
## changed), then cacheSolve will retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

s <- x$getsolve()
if(!is.null(s)) {
message("getting cached data")
return(s)
}

data <- x$get()

## This function first checks to see whether the inverse has already been calculated.
## If so, it get s, the inverse from the cache, and skips the computation, and shows
## a message "getting cached data".

s <- solve(data, ...)
x$setsolve(s)
message("calculating the inverse...")

## Otherwise, it calculates the inverse of the data and sets the value
## of the inverse in the cache via the setsolve function, and shows
## a message "calculating the inverse...".

s

}
