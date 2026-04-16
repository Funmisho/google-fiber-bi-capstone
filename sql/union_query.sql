-- Google Fiber Repeat Call Analysis
-- ETL: Combine three market tables into a single reporting table
-- Tool: Google BigQuery
-- Course: Google Business Intelligence Professional Certificate — Course 2 Capstone

SELECT *
FROM `your_project.your_dataset.market_1`
UNION ALL
SELECT *
FROM `your_project.your_dataset.market_2`
UNION ALL
SELECT *
FROM `your_project.your_dataset.market_3`

-- Output: combined_calls.csv (1,350 rows)
-- Exported to CSV and loaded into Tableau for dashboard development
