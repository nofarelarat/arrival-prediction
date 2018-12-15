import pandas as pd
import numpy as np
import csv
smb_file = "PremiumData0000000000"
output = "output"
zero="0"
for i in range (0,99):
    if(i>9):
        zero=""
    smb_path = "E:\\Premium_group2\\" + smb_file + zero+ str(i) + ".csv"
    df = pd.read_csv(smb_path,low_memory=False) 
    mat = df.as_matrix(columns=['useCase','deviceCategory','eventCategory','eventAction'])
    values, counts = np.unique(mat.astype(str), return_counts=True)
    for x in values:
      df[x]=df.isin([x]).any(1).astype(int)
    df=df.drop(['pageTitle','hits','visits','hitNumber','isExit','isEntrance','cleanurl','pagePathLevel1','pagePathLevel2','userPermissions','type','site','userChannel'],1)
    df=df.drop(['eventCategory','deviceCategory','useCase','eventAction'],1)    
    df[['customerID','visitNumber','timeOnSite','time']] = df.groupby('Session_ID')['customerID','visitNumber','timeOnSite','time'].transform('max')
    df[['pageviews','hour','minute']] = df.groupby('Session_ID')['pageviews','hour','minute'].transform('mean')
    grouped = df.groupby('Session_ID')
    out_path = "E:\\output\\" + output + zero+ str(i) + ".csv"
    grouped.max().to_csv(out_path)
  
  




