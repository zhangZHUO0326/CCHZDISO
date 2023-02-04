#' diso_rmse
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
diso_rmse <- function(x){
    rmse <- matrix(0,ncol(x),1)
    for (i in 1:ncol(x)){
        rmse[i,1] <- caret::RMSE(x[,i], x[,1])
    }
    return(rmse)
}

