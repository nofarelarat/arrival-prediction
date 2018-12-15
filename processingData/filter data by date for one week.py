import pandas as pd
import numpy as np
import csv
import math
import datetime

for j in range (27,28):
    smb_path = "F:\\forcode\\output"+str(j)+".csv"
    df = pd.read_csv(smb_path,low_memory=False)
    i=0
    hasDate=0
    result = df
    for row in result['visit_at_all']:
        if(pd.isnull(result['Interaction_Date'][i])):
            hasDate=0
        else:
            d0 = str(result['Interaction_Date'][i])
            d1 = str(result['date_date'][i])
            try:
                date0 = datetime.datetime.strptime(d0, "%d/%m/%Y")
                date1 = datetime.datetime.strptime(d1, "%Y-%m-%d")
                delta = date0 - date1
                hasDate=1
            except:
                date0 = datetime.datetime.strptime(d0, "%d/%m/%Y")
                date1 = datetime.datetime.strptime(d1, "%d/%m/%Y")
                delta = date0 - date1
                hasDate=1
 
        if(row == 0):
            result['visit'][i] = 0
        else:
            if(hasDate == 1):
                if(abs(delta.days) < 7):
                    if(result['visit_at_all'][i] == 1):
                        result['visit'][i] = 1
                    else:
                        result['visit'][i] = 0
                else:
                    result['visit'][i] = 0
            else:
                result['visit'][i] = 0

        i=i+1
    #write to output file
    result.to_csv('F:\\forcode2\\output'+str(j)+'.csv')
