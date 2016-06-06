## 
## Functions that compute and cache the inverse of a matrix.
##

#
# Creates a special matrix object that can cache its inverse.
#
makeCacheMatrix <- function(matrix = matrix()) {

  matrixInverse <- NULL

  getMatrix <- function() {
    matrix
  }

  setMatrix <- function(matrix) {
    matrix <<- matrix
    matrixInverse <<- NULL
  }

  getMatrixInverse <- function() {
    matrixInverse
  }

  setMatrixInverse <- function(matrixInverse) {
    matrixInverse <<- matrixInverse
  }

  list(
    getMatrix = getMatrix,
    setMatrix = setMatrix,
    getMatrixInverse = getMatrixInverse,
    setMatrixInverse = setMatrixInverse)
}

#
# Computes the inverse of the special matrix object returned by
# the makeCacheMatrix function. Returns the cached matrix inverse if 
# the inverse has already been computed.
#
cacheSolve <- function(cacheMatrix, ...) {

  matrixInverse <- cacheMatrix$getMatrixInverse()

  if (!is.null(matrixInverse)) {
    message("Getting cached matrix inverse...")
    return(matrixInverse);
  }

  message("Setting cached matrix inverse...")
  matrix <- cacheMatrix$getMatrix()
  matrixInverse <- solve(matrix, ...)
  cacheMatrix$setMatrixInverse(matrixInverse)
  matrixInverse
}
