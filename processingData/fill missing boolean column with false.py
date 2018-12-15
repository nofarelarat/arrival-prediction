import pandas as pd
import numpy as np
import csv
import math
import datetime

for j in range (25,50):
    smb_path = "F:\\forcode2\\output"+str(j)+".csv"
    df = pd.read_csv(smb_path,low_memory=False)
    i=0
    try:
        df['userProduct1'] = df['userProduct1'].fillna(False)
        df['userProduct2'] = df['userProduct2'].fillna(False)
        df['userProduct3'] = df['userProduct3'].fillna(False)
        df['userProduct4'] = df['userProduct4'].fillna(False)
        df['userProduct5'] = df['userProduct5'].fillna(False)
        df['userProduct6'] = df['userProduct6'].fillna(False)
        df['userProduct7'] = df['userProduct7'].fillna(False)
        df['userProduct8'] = df['userProduct8'].fillna(False)
        df['userProduct9'] = df['userProduct9'].fillna(False)
        df['userProduct10'] = df['userProduct10'].fillna(False)
        df['userProduct11'] = df['userProduct11'].fillna(False)
        df['userProduct12'] = df['userProduct12'].fillna(False)
        df['userProduct13'] = df['userProduct13'].fillna(False)
        df['userProduct14'] = df['userProduct14'].fillna(False)
        df['userProduct15'] = df['userProduct15'].fillna(False)
    except:
        print("in except")

    #write to output file
    df.to_csv('F:\\output_after_fill_with_false\\output'+str(j)+'.csv')
