--  year for which we want to populate the actors table
WITH current_year_data AS (
    SELECT
        actor_id,
        actor_name AS actor,
        ARRAY_AGG(ROW(film_name, votes, rating, film_id, 
            CASE
                WHEN rating > 8 THEN 'star'
                WHEN rating > 7 THEN 'good'
                WHEN rating > 6 THEN 'average'
                ELSE 'bad'
            END
        )::film_struct) AS films,
        MAX(release_year) AS current_year,
        BOOL_OR(release_year = 2023) AS is_active
    FROM
        actor_films
    WHERE
        release_year = 2023
    GROUP BY
        actor_id, actor_name
)
INSERT INTO actors (actor_id, actor, films, is_active, current_year)
SELECT
    actor_id,
    actor,
    films,
    is_active,
    current_year
FROM
    current_year_data;
