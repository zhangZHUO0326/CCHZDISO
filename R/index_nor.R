#' index_nor
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
index_nor = function(x){
    apply(x, 2,nor_max)
}
