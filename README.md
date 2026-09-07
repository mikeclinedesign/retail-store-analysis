# Retail Store Performance Analysis

## Project Overview

This project analyzes more than 4,000 financial records from a multi-store retail business to evaluate store and department performance, identify sales trends, and forecast future performance.

Using approximately 2.5 years of historical data, I developed a 12-month sales forecast incorporating a 2.5% inflation assumption and built a KPI dashboard designed for management to monitor performance against projected targets. The dashboard allows managers to quickly evaluate whether individual stores are performing above or below forecast and identify areas requiring further investigation.

The project follows an end-to-end analytics workflow across multiple tools:

- **Excel** — Cleaned and validated the source data, performed exploratory analysis, developed the 12-month forecast, and built a management KPI dashboard comparing actual performance against projections.
- **PostgreSQL** — Queried the cleaned dataset to analyze store and department performance, quarter-over-quarter growth, gross margins, and labor costs.
- **Tableau** — Developed interactive visualizations to communicate store, department, and financial performance.
- **GitHub** — Documented the analysis, methodology, code, findings, and final deliverables in a portfolio case study.

---

## Business Questions

The analysis was designed to answer several key questions:

- Which stores generate the highest sales?
- How does store performance change from quarter to quarter?
- Which departments generate the most revenue?
- How does department performance differ between stores?
- Which stores have experienced the strongest or weakest sales growth?
- Which stores generate the strongest gross profit and gross margins?
- How significant are wage expenses relative to sales?
- What does historical performance suggest about future sales?

---

## Dataset

The dataset contains **4,241 financial records** covering seven retail stores across approximately 2.5 years of quarterly performance.

Key fields used in the analysis include:

- Store
- Quarter
- Department
- Financial Category
- Amount

Financial categories include:

- Sales
- Cost of Goods Sold
- Supplies
- Wages

---

## Data Preparation

The source data was reviewed and cleaned in Excel before analysis.

Preparation included:

- Checking for exact duplicate records
- Checking critical fields for missing values
- Validating numeric financial data
- Standardizing department information
- Mapping department codes to department names
- Converting the cleaned dataset to CSV for PostgreSQL
- Validating record counts after database import
- Confirming numeric fields using SQL aggregation tests

The final PostgreSQL table contained **4,241 records**.

---

## Excel Analysis & KPI Dashboard

Excel was used for data preparation, exploratory analysis, forecasting, and management reporting.

The analysis included:

- Store-level performance comparisons
- Quarterly sales trend analysis
- Category and department-level analysis
- Pivot tables and visualizations
- Historical trend analysis
- 12-month sales forecasting
- A 2.5% inflation assumption applied to forward-looking projections

A management KPI dashboard was built to translate the analysis into an operational reporting tool. The dashboard allows managers to compare actual store performance against projected targets and quickly determine whether performance is above or below expectations.

This provides management with a repeatable way to monitor forecast accuracy, identify performance gaps, and investigate stores or departments that deviate materially from projected results.

The completed Excel analysis and KPI dashboard are available in the [`excel`](./excel/) folder.

---

## PostgreSQL Analysis

The cleaned dataset was imported into PostgreSQL for further analysis.

SQL was used to answer eight business questions:

1. Total sales by store
2. Quarterly sales by store
3. Total sales by department
4. Department performance by store
5. Quarter-over-quarter sales growth
6. Gross profit and gross margin by store
7. Wages as a percentage of sales
8. Strongest and weakest store-quarter sales performance

The complete SQL analysis is available in the [`sql`](./sql/) folder.

---

## Key Findings

### Store Performance

Store G generated the highest cumulative sales during the analyzed period at approximately **$15.58 million**, followed by Store C at approximately **$14.11 million**.

Store A ranked third at approximately **$11.57 million**.

Store E generated the lowest cumulative sales at approximately **$5.25 million**.

Further quarterly and department-level analysis was used to distinguish differences in overall store size from changes in performance over time.

### Additional Findings

Additional findings from department performance, quarterly growth, profitability, and labor-cost analysis will be summarized here based on the SQL and Excel results.

---

## Forecasting

Historical quarterly performance was used to build a forward-looking sales forecast.

The forecast:

- Uses historical quarterly sales trends
- Projects performance over the next 12 months
- Incorporates a **2.5% inflation assumption**
- Provides store-level projections for future performance

This provides management with a baseline for evaluating expected sales and planning future operations.

---

## Tools & Skills Demonstrated

**Excel**
- Data cleaning
- Pivot tables
- XLOOKUP
- Financial analysis
- Data visualization
- Forecasting

**PostgreSQL / SQL**
- SELECT
- WHERE
- GROUP BY
- ORDER BY
- Aggregate functions
- CASE statements
- Common Table Expressions (CTEs)
- Window functions
- LAG()
- NULLIF()
- KPI calculations

**Tableau**
- Interactive dashboard development *(in progress)*

---

## Repository Structure

```text
retail-store-analysis/
│
├── README.md
│
├── data/
│   └── retail_store_cleaned_data.csv
│
├── excel/
│   └── retail_store_analysis.xlsx
│
└── sql/
    └── retail_store_analysis.sql
