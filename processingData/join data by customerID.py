import pandas as pd
import numpy as np
import csv
import math
import datetime

for j in range (25,50):
    smb_path = "F:\\output_all\\output"+str(j)+".csv"
    df = pd.read_csv(smb_path,low_memory=False)
    visits = "F:\\AllDemograficData.csv"
    df_visits = pd.read_csv(visits,low_memory=False)

    result = df.merge(df_visits, how='left', on='customerID')
    result = result[result.visit_at_all.notnull()]

    #write to output file
    result.to_csv('F:\\forcode\\output'+str(j)+'.csv')



