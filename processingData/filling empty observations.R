file_path = file.path("F:\\50%lowerDataByCustomerID.csv")

trainset = read.csv(file_path, na.strings="")

ds_tr = trainset[1:299999,] #299999 = num of observation

library(missForest)
dummy = as.data.frame(ds_tr) 
imputed1 = missForest(dummy, maxiter = 10, ntree = 10, variablewise = FALSE,
                      decreasing = TRUE, verbose = TRUE,
                      mtry = floor(sqrt(ncol(dummy))), replace = TRUE)

write.csv(imputed1$ximp,"F:\\aftermissforest300000.csv")


