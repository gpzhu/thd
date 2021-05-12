
# This small package is used to transform ENM suitability prediction into binary prediction.

library(devtools)

install_github('gpzhu/thd')

library(thd)


#Example, 'sdm' is the ENM suitability prediction;
#occ is the long and lat of testing occurrence data;
#threshold type can be mtp (minimum training threshold), p10 (10th training threshold) or p5 (5th traning threshold)

Pred_thd<-thd(sdm=r, occ=aa, type = "p5")

