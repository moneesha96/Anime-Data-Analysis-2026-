# 🎬 Anime Industry Analysis | SQL & Power BI

### Exploring anime releases, ratings, studios, genres and audience popularity

An end-to-end data analytics portfolio project that combines **data preparation**, **SQL exploratory analysis** and an **interactive Power BI dashboard** to investigate trends across the anime industry. The dashboard uses a custom anime-inspired purple-and-pink design.


## 📌 Project overview

The aim of this project is to explore how anime production and audience engagement vary across release years, formats, studios, genres and source materials. The analysis focuses on questions such as:

- How has the number of anime releases changed over time?
- Which anime formats achieve the highest average scores?
- Which studios have produced the most titles?
- Which genres and adaptation sources appear most frequently?
- How many anime are rated versus unrated?
- Which titles lead in audience popularity?

## 🗂️ Repository contents

| File | Description |
| --- | --- |
| `anime_analysis.sql` | SQL queries exploring ratings, studios, genres, sources, release years and popularity. |
| `anime_cleaned(1).csv` | Cleaned anime dataset used for the analysis (30,763 rows, 14 columns). |
| `Anime Industry Analysis Dashboard.pbix` | Interactive Power BI report. |
| `README.md` | Project documentation (this file). |


## 📊 Dataset

The cleaned dataset contains **30,763 anime records** and **14 fields**:

`anime_id`, `Name`, `Score`, `Genres`, `Type`, `Episodes`, `Studios`, `Source`, `Rank`, `Popularity`, `Favorites`, `Scored By`, `Members`, and `Release Year`.

The data supports analysis of release history, anime formats, viewer scores, studios, genre tags, source material and engagement indicators. **Missing values are retained where the information is unavailable**, rather than inventing replacement values.

### Data quality snapshot

| Metric | Value |
| --- | ---: |
| Total anime records | 30,763 |
| Anime with a score | 20,358 |
| Anime without a score | 10,405 |
| Records with missing studio information | 12,150 |
| Records with missing release year | 887 |

*These counts were calculated from the uploaded cleaned CSV. Some dashboard visuals can display different totals when filters are applied.*

## 🧹 Data preparation

The dataset was prepared using **Power Query** and loaded into Power BI. The preparation workflow included reviewing column data types, identifying missing or unknown values, standardising missing-value handling and preparing release-year information for time-based analysis.

For analysis, it is important to distinguish missing scores or studio information from genuine values. The cleaned dataset therefore retains nulls where information is not available.

## 🧮 SQL exploratory analysis

The SQL file documents questions and queries across these areas:

1. **Ratings:** top-scoring titles and average scores by anime format.
2. **Rating coverage:** total, rated and unrated anime.
3. **Studios:** studios with the highest title counts and average scores (with a minimum of 10 rated titles for the latter query).
4. **Sources:** distribution and average scores by adaptation/source category.
5. **Genres:** counts of anime tagged Action, Comedy, Romance, Fantasy and Drama.
6. **Release trends:** years with the highest number of releases.
7. **Popularity:** titles ordered by the dataset's `Popularity` ranking.

Example analytical pattern from the SQL script:

```sql
SELECT
    type AS Anime_type,
    ROUND(AVG(CAST(score AS REAL)), 2) AS Average_score,
    COUNT(*) AS Total_Anime
FROM anime_cleaned
WHERE score IS NOT NULL
GROUP BY type
ORDER BY Average_score DESC;
```

**SQL compatibility note:** The uploaded CSV contains display-friendly column names such as `Release Year ` (including a trailing space), while the SQL script refers to `release_year`. The SQL assumes a database table named `anime_cleaned` with appropriately normalised column names. Rename columns when importing the CSV, or adjust SQL identifiers to match your database schema. Also review statement terminators if running the entire script at once.

## 📈 Power BI dashboard

The interactive report includes:

- **KPI cards:** Total Anime, Rated Anime and Unrated Anime.
- **Anime releases by year and type:** stacked release trends across formats.
- **Anime releases over time:** historical release-count trend.
- **Top 10 anime studios:** number of titles associated with each studio.
- **Average anime score by type:** comparison of ratings across formats.
- **Top 10 anime genres:** frequency of genre categories.
- **Anime distribution by type:** breakdown of anime formats.
- **Anime distribution by source:** original works, manga, games, light novels and other sources.
- **Top 10 most popular anime:** comparison of audience popularity/engagement.
- **Release Year slicer:** interactive filtering by year range.

The report uses a **dark purple, pink and blue palette**, custom KPI icons and an anime-inspired background to make the analysis visually engaging.

## 🔎 Key findings

The following findings are calculated from the **uploaded cleaned dataset**; they represent the unfiltered data and may differ from a filtered dashboard view.

| Finding | Evidence |
| --- | --- |
| Approximately two-thirds of records have scores | 20,358 rated out of 30,763 total (66.2%). |
| TV anime have the highest average score among major formats | TV averages **6.87**, compared with **6.49** for TV Specials and **6.37** for Movies. |
| Toei Animation leads the studio title count | **904** records, followed by Sunrise (**568**) and J.C.Staff (**411**). |
| Original is the largest source category | **13,285** records, followed by Manga (**5,786**). |
| Recent years account for many releases | **2021** has **1,287** records and **2023** has **1,282** in the cleaned data. |

**Interpretation notes:** Studio counts reflect the `Studios` field as stored in the dataset; entries listing multiple studios are not split into separate studio credits. Average-score comparisons exclude unrated records. Release counts reflect dataset coverage and should not automatically be interpreted as complete industry totals.

## 🛠️ Tools and technologies

- **SQL** — exploratory queries, grouping, filtering, ranking and aggregations.
- **Power BI Desktop** — interactive dashboard, KPI cards, charts and slicers.
- **Power Query** — data cleaning, type handling and transformation.
- **CSV** — cleaned data storage and exchange.
- **GitHub** — project documentation and version control.

## ▶️ How to explore the project

1. Clone or download this repository.
2. Open `Anime Industry Analysis Dashboard.pbix` in **Power BI Desktop**.
3. If Power BI requests a source-file path, update the dataset connection to your local copy of `anime_cleaned(1).csv` and refresh the report.
4. Explore the charts and adjust the **Release Year** slicer.
5. To reproduce the SQL analysis, import the CSV into a SQL database as `anime_cleaned`, align column names with the SQL script and run the queries in `anime_analysis.sql`.

> **Note:** Power BI Desktop is primarily a Windows application. The SQL script uses `LIMIT` and other syntax compatible with SQLite-style SQL; modifications may be required for other database engines.

## 🚀 Potential improvements

- Add a data dictionary and a link to the original dataset source/license.
- Split multi-valued studio and genre fields for more precise counts.
- Add a dedicated date table and verify slicer interactions across all visuals.
- Export a high-resolution dashboard screenshot into `images/dashboard.png`.
- Validate and standardise the SQL script for a named database engine.

## 👤 Author

**Moneesha**  
GitHub: [@moneesha96](https://github.com/moneesha96)

**Repository:** [Anime-Data-Analysis-2026-](https://github.com/moneesha96/Anime-Data-Analysis-2026-)

---

*Portfolio project showcasing data cleaning, SQL analysis, visual storytelling and interactive business intelligence reporting.*
