
This small package is used to transform suitability prediction into binary prediction.

library(devtools)

install_github('gpzhu/thd')

library(thd)

Pred_thd<-thd(sdm=r, occ=aa, type = "p5")

#sdm is the suitability prediction, occ is the long and lat of testing occurrence data, threshold type can be mtp, p10 and p5

