#######################################################################################################################################
## Function to test caching mechanisms of cacheSolve
#######################################################################################################################################

testCacheSolve <- function() {
      ## create invertable matrix
      tmat <- matrix(c(1,0,3,4,0,6,3,4,0,0,1,2,0,0,1,0),nrow=4,ncol=4,byrow=TRUE)
      ## create cacheable variant
      mctmat<-makeCacheMatrix(tmat)
      # 1st Pass
      print("1st Pass")
      cacheSolve(mctmat)
      # 2nd Pass
      print("2nd Pass")
      cacheSolve(mctmat)
}