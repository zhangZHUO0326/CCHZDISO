#' helpdiso
#' @export

helpdiso <- function(){
cat(' CCHZ-DISO

     这个包是用于计算DISO的结果
     DISO Functions:
     DISO的计算中常用的指标有:CC(相关系数),AE(绝对误差),RMSE(均方根误差),此外，
     使用者可以自行选择针对研究所需要的指标以及指标个数。
     数据说明：
                    CC           AE          RMSE
            OBS     1            0           0
       moedel_1     0.4307       74.0533     94.5999
       moedel_2     0.1784       184.5961    191.7863
       moedel_3     0.5737       174.4418    179.1482

     使用的数据如上，第一行代表观测系统（Observation system）的不同指标值，
     第二到四行分别代表模型一到模型三的不同指标值（moedel_1 to moedel_3）。

     这里第一列CC的值在0-1之间，，不需要进行归一化处理，而AE和RMSE的值均大于1，
     对AE和RMSE进行归一化成为NAE和NRMSE。
     这里使用的归一化是最大值归一化，其公式为：nor_x=x/max(x).

                    CC           NAE         NRMSE
            OBS     1            0           0
       moedel_1     0.4307       0.4012      0.4933
       moedel_2     0.1784       1           1
       moedel_3     0.5737       0.9450      0.9341

     然后进行DISO值的计算：

     DISO_i=√(nors_i^1−nors_0^1)^2+(nors_i^2−nors_0^2)^2+…+(nors_i^n−nors_0^n)^2


     计算结果如下：

                      diso_1        diso_2        diso_3
       moedel_1       0.5692998     0.6964444     0.8534269
       moedel_2       0.8216393     1.2942531     1.6355706
       moedel_3       0.4263186     1.0367051     1.3954593

      diso_1即是只计算一个统计指标，即一维DISO值。这里一维计算的指标为CC(相关系数)
      diso_2即是只计算两个统计指标，即二维DISO值。这里二维计算的指标为CC(相关系数)和AE(绝对误差)
      diso_3即是只计算两个统计指标，即三维DISO值。这里三维计算的指标为CC(相关系数)、AE(绝对误差)和RMSE(均方根误差)

      模型的DISO值越小，总体性能越好，反之亦然。计算出不同模型的DISO值，可以方便、
      定量地获得不同模型之间的综合精度。

      由于在不同的研究领域和研究方向可以选择不同的统计指标，所以DISO也是多样化的，
      由研究者来决定，可以描述模型在不同方面的综合模拟性能。


       模型的构建：
      假设有1+m个模型(S0,S1,S2,…,Sm)，其中S0是参考数据OBS，(S1,S2,…,Sm) 是m个模型
      模拟的待评估数据；
      统计指数为n个包括 (s_i^1,s_i^2,…,s_i^n)。
      CCHZ-DISO评估系统的构建过程，包括如下步骤：
      步骤1：通过OBS计算每个模型的统计指标值,形式为(s_i^1,s_i^2,…,s_i^n)，
      其中 i=0,1,…,m，(s_0^1,s_0^2,…,s_0^n) 是OBS相对于自身的统计指标值。
      步骤2：通过除以极差来归一化所有统计指数。
      (nors_i^1,nors_i^2,…,nors_i^n)=(s_i^1/p^1,s_i^2/p^2,…,s_i^n/p^n)
      其中，p^j=max(s_i^j)−min⁡(s_i^j), i=0,1,…,m, j=1,2,…n, 实现归一化后绝对值小于1；
      由于CC的取值范围为(−1~1)之间，故没有必要对其归一化。
      步骤3：利用(nors_i^1,noms_i^2,…,nors_i^n)之间的欧氏距离计算DISO：
      DISO_i=√(nors_i^1−nors_0^1)^2+(nors_i^2−nors_0^2)^2+…+(nors_i^n−nors_0^n)^2
      其中i=0,1,…,m, m为模拟模型的数量。当i=0时，DISO_0=0表示OBS与自身的距离。


      详细介绍请参考文章：
      Decompositions of Taylor diagram and DISO performance criteria
      DOI:10.1002/joc.7149

      DISO: A rethink of Taylor diagram
      DOI:10.1002/joc.5972

      Hu, Z., Chen, D., Chen, X.*, et al., 2022, CCHZ-DISO: A Timely New Assessment
       System for data quality or model performance from Da Dao Zhi Jian,
       Geophysical Research Letters, DOI: 10.1029/2022GL100681.

      Zhou, Q., Chen, D., Hu, Z*. and Chen, X*, 2021, Decompositions of Taylor
      diagram and DISO performance criteria,International Journal of Climatology,
       41 (12), 5726-5732.

      Hu, Z., Chen, X.*, Zhou, Q., Chen, D., Li, J., 2019, DISO: A rethink of
      Taylor diagram,International Journal of Climatology, 39(5): 2825-2832

      The innovations of our CCHZ-DISO evaluation system are reflected in five
      aspects. Firstly,the CCHZ-DISO framework is based on the Eucledian distance
      which can be easily and simply understand by different researchers.
      Secondly, the dimensions of CCHZ-DISO are from one to infinite,which can
      include some new statistic metrics constructed in future. Thirdly, we do
      not make a flexibility method about the metrics number not constricting the
      number and types of the statistic metrics to define the CCHZ-DISO.
      The number and types of the statistic metrics are completely based on the
      concrete researches of the researchers. Fourthly, the weights of statistic
      metrics of CCHZ-DISO are flexible defined.
      The researchers can easily choose a suitable approach about the weights.
      In the end, the CCHZ-DISO evaluation system can be widely applied in any
      study areas of any subjects.'
)
}

