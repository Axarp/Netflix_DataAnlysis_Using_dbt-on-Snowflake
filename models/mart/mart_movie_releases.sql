{{ config(materialized = 'table') }}

With fct_ratings AS (
    SELECT * FROM {{ ref('fct_ratings') }}
),
seed_dates AS (
    SELECT * FROM {{ref('seed_movie_release_dates')}}
)
SELECT 
    F.*,
    CASE 
        WHEN d.release_date IS NUll THEN 'unknown'
        ELSE 'known'
    END AS release_info_available
FROM fct_ratings f
LEFT JOIN seed_dates d 
ON f.movie_id = d.movie_id