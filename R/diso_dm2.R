#' diso_dm2
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
diso_dm2 <- function(x){
    diso_2 <- matrix(0,4,1)  #创建空矩阵，储存结果
for (i in 1:3) {
    dm2 = ((x[i,1]-x[1,1])^2+(x[i,2]-x[1,2])^2)^0.5
    diso_2[i,1] <- dm2
}
    return(diso_2)
}

