## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x #gets the value of the matrix
  setinverse <- function(solve) m <<- solve # Sets the inverse of the matrix
  getinverse <- function() m # fetchs the inverse matrix
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)  #The output of the function is a lists containing the functions created above
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  } #If the inverse has already been calculated, the function retrives the inverse from the cache
  data <- x$get()
  m <- solve(data) 
  x$setinverse(m)
  m #Return a matrix that is the inverse of 'x'
}

x <-  matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
solve(x)


x <- makeCacheMatrix(x)
