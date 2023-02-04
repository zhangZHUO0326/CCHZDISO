#' diso_ae
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
diso_ae <- function(x){
    mae <- matrix(0,ncol(x),1)
    for (i in 1:ncol(x)){
        mae[i,1] <- caret::MAE(x[,i], x[,1])
    }
    return(mae)
}
