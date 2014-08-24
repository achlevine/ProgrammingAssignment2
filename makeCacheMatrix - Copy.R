

##Code to create a matrix to work with
#my_matrix <- 1:9
#dim(my_matrix) <- c(3,3)
#my_matrix[3,1] <- 7  ## change a value so we don't get a singular inverse matrix

##alternate code to create a matrix to work wtih
mat <- matrix(1:4, 2,2)

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}
