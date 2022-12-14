#' diso_all
#'
#' @return
#' @export
#'
#' @examples
diso_all <- function(x){
    y <- cor(x)
    cc <- matrix(0,4,1)
    for (i in 1:4){
        cc[i,1] <- y[i,1]
    }

    mae <- matrix(0,4,1)
    for (i in 1:4){
        mae[i,1] <- caret::MAE(x[,i], x[,1])
    }

    rmse <- matrix(0,4,1)
    for (i in 1:4){
        rmse[i,1] <- caret::RMSE(x[,i], x[,1])
    }

    index <- cbind(cc,mae,rmse)

    nor_max=function(z){
        return(z/max(z))
    }

   in_nor <- apply(index, 2,nor_max)

    diso_1 <- matrix(0,4,1)  #创建空矩阵，储存结果
    for (i in 1:4) {
        dm1 = ((in_nor[i,1]-in_nor[1,1])^2)^0.5
        diso_1[i,1] <- dm1
    }

    diso_2 <- matrix(0,4,1)  #创建空矩阵，储存结果
    for (i in 1:3) {
        dm2 = ((in_nor[i,1]-in_nor[1,1])^2+(in_nor[i,2]-in_nor[1,2])^2)^0.5
        diso_2[i,1] <- dm2
    }

    diso_3 <- matrix(0,4,1)
    for (i in 1:3) {
        dm3 = ((in_nor[i,1]-in_nor[1,1])^2+(in_nor[i,2]-in_nor[1,2])^2+(in_nor[i,3]-in_nor[1,3])^2)^0.5
        diso_3[i,1] <- dm3
    }

    non <- cbind(cc,mae,rmse,diso_1,diso_2,diso_3)
    colnames(non) <- c("CC", "AE", "RMSE","DISO_1","DISO_2","DISO_3")
    rownames(non) <- c("OBS","Model_1","Model_2","Model_3")
    return(non)
}
