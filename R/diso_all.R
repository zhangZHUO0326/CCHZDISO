#' diso_all
#'
#' @return
#' @export
#'
#' @examples
diso_all <- function(){
    non <- cbind(cc,ae,rmse,d1,d2,d3)
    colnames(non) <- c("CC", "AE", "RMSE","DISO_1","DISO_2","DISO_3")
    rownames(non) <- c("OBS","Model_1","Model_2","Model_3")
    return(non)
}
