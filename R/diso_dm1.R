#' diso_dm1
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
diso_dm1 <- function(x){
    diso_1 <- matrix(0,ncol(x),1)  #创建空矩阵，储存结果
    for (i in 1:ncol(x)) {
    dm1 = ((x[i,1]-x[1,1])^2)^0.5
    diso_1[i,1] <- dm1
    }
    return(diso_1)
}

