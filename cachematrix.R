## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) s <<- solve
    getsolve <- function() s
    list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    s <- x$getsolve()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setsolve(s)
    s
}

##### Just add here some steps for manual test#####
#   x <- NULL
#   x <- matrix(1:4, 2, 2)
#   x1 <- makeCacheMatrix(x)
#   y <- cacheSolve(x1)
#   y #### should show the inverse matrix of x
#   x %*% y  #### should show the identity matrix
#   cacheSolve(x1)  #### should show the inverse matrix of x and text
#                       "getting cached data" meaning that the 
#                       inverse matrix is read from the cache instead of
#                       recalculating it
########################################################################