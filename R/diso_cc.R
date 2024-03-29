#' diso_cc
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
diso_cc <- function(x) {
    y <- cor(x)
    cc <- matrix(0,ncol(x),1)
    for (i in 1:ncol(x)){
        cc[i,1] <- y[i,1]
    }
    return(cc)
}

