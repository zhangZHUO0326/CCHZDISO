#' diso_rmse
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
diso_rmse <- function(x){
    rmse <- matrix(0,4,1)
    for (i in 1:4){
        rmse[i,1] <- caret::RMSE(x[,i], x[,1])
    }
    return(rmse)
}

