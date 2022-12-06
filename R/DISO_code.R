#' diso
#' 用于计算diso值
#' @param CC相关系数 AE绝对误差 RMSE均方根误差
#' @return 输出diso值



# 输入数据,导入统计指标数据
library(readxl)
x = read_xls('./data/index.xls',na="NA")


# 对指标进行归一化处理，根据实际情况选择归一化函数，这里用的是最大值归一化函数
nor_max=function(x){
  return(x/max(x))
}
dfmax = apply(x, 2,nor_max)  # 2是对列进行计算；1是对行进行计算


# 计算一维diso
diso_dm1 <- matrix(0,3,1)  #创建空矩阵，储存结果
for (i in 1:3) {
  dm1 = ((dfmax[i+1,1]-dfmax[1,1])^2)^0.5
  diso_dm1[i,1] <- dm1
}

# 计算二维diso
diso_dm2 <- matrix(0,3,1)  #创建空矩阵，储存结果
for (i in 1:3) {
  dm2 = ((dfmax[i+1,1]-dfmax[1,1])^2+(dfmax[i+1,2]-dfmax[1,2])^2)^0.5
  diso_dm2[i,1] <- dm2
}

# 计算三维diso
diso_dm3 <- matrix(0,3,1)  #创建空矩阵，储存结果
for (i in 1:3) {
  dm3 = ((dfmax[i+1,1]-dfmax[1,1])^2+(dfmax[i+1,2]-dfmax[1,2])^2+(dfmax[i+1,3]-dfmax[1,3])^2)^0.5
  diso_dm3[i,1] <- dm3
}

# 拼接diso矩阵
diso <- cbind(diso_dm1,diso_dm2,diso_dm3)

# 输出结果
write.xlsx(diso,'./data/diso.xls')


# 绘图二维diso图
plot(dfmax,pch = 16,
     xlab = "CC",
     ylab = "NAE",xlim=c(0,1),ylim=c(0,1))

# 添加文本标注
text(0.88,0,'OBS(1,0)',cex=0.8)
text(0.33,0.4,'s1(x1,y1)',cex=0.8)
text(0.07,1,'s2(x2,y2)',cex=0.8)
text(0.47,0.95,'s3(x3,y3)',cex=0.8)

text(0.6,0.2,'DISO1',cex=0.9)
text(0.30,0.7,'DISO2',cex=0.9)
text(0.9,0.5,'DISO3',cex=0.9)

# 添加线段
segments(x0 = dfmax[1,1], y0 = dfmax[1,2], x1 = dfmax[2,1], y1 = dfmax[2,2], col = "red",lwd = 2.5)
segments(x0 = dfmax[1,1], y0 = dfmax[1,2], x1 = dfmax[3,1], y1 = dfmax[3,2], col = "blue",lwd = 2.5)
segments(x0 = dfmax[1,1], y0 = dfmax[1,2], x1 = dfmax[4,1], y1 = dfmax[4,2], col = "black",lwd = 2.5)
