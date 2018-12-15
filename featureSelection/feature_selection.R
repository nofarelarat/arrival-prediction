FEATURESELECTION
cat("\014")

file_path = file.path("F:\\50%lowerDataWithoutNull.csv") 

trainset = read.csv(file_path, na.strings="")

trainset[,"visit"] = 
  factor(trainset[,"visit"], levels=c(0,1), labels=c("not_visit","visit"))


ds_tr = trainset[1:299999,] #299999 = num of observation

library(randomForest)
mdl_fs_v1 = randomForest(
  visit ~ . -customerID ,
  data=ds_tr, ntree=10, importance=TRUE)

write.csv(importance(mdl_fs_v1),"D:\\plotimportance.csv")
