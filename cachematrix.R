## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    mt <- NULL

    # the set function
    set <- function(y) {
        x <<- y
        mt <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) mt <<- inverse
    getinverse <- function() mt
    list(getinverse=getinverse, 
    	setinverse=setinverse, 
    	get=get, 
    	set=set)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
            mt <- x$getinverse()
            
    # check null for returning cached data
    if(!is.null(mt)) {
        message("getting cached data.")
        return(mt)
    }
    data <- x$get()

    # solve and store
    mt <- solve(data)
    x$setinverse(mt)
    mt
}
