import pandas as pd
import glob

path ="F:\\output_all\\write\\Newfolder\\"
filenames = glob.glob(path + "*.csv")
frame = pd.DataFrame()
dfs = []
for filename in filenames:
    df = pd.read_csv(filename,low_memory=False)
    dfs.append(df)
frame = pd.concat(dfs,sort='False')
frame.to_csv("F:\\output_all\\write\\afterProcessing.csv")
