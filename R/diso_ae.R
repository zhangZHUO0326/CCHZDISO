#' diso_ae
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
diso_ae <- function(x){
    mae <- matrix(0,4,1)
    for (i in 1:4){
        mae[i,1] <- caret::MAE(x[,i], x[,1])
    }
    return(mae)
}

