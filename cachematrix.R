## The below functions can cache the inversion of a matrix using special matrix object

## The below function will create a special matrix object which can cache the inverted matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set<-function(y){
      x <<- y
      m <<- NULL
    }
    get <- function() x
    getinvmatrix<-function() m
    setinvmatrix<-function(invmatrix) m <<- invmatrix
    list(set=set,get=get,getinvmatrix=getinvmatrix,setinvmatrix=setinvmatrix)
}


## The below function will return the inverted matrix from cache if it exists otherwise computes and stores in cache

cacheSolve <- function(x, ...) {
    m<-x$getinvmatrix()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data<-x$get()
    m<-solve(data)
    x$setinvmatrix(m)
    m
}
