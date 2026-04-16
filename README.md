# Google Fiber — Repeat Call Analysis Dashboard

> Capstone project for the **Google Business Intelligence Professional Certificate**  
> Tools: `BigQuery` · `SQL` · `Tableau`

---

## Overview

Google Fiber's customer service leadership wanted to understand how often customers were calling support more than once after their initial inquiry. High repeat call volume signals unresolved first contacts — which directly affects customer satisfaction and operational cost.

This project covers the full BI workflow: stakeholder requirements gathering → data pipeline → dashboard delivery.

**Live Dashboard →** [Tableau Public](https://public.tableau.com/views/Book1_17763319253850/GoogleFiberRepeatCallAnalysis?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) 

---

## Business Questions

1. How often does the customer service team receive repeat calls from customers?
2. Which problem types generate the most repeat calls?
3. Which market city receives the most repeat calls?

---

## Project Structure

```
google-fiber-bi-dashboard/
├── data/
│   └── combined_calls.csv          # Unified target table (BigQuery UNION ALL output)
├── sql/
│   └── union_query.sql             # ETL query used in BigQuery
├── docs/
│   ├── Google_Fiber_Case_Study.pdf
│   ├── stakeholder_requirements.docx
│   ├── project_requirements.docx
│   ├── strategy_document.docx
│   └── executive_summary.docx
├── assets/
│   └── dashboard_screenshot.png    # Dashboard preview
└── README.md
```

---

## Data

The dataset was provided as three separate CSV files representing three anonymised market city service areas. Each row represents a group of customer calls originating on a given date, with the following fields:

| Field | Description |
|---|---|
| `date_created` | Date of first customer contact |
| `contacts_n` | Number of first contacts |
| `contacts_n_1` to `contacts_n_7` | Repeat calls on days 1–7 after first contact |
| `new_type` | Problem type (Type_1 through Type_5) |
| `new_market` | Market city identifier (Market_1, 2, or 3) |

**Problem type mapping:**

| Code | Category |
|---|---|
| Type_1 | Account Management |
| Type_2 | Technician Troubleshooting |
| Type_3 | Scheduling |
| Type_4 | Construction |
| Type_5 | Internet & Wi-Fi |

---

## Pipeline — BigQuery

The three source tables were uploaded to BigQuery and combined into a single reporting table using a `UNION ALL` query:

```sql
SELECT *
FROM `project.dataset.market_1`
UNION ALL
SELECT *
FROM `project.dataset.market_2`
UNION ALL
SELECT *
FROM `project.dataset.market_3`
```

The resulting table (1,350 rows) was exported as `combined_calls.csv` and loaded into Tableau.

---

## Dashboard

![Dashboard](https://github.com/Funmisho/google-fiber-bi-capstone/blob/main/assets/Google%20Fiber%20Repeat%20Call%20Analysis.png)

The Tableau dashboard includes:

- **KPI cards** — Total First Contacts (64,939) and Total Repeat Calls (20,240)
- **Repeat Calls Trend Over Time** — monthly line chart with adjustable date granularity
- **First Contact Trend** — parallel trend line for context
- **Repeat Behaviour Curve** — shows the rate customers call back across the 7-day post-contact window
- **Repeat Calls by Problem Type** — ranked horizontal bar chart with readable category labels
- **Repeat Calls by Market** — bar chart comparing volume across all three markets
- **First Contact Volume by Day of Week** — weekly staffing insight

Built with accessibility in mind: large print labels (14pt+), high-contrast colour scheme, and Tableau Public alt-text descriptions per stakeholder requirements.

---

## Key Findings

- **~31.2% repeat call rate** — roughly 1 in 3 customers called back within 7 days of their first contact
- **Internet & Wi-Fi (Type_5)** drove the most repeat calls at **50.66%** — technical issues are consistently hardest to resolve on first contact
- **Technician Troubleshooting (Type_2)** was second at **29.58%** — together, these two categories account for over 80% of all repeat calls
- **Market_1** generated the most repeat calls (12,647) — 16x the volume of Market_2 (787)
- **Day 1 is critical** — the behaviour curve shows the steepest callback drop between Day 0 and Day 1, meaning most unresolved issues surface within 24 hours

---

## Certificate Context

This project was completed as the capstone across all three courses of the **Google Business Intelligence Professional Certificate**:

| Course | Focus | Project Deliverable |
|---|---|---|
| Foundations of Business Intelligence | Stakeholder requirements & planning | Stakeholder, Project, and Strategy documents |
| Path to Insights: Data Models and Pipelines | ETL, data modelling, BigQuery | UNION ALL pipeline → combined_calls target table |
| Decisions, Decisions: Dashboards and Reports | Tableau, dashboard design | Final interactive dashboard |

---

## Author

**Oluwabukunmi** — Data Analyst → Business Intelligence → Data Engineering  
[LinkedIn](https://www.linkedin.com/in/akinmi/) · [Tableau Public](https://public.tableau.com/views/Book1_17763319253850/GoogleFiberRepeatCallAnalysis?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) 
