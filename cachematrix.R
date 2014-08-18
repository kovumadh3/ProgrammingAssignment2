## This function takes matrix as peramter and set matrix and
## reset inverse of the matrix when any change in matrix

## this function also returns the original matrix

makeCacheMatrix <- function(x = matrix()) {
  
  s <- NULL
  set <- function(y) {    
    x <<- y   
    s <<- NULL    
  }   
  get <- function() {    
    x    
  }  
  setSolve <- function(solve) {    
    s <<- solve  
  }  
  getSolve <- function() {    
    s    
  }  
  list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)
}


## This function calculates inverse of matrix if not been calculated before
## if inverse is in Cache, the function fetches the inverse from Cache
## If not, the function calculate the inverse
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'  
  
  s <- x$getSolve()
  if(!is.null(s)) {
    message("Using cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setSolve(s)
  s
}
