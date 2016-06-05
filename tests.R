
source("cachematrix.R")

matrix <- matrix(c(2, 4, 3, 1, 5, 7, 2, 6, 8), nrow = 3, ncol = 3)

cacheMatrix <- makeCacheMatrix(matrix)

for (i in 1:10) {
  matrixInverse = cacheSolve(cacheMatrix)
}

print(matrix %*% matrixInverse)