#NAIVE BASE
cat("\014")

file_path = file.path("/Volumes/DATASHUR_P2/aftermissforest300000trueone.csv") 
trainset_old = read.csv(file_path, na.strings="")
drop=c("X80","X0000","X1110","X1212","X25","X52","X57","X70","X75","X92","nan","visit_at_all","X1820","X1840","X360","X.3","X.2","X.1")
trainset=trainset_old[,!(names(trainset_old)%in%drop)]

trainset$visit=as.factor(trainset$visit)
ds_tr = trainset[1: 299999,]#299999 = num of observation

set.seed(2016)

# create uniformly distributed random by customerID
training = ds_tr[1:210000,]  # approximately %70 of Train-set    
testing  = ds_tr[210001:299999,] # approximately %30 of Train-set    

library(naivebayes)
set.seed(201512)
mdl_naivebayes = naive_bayes(
  visit ~ . -customerID, 
  data=training)

y_tr = (testing$visit == "1")

mdl_nb = predict(mdl_naivebayes, data = testing, type="class")

threshold = 0.033
mdl_nb = (mdl_nb > threshold)

tp_rf1 = sum(((mdl_nb==TRUE) & (y_tr==TRUE)))   # true positive
fp_rf1 = sum(((mdl_nb==TRUE) & (y_tr==FALSE)))  # false positive
fn_rf1 = sum(((mdl_nb==FALSE) & (y_tr==TRUE)))  # false negative
tn_rf1 = sum(((mdl_nb==FALSE) & (y_tr==FALSE))) # true negative

total=tp_rf1+fn_rf1+fp_rf1+tn_rf1
score=((tp_rf1+ tn_rf1)/total)*100
print(score)
accuracy=(tp_rf1+tn_rf1)/total
print(accuracy)
recall = tp_rf1/(tp_rf1+fn_rf1)
precision = tp_rf1/(tp_rf1+fp_rf1)
print(recall)
print(precision)
