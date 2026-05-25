# Bright Motors Car Sales Analysis
### Business Insights for a New Head of Sales

## Project Overview

Bright Motors recently appointed a new Head of Sales with a mandate to expand the dealership network, improve sales performance, and optimise inventory decisions.

As a Junior Data Analyst, this project was completed to analyse historical vehicle sales data and generate actionable business insights using SQL and data visualisation techniques.

The analysis focused on identifying sales patterns, customer purchasing behaviour, regional performance, and pricing trends to support data-driven decision-making.

## 🎯 Project Objectives

This project aimed to answer the following business questions:

- Which car makes and models generate the most sales value?
- What relationship exists between selling price, mileage, and year of manufacture?
- Which regions contribute the highest sales performance?
- What customer purchasing patterns emerge from the data?
- What recommendations can improve dealership profitability and operational efficiency?

---

#  Project Workflow

```text
Planning → Data Preparation → SQL Analysis → Data Visualisation → Dashboard → Presentation
```

---

## Project Architecture

The project followed an end-to-end analytics workflow:

### 1. Data Source
- Bright Motors Car Sales Dataset (CSV)

### 2. Data Cleaning & Preparation
- Checked missing values
- Applied SQL data quality checks
- Standardised categorical values using:
  - COALESCE()
  - NULLIF()

### 3. SQL Exploratory Data Analysis (EDA)
Performed analysis using:
- SELECT
- WHERE
- GROUP BY
- ORDER BY
- COUNT()
- SUM()
- AVG()
- CASE
- COALESCE()

### 4. Visualisation
Created:
- Pivot Tables
- Charts
- Interactive Dashboard in Excel

### 5. Business Presentation
Compiled insights and recommendations for executive decision-making.

---

# 🛠 Tools Used

| Tool | Purpose |
|------|------|
| Databricks | SQL Analysis |
| SQL | Exploratory Data Analysis |
| Excel | Pivot Tables & Dashboard |
| Miro | Architecture Diagram |
| Canva / PowerPoint | Presentation |

---

# 📂 Repository Structure

```text
Bright-Motors-Car-Sales-Analysis/
│
├── data/
│   └── car_sales_data.csv
│
├── sql/
│   └── car_sales_queries.sql
│
├── visuals/
│   ├── pivot_tables.xlsx
│   ├── charts/
│   └── dashboard.png
│
├── presentation/
│   └── BrightMotors_Presentation.pdf
│
├── planning/
│   ├── gantt_chart.png
│   └── miro_architecture.png
│
└── README.md
```

---

# 📊 Key Analysis Performed

## Sales Performance
- Top performing car brands
- Top performing car models
- Regional sales performance

## Pricing Analysis
- Average selling price by year
- Price vs mileage trends
- Market value comparison

## Customer Preference Analysis
- Vehicle body type distribution
- Transmission trends

## Operational Insights
- Seller performance
- Pricing opportunities

---

# 🔎 Data Preparation Notes

During analysis:

- Missing categorical values were handled using `COALESCE()` and `NULLIF()`
- Records with missing selling prices were excluded from price-based analysis
- Each row represented a single vehicle sale transaction

---

# 📈 Dashboard Components

The dashboard includes:

- Top Car Brands by Sales Value
- Regional Sales Performance
- Price vs Mileage Analysis
- Market Pricing Performance
- Vehicle Type Distribution

Interactive slicers:
- State
- Body Type
- Transmission

---

# 💡 Key Business Recommendations

Based on the analysis:

1. Focus inventory allocation toward top-performing vehicle brands.
2. Strengthen regional dealership performance in high-demand states.
3. Review pricing strategies for vehicles sold below market value.
4. Prioritise inventory with lower mileage where possible.
5. Use sales trends to support future expansion decisions.

---

# 🚀 Project Outcome

This project demonstrates the use of SQL, data visualisation, and business storytelling to transform raw transactional data into actionable insights.

The final output supports strategic decision-making and reflects an end-to-end analytics workflow.

---

## 👩🏾‍💻 Author

**Nompumelelo Simango**  
Strategic Communications & Emerging Data Analytics Professional
