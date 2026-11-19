select *
from anime_cleaned; 

select count(*)
from anime_cleaned;

-- Which 10 anime have the highest scores?
SELECT name AS Anime_Name,
       score AS Score 
from anime_cleaned
WHERE score IS NOT NULL 
ORDER BY score DESC
LIMIT 10; 

-- Do TV series, movies, OVAs or other anime format receive higher average ratings? 
SELECT
 type AS Anime_type,
 ROUND(AVG(cast(score AS real)),2) AS Average_score,
 COUNT(*) AS Total_Anime
FROM anime_cleaned
WHERE score IS NOT NULL
GROUP BY type 
ORDER BY Average_score DESC; 

-- How many animes are rated vs unrated? 
SELECT
  COUNT (*) as Total_Anime, 
  COUNT(score) AS Rated_Anime,
  SUM(
    CASE 
       WHEN score IS NULL THEN 1 
       ELSE 0 
    end 
    ) AS Unrated_Anime
   FROM anime_cleaned


-- Which 10 anime have the highest rating?
SELECT name AS Anime_Name,
       score AS Score 
from anime_cleaned
WHERE score IS NOT NULL 
ORDER BY CAST(score as REAL) DESC
LIMIT 10; 

-- Which anime format has the highest average rating? 
SELECT type,  
       ROUND(AVG(score),2) AS Average_Score,
       COUNT(*) As Total_Anime 
       from anime_cleaned
       WHERE score is not NULL
       GROUP BY type 
       ORDER BY Average_Score DESC ;
       
-- Which 10 anime studios have produced the most anime? 
SELECT studios,
COUNT(*) AS Total_Anime
FROM anime_cleaned
WHERE studios IS NOT NULL 
 and studios <>''
group by studios 
ORDER BY Total_Anime DESC 
limit 10; 

-- Which anime sources are most common? 
SELECT source,
COUNT(*) AS Total_Anime
FROM anime_cleaned
WHERE source IS NOT NULL 
 and source <>''
group by source 
ORDER BY Total_Anime DESC 

-- Which anime genres are most common? 
SELECT name, genres 
FROM anime_cleaned
WHERE genres IS NOT NULL 
LIMIT 10; 

--How many anime contain Action? 
SELECT COUNT (*) Action_Anime 
FROM anime_cleaned
WHERE genres LIKE '%Action%';

-- Compare popular anime genres

SELECT
    SUM(CASE WHEN genres LIKE '%Action%' THEN 1 ELSE 0 END) AS Action,
    SUM(CASE WHEN genres LIKE '%Comedy%' THEN 1 ELSE 0 END) AS Comedy,
    SUM(CASE WHEN genres LIKE '%Romance%' THEN 1 ELSE 0 END) AS Romance,
    SUM(CASE WHEN genres LIKE '%Fantasy%' THEN 1 ELSE 0 END) AS Fantasy,
    SUM(CASE WHEN genres LIKE '%Drama%' THEN 1 ELSE 0 END) AS Drama FROM anime_cleaned;
    
-- Which years have the most anime?
SELECT
    release_year,
    COUNT(*) AS Total_Anime
FROM anime_cleaned
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY Total_Anime DESC
LIMIT 10;


--Average score by source
SELECT
    source,
    ROUND(AVG(score), 2) AS Average_Score,
    COUNT(score) AS Rated_Anime
FROM anime_cleaned
WHERE source IS NOT NULL
  AND source <> ''
  AND score IS NOT NULL
GROUP BY source
ORDER BY Average_Score DESC;

--Highest-rated anime studios
SELECT
    studios,
    ROUND(AVG(score), 2) AS Average_Score,
    COUNT(score) AS Rated_Anime
FROM anime_cleaned
WHERE studios IS NOT NULL
  AND studios <> ''
  AND score IS NOT NULL
GROUP BY studios
HAVING COUNT(score) >= 10
ORDER BY Average_Score DESC
LIMIT 10;



-- Top 10 most popular anime
SELECT
    name,
    popularity,
    score
FROM anime_cleaned
WHERE popularity IS NOT NULL
  AND popularity > 0
ORDER BY popularity ASC
LIMIT 10;

