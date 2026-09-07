-- =====================================================
-- RETAIL STORE ANALYSIS
-- SQL PORTFOLIO PROJECT
-- =====================================================



-- =====================================================
-- QUERY 1: TOTAL SALES BY STORE
-- Business Question:
-- Which stores generated the most sales over the full period?
-- =====================================================

SELECT
    store,
    SUM(amount) AS total_sales
FROM sales_raw
WHERE category = 'Sales'
GROUP BY store
ORDER BY total_sales DESC;

-- Finding:
-- Store G generated the highest total sales at approximately
-- $15.58 million, followed by Store C at approximately $14.11 million.
-- Store A ranked third at approximately $11.57 million.
-- Store E generated the lowest total sales at approximately $5.25 million.



-- =====================================================
-- QUERY 2: QUARTERLY SALES BY STORE
-- Business Question:
-- How did sales performance change by store across quarters?
-- =====================================================

SELECT
    store,
    quarter,
    SUM(amount) AS total_sales
FROM sales_raw
WHERE category = 'Sales'
GROUP BY store, quarter
ORDER BY store, quarter;

-- Finding:
-- Review quarterly performance for each store to identify
-- growth trends, declines, seasonal changes, and unusual quarters.
-- Final finding will be updated after reviewing the query results.



-- =====================================================
-- QUERY 3: TOTAL SALES BY DEPARTMENT
-- Business Question:
-- Which departments generated the most sales?
-- =====================================================

SELECT
    department,
    SUM(amount) AS total_sales
FROM sales_raw
WHERE category = 'Sales'
GROUP BY department
ORDER BY total_sales DESC;

-- Finding:
-- This query identifies which departments contribute the most
-- revenue across all stores.
-- Final finding will be updated after reviewing the query results.



-- =====================================================
-- QUERY 4: DEPARTMENT PERFORMANCE BY STORE
-- Business Question:
-- Which departments generate the most sales within each store?
-- =====================================================

SELECT
    store,
    department,
    SUM(amount) AS total_sales
FROM sales_raw
WHERE category = 'Sales'
GROUP BY store, department
ORDER BY store, total_sales DESC;

-- Finding:
-- This query shows the strongest and weakest departments within
-- each individual store and can reveal differences in product mix
-- and customer purchasing patterns.
-- Final finding will be updated after reviewing the query results.



-- =====================================================
-- QUERY 5: QUARTER-OVER-QUARTER SALES GROWTH
-- Business Question:
-- How much did each store's sales change from the previous quarter?
-- =====================================================

WITH quarterly_sales AS (
    SELECT
        store,
        quarter,
        SUM(amount) AS total_sales
    FROM sales_raw
    WHERE category = 'Sales'
    GROUP BY store, quarter
),

sales_with_previous AS (
    SELECT
        store,
        quarter,
        total_sales,
        LAG(total_sales) OVER (
            PARTITION BY store
            ORDER BY
                2000 + RIGHT(TRIM(quarter), 2)::int,
                LEFT(TRIM(quarter), 2)
        ) AS previous_quarter_sales
    FROM quarterly_sales
)

SELECT
    store,
    quarter,
    total_sales,
    previous_quarter_sales,
    ROUND(
        (
            (total_sales - previous_quarter_sales)
            / NULLIF(previous_quarter_sales, 0)
        ) * 100,
        2
    ) AS growth_percent
FROM sales_with_previous
ORDER BY
    store,
    2000 + RIGHT(TRIM(quarter), 2)::int,
    LEFT(TRIM(quarter), 2);

-- Finding:
-- This query measures quarter-over-quarter sales growth for each store
-- and highlights periods of significant expansion or decline.
-- Final finding will be updated after reviewing the query results.



-- =====================================================
-- QUERY 6: GROSS PROFIT AND GROSS MARGIN BY STORE
-- Business Question:
-- Which stores generated the most gross profit and strongest margins?
-- =====================================================

SELECT
    store,

    SUM(
        CASE
            WHEN category = 'Sales' THEN amount
            ELSE 0
        END
    ) AS total_sales,

    SUM(
        CASE
            WHEN category = 'Cost of Goods Sold' THEN amount
            ELSE 0
        END
    ) AS total_cogs,

    SUM(
        CASE
            WHEN category IN ('Sales', 'Cost of Goods Sold')
            THEN amount
            ELSE 0
        END
    ) AS gross_profit,

    ROUND(
        SUM(
            CASE
                WHEN category IN ('Sales', 'Cost of Goods Sold')
                THEN amount
                ELSE 0
            END
        )
        /
        NULLIF(
            SUM(
                CASE
                    WHEN category = 'Sales' THEN amount
                    ELSE 0
                END
            ),
            0
        ) * 100,
        2
    ) AS gross_margin_percent

FROM sales_raw
GROUP BY store
ORDER BY gross_profit DESC;

-- Finding:
-- This query compares both total gross profit and gross margin
-- across stores, providing a more meaningful profitability measure
-- than sales alone.
-- Final finding will be updated after reviewing the query results.



-- =====================================================
-- QUERY 7: WAGES AS A PERCENTAGE OF SALES
-- Business Question:
-- Which stores spend the largest percentage of sales on wages?
-- =====================================================

SELECT
    store,

    SUM(
        CASE
            WHEN category = 'Sales' THEN amount
            ELSE 0
        END
    ) AS total_sales,

    ABS(
        SUM(
            CASE
                WHEN category = 'Wages' THEN amount
                ELSE 0
            END
        )
    ) AS total_wages,

    ROUND(
        ABS(
            SUM(
                CASE
                    WHEN category = 'Wages' THEN amount
                    ELSE 0
                END
            )
        )
        /
        NULLIF(
            SUM(
                CASE
                    WHEN category = 'Sales' THEN amount
                    ELSE 0
                END
            ),
            0
        ) * 100,
        2
    ) AS wage_percent_of_sales

FROM sales_raw
GROUP BY store
ORDER BY wage_percent_of_sales DESC;

-- Finding:
-- This query measures labor cost relative to sales and helps identify
-- stores with comparatively high or low wage burdens.
-- Final finding will be updated after reviewing the query results.



-- =====================================================
-- QUERY 8: STRONGEST AND WEAKEST STORE-QUARTER SALES
-- Business Question:
-- Which store and quarter combinations produced the highest
-- and lowest sales?
-- =====================================================

SELECT
    store,
    quarter,
    SUM(amount) AS quarterly_sales
FROM sales_raw
WHERE category = 'Sales'
GROUP BY store, quarter
ORDER BY quarterly_sales DESC;

-- Finding:
-- The highest rows identify the strongest store-quarter combinations,
-- while the lowest rows identify the weakest.
-- These results can help surface unusually strong or weak periods
-- for further investigation.
-- Final finding will be updated after reviewing the query results.