## R Programming
## Programming Assignment 2

## The first function (makeCacheMatrix) accemtps a matrix
## It then creates a list with four elements each of which contains a function
## The functions are set, get, setinverse, and getinverse.
## set and get are used to store and return the matrix, respectively
## setinverse and getinverse are used to store and return the inverse of the matrix, respectively
## These functions are called by the cacheSolve function (below)

##two different Code snippets to create a matrix for testing
##first snippet:
#my_matrix <- 1:9
#dim(my_matrix) <- c(3,3)
#my_matrix[3,1] <- 7  ## change a value so we don't get a singular inverse matrix

##alternate code to create a matrix to work wtih
#mat <- matrix(1:4, 2,2)

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL ## initializes m in the super-environment
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse  ## sets value of m in the super-environment
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


##cacheSolve
## R Programming
## Programming Assignment 2
##
##  This function computes the inverse of the 
#   special "matrix" returned by makeCacheMatrix function. 
#   If the inverse has already been calculated 
#   then cacheSolve retrieves the inverse 
#   from the cache and indicates it has done so by
#   printing the message "Getting cached data".
#   Otherwise, cacheSolve will calculate the inverse of the matrix
#   and calls the function stored in the x$setinverse list element
#   to store the inverse of the matrix in the super-environment

cacheSolve <- function(x, ...) {
        
        ## Return a matrix that is the inverse of 'x' from the cache if already stored, 
        ## or by calculating it and then storing it in a variable in the super-environment
        
        m <- x$getinverse()  ## uses the getinverse() function to see if the inverse has already
                             # been calculated and cached 
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)  
        x$setinverse(m)  ## if m was not already cached, 
                         ## calls the function in the setinverse list member 
                         ## to set m to the inverse value returned by Solve
        m
}

