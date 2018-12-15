#RANDOM FOREST
cat("\014")

file_path = file.path("/Volumes/DATASHUR_P2/aftermissforest300000trueone.csv") 
trainset_old = read.csv(file_path, na.strings="")

drop=c("X80","X0000","X1110","X1212","X25","X52","X57","X70","X75","X92","nan","visit_at_all","X1820","X1840","X360","X.3","X.2","X.1","X3115","X1300","X450","X310","X1010","X30","X3027","X172A","X210C","X3029","Step.2.presented","X430","X170","X595","X2039","X420","X245A","Link","X154","X242","X215","X612","X315","X3930","X280","Radio.Button")

trainset=trainset_old[,!(names(trainset_old)%in%drop)]
#trainset= trainset_old
trainset$visit=as.factor(trainset$visit)

ds_tr = trainset[1: 299999,]#299999 = num of observation

# create uniformly distributed random by customerID
training = ds_tr[1:210000,]  # approximately %70 of Train-set    
testing  = ds_tr[210001:299999,] # approximately %30 of Train-set    

library(randomForest)
set.seed(201512)
mdl_randomforest = randomForest(
  visit ~ . -customerID, 
  data= training, ntree=10)

y_tr = (testing$visit == 1)

mdl_rf = predict(mdl_randomforest, testing, type="prob")#forrandom forest
mdl_rf = mdl_rf[,"1"]

threshold = 0.033
mdl_rf = (mdl_rf > threshold)


tp_rf1 = sum(((mdl_rf==TRUE) & (y_tr==TRUE)))   # true positive
fp_rf1 = sum(((mdl_rf==TRUE) & (y_tr==FALSE)))  # false positive
fn_rf1 = sum(((mdl_rf==FALSE) & (y_tr==TRUE)))  # false negative
tn_rf1 = sum(((mdl_rf==FALSE) & (y_tr==FALSE))) # true negative



total=tp_rf1+fn_rf1+fp_rf1+tn_rf1
score=((tp_rf1+ tn_rf1)/total)*100
print(score)
accuracy=(tp_rf1+tn_rf1)/total
print(accuracy)
recall = tp_rf1/(tp_rf1+fn_rf1)
precision = tp_rf1/(tp_rf1+fp_rf1)
print(recall)
print(precision)
