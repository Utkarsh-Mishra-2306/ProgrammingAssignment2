## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# Create a special matrix object with caching capability
makeCacheMatrix <- function() {
  # Initialize the cache and matrix variables
  cache <- NULL
  matrix <- NULL
  
  # Function to set the matrix value and clear the cache
  set <- function(x) {
    matrix <<- x
    cache <<- NULL  # Clear the cache
  }
  
  # Function to retrieve the matrix value
  get <- function() {
    matrix
  }
  
  # Function to calculate the inverse of the matrix with caching
  cacheInverse <- function() {
    # Check if the inverse is already calculated and cached
    if (!is.null(cache)) {
      message("Fetching inverse from cache")
      return(cache)
    }
    
    # Calculate the inverse of the matrix
    inverse <- solve(matrix)
    
    # Cache the inverse
    cache <<- inverse
    
    message("Calculating inverse")
    return(inverse)
  }
  
  # Return a list of functions
  list(set = set, get = get, cacheInverse = cacheInverse)
}

# Function to retrieve the cached inverse of a matrix
cacheSolve <- function(x) {
  # Check if the matrix has a cached inverse
  if (!is.null(x$cacheInverse())) {
    message("Fetching inverse from cache")
    return(x$cacheInverse())
  }
  
  # If not cached, calculate the inverse
  inverse <- x$cacheInverse()
  
  message("Calculating inverse")
  return(inverse)
}

