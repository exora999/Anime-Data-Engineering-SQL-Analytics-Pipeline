-- Active: 1793051800986@@127.0.0.1@3306


SELECT anime_genres.genre , COUNT(anime_genres.uid) AS Totale
FROM anime_genres
WHERE anime_genres.genre  IS NOT NULL
GROUP BY anime_genres.genre 
ORDER BY  Totale DESC

WITH AnimeGenreCounts AS (
    SELECT uid, COUNT(genre) AS genre_count
    FROM anime_genres
    GROUP BY uid
)
SELECT 
    CASE 
        WHEN agc.genre_count = 1 THEN 'Single Genre '
        ELSE 'Multi/Double Genre '
    END AS category,
    ROUND(AVG(a.score), 2) AS average_score,
    COUNT(a.uid) AS total_animes
FROM AnimeGenreCounts agc
INNER JOIN animes a ON agc.uid = a.uid
WHERE a.score IS NOT NULL
GROUP BY category;

WITH test AS (
    SELECT animes.uid,animes.episodes,animes.score,animes.members,
    CASE
    WHEN animes.episodes BETWEEN 12 AND 25 THEN 'Short anime'
    ELSE 'Long-running anime'
    END AS anime_type
    FROM animes
)
SELECT anime_type,ROUND(AVG(score),2) AS average_score,ROUND(AVG(members),0) AS average_members,COUNT(uid) AS total_animes
FROM test
GROUP BY anime_type;

SELECT 
    SUBSTR(aired, -4, 4) AS release_year,COUNT(uid) AS total_animes
    FROM animes
    WHERE aired IS NOT NULL AND release_year GLOB '[0-9][0-9][0-9][0-9]'
    GROUP BY release_year
    ORDER BY release_year DESC

WITH RankedAnimes AS (
    SELECT animes.uid,animes.title,anime_genres.genre,animes.score,
    row_number()OVER(PARTITION BY anime_genres.genre ORDER BY animes.score DESC) AS rang
FROM animes
INNER JOIN anime_genres ON anime_genres.uid = animes.uid
WHERE animes.score IS NOT NULL AND anime_genres.genre IS NOT NULL
)
SELECT title,genre,score,rang
FROM RankedAnimes
WHERE rang <=3








