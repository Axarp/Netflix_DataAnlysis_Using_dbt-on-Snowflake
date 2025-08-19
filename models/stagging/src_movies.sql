WITH raw_movies AS (
    -- SELECT * FROM MOVIELENS.RAW.RAW_MOVIES
    SELECT * FROM {{ source('my_project', 'r_movies') }}
)
SELECT
    movieId AS movie_id,
    title,
    genres
FROM raw_movies