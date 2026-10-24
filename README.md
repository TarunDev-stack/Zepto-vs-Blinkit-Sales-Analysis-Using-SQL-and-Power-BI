# Zepto vs Blinkit Sales Analysis Using SQL and Power BI

## 📌 Project Overview

This project focuses on comparing two leading Indian quick-commerce platforms, **Zepto and Blinkit**, using SQL and Power BI. It explores customer purchasing behavior, product performance, sales trends, and geographic demand to derive meaningful business insights.

The project uses SQL queries and reusable views to analyze business performance and Power BI to visualize key findings through an interactive dashboard.

## 🎯 Project Objectives

- Compare sales and revenue performance between Zepto and Blinkit.
- Identify high-value and repeat customers.
- Analyze product and category performance.
- Understand purchasing patterns across different age groups.
- Examine monthly, yearly, and weekend sales trends.
- Compare city-wise and state-wise business performance.
- Present business insights through data visualization.

## 📊 Dataset Overview

The dataset consists of **three relational tables**, manually created and cleaned using Excel.

| Table Name | Description |
|---|---|
| `customers` | Customer name, age, gender, email, city, and state |
| `products` | Product name, brand (Zepto/Blinkit), category, and price |
| `orders` | Order date, time, quantity, total bill, product ID, and customer ID |

These tables are connected using customer and product IDs to support relational analysis through SQL joins.

## ❓ Business Questions

The analysis addresses the following business questions:

1. Who are the top five customers by total spending?
2. How does revenue vary by customer age and brand?
3. Which product categories perform best for each brand?
4. How does revenue compare between younger and older customer groups?
5. What are the top three products by revenue for each brand?
6. Which product categories are exclusive to Zepto?
7. How does yearly revenue compare between the two brands?
8. Which cities generate the highest revenue?
9. Which states have the lowest revenue?
10. How does revenue change month by month and year by year?
11. How much sales revenue is generated on weekends?
12. Which customers place repeat orders for each brand?
13. What is the total number of repeat orders by brand?

## 🛠️ Technologies Used

- **SQL Server** — querying, joining, aggregating, and analyzing relational data.
- **Power BI** — dashboard development and data visualization.
- **Microsoft Excel** — dataset preparation and cleaning.
- **Git and GitHub** — version control and project hosting.

## 🧠 SQL Concepts Covered

- `SELECT`, `WHERE`, and `ORDER BY`
- `INNER JOIN`
- `GROUP BY` and aggregate functions
- `HAVING`
- `CASE WHEN` statements
- Common Table Expressions (CTEs)
- Window functions such as `RANK()`
- SQL views for reusable business logic

## 📈 Expected Business Insights

The analysis is designed to help identify:

- High-value customer segments.
- Differences in revenue between Zepto and Blinkit.
- Popular products and categories.
- Geographic areas with stronger or weaker sales.
- Seasonal and weekend purchasing patterns.
- Opportunities to improve customer retention and sales performance.

*Actual findings should be documented after executing the SQL queries against the dataset and validating the Power BI visuals.*

## 📂 Project Structure

```text
Zepto-vs-Blinkit-Sales-Analysis/
│
├── raw_queries.sql
├── view_queries.sql
├── ZEPTO_VS_BLINKIT_VISUALIZATION.pbix
└── README.md
```

*Note: File names may differ slightly in the repository. The dataset files should also be included if they are available and can be shared.*

## 🚀 How to Use This Project

1. Obtain the dataset containing the `customers`, `products`, and `orders` tables.
2. Import or create the tables in SQL Server.
3. Review and execute the SQL view definitions after ensuring they are compatible with SQL Server.
4. Run the corresponding queries to inspect the analysis results.
5. Open the Power BI report in Power BI Desktop and configure the data source if necessary.
6. Explore the dashboard and interpret the results.

## 📚 Learning Outcomes

This project provides practice in relational database analysis, SQL-based business problem solving, data aggregation, customer behavior analysis, and dashboard interpretation.

It also demonstrates how structured data can be transformed into business-focused insights to support analytical decision-making.

## 🙌 Acknowledgment

This repository is an adaptation of an existing Zepto vs Blinkit SQL analysis project. Credit goes to the original project author for the starting materials. Further learning, modifications, and analysis should be documented transparently as they are completed.
