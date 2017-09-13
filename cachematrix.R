#######################################################################################################################################
## The makeCacheMatrix() function requires single matrix object argument and returns a list of functions that do the following:
##  get(): returns the value of the matrix
##  set(): sets the value of the matrix
##  getInverse(): returns the inverse value of the matrix
##  setInverse(): sets the inverse value of the matrix
#######################################################################################################################################

makeCacheMatrix <- function(x = matrix()) {
      i <- NULL
      ## set()
      set <- function(y) {
            x <<- y
            i <<- NULL
      }
      ## get()
      get <- function() x
      ## setInverse()
      setInverse <- function(Inverse) i <<- Inverse
      ## getInverse()
      getInverse <- function() i
      ## return the list of available functions
      list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

#######################################################################################################################################
## The cacheSolve() computes the inverse of a square invertable matrix.
## The function requires at least two arguments:
## x: a makeCacheMatrix function object
## ...: optional parameters to the solve function
#######################################################################################################################################

cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
      i <- x$getInverse()
      
      ## if cached object available, generate message and return cached matrix
      if(!is.null(i)) {
            message("getting cached inverse matrix data")
            return(i)
      }
      ## calculate matrix inverse
      data <- x$get()
      i <- solve(data, ...)
      
      ## set/cache results
      x$setInverse(i)
      
      ## return inverse results
      i
}

