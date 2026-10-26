import pandas as pd

df = pd.read_csv("reviews.csv")


df = df.drop_duplicates()

df.to_csv("reviews_clean.csv")
