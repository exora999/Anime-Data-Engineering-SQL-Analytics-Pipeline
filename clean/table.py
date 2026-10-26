import pandas as pd
import ast
import sqlite3

df = pd.read_csv("csv_clean/animes_clean.csv")

def parse_genre(x):
    if isinstance(x, list):
        return x
    try:
        return ast.literal_eval(x)
    except Exception:
        return [str(x)]

df['genre_list'] = df['genre'].apply(parse_genre)

df_exploded = df.explode('genre_list')

anime_genres = df_exploded[['uid', 'genre_list']].rename(columns={'genre_list': 'genre'})

anime_genres['genre'] = anime_genres['genre'].str.strip()

conn = sqlite3.connect("Database/anime.db")
anime_genres.to_sql("anime_genres", conn, if_exists="replace", index=False)
conn.close()
