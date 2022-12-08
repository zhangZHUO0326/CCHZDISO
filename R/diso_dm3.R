#' diso_dm3
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
diso_dm3 <- function(x){
    diso_3 <- matrix(0,3,1)
    for (i in 1:3) {
        dm3 = ((x[i+1,1]-x[1,1])^2+(x[i+1,2]-x[1,2])^2+(x[i+1,3]-x[1,3])^2)^0.5
        diso_3[i,1] <- dm3
        }
    cat(diso_3)
}


