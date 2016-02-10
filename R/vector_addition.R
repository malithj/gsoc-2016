#' Add two vectors using cpp integrated with R.
#'
#' @param x A vector.
#' @param y A vector.
#' @return The sum of \code{x} and \code{y}.
#' @examples
#' cppsum(c(1,3,4), c(3,2,6))
#' @import Rcpp
#' @name cppsum
#' @export
cppFunction('NumericVector cppsum(NumericVector x, NumericVector y){
  int x_size = x.size();
  int y_size = y.size();
  NumericVector out(x_size);

  if(x_size != y_size){
    printf("Cannot add vectors of unequal sizes");
    return R_NilValue;
  }
  else{
    for(int i=0;i<x_size;i++){
      out[i]=x[i]+y[i];
    }
    return out;
  }
}')
