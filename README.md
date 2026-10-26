# 🎬 Anime Data Engineering & SQL Analytics Pipeline

An end-to-end data pipeline built with Python, Pandas, SQLite, and MySQL to clean, normalize, and analyze anime industry data.

## 📌 Architecture & Data Flow
1. **Data Cleaning (`clean_animes.py` & `clean_reviews.py`):**
   - Handles missing values (`fillna`) across numerical and categorical features.
   - Deduplicates records (`drop_duplicates`) for data integrity.
2. **Data Transformation & Normalization (`table.py`):**
   - Parses genre lists using Python's `ast.literal_eval`.
   - Explodes nested genre data to structure relational tables in SQLite.
3. **Advanced SQL Analytics (`advanced_queries.sql`):**
   - Implements **Common Table Expressions (CTEs)** to aggregate anime metrics.
   - Uses **Window Functions (`ROW_NUMBER() OVER`)** to partition and rank top-rated titles per genre.
   - Performs regex-like filtering and text processing (`SUBSTR`, `GLOB`).

## 🛠️ Tech Stack
* **Language:** Python 3.x, SQL
* **Data Processing:** Pandas, AST
* **Database:** SQLite / MySQL
* **Concepts:** Data Normalization, CTEs, Window Functions, ETL Pipeline
