import pandas as pd

df = pd.read_csv("animes.csv")


# print("Doublons : ",df.duplicated().sum())
# print("-"*100)
# print("Valeur manquant : ",df.isna().sum())
# print("-"*100)
# print(df.describe())

#Data Cleaning

df = df.drop_duplicates()
df = df.fillna({
    'img_url' : "unavailable" ,
    'synopsis' : "unavailable" ,
    'score' : df['score'].mean() ,
    'episodes' : int(df['episodes'].mean()) ,
    'ranked' : -1})

df.to_csv("animes_clean.csv",index=False)
