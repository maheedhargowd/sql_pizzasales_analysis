---

# Pizza Sales Analysis Using MySQL

This repository contains an in-depth analysis of pizza sales data, performed using SQL queries in MySQL Workbench. The goal of the analysis is to uncover trends and insights from the sales data, such as identifying the top pizza types by revenue, distribution of orders, and more.

## Table of Contents
- [Project Description](#project-description)
- [Database Schema](#database-schema)
- [Key Insights](#key-insights)
  - [Most Ordered Pizza Size](#most-ordered-pizza-size)
  - [Top 5 Most Ordered Pizza Types](#top-5-most-ordered-pizza-types)
  - [Pizza Category Distribution](#pizza-category-distribution)
  - [Order Distribution by Hour of the Day](#order-distribution-by-hour-of-the-day)
  - [Cumulative Revenue Over Time](#cumulative-revenue-over-time)
  - [Top 3 Most Ordered Pizza Types by Revenue for Each Category](#top-3-most-ordered-pizza-types-by-revenue-for-each-category)
  - [Percentage Contribution of Each Pizza Type to Total Revenue](#percentage-contribution-of-each-pizza-type-to-total-revenue)
- [Screenshots](#screenshots)
- [Conclusion](#conclusion)

## Project Description
This project involves querying a pizza sales database to analyze customer preferences, revenue distribution, and sales patterns. Insights are drawn from several aspects of the data, such as pizza types, sizes, categories, order time, and revenue generation.

The analysis was conducted using MySQL Workbench, and the SQL queries used for the analysis are available in the screenshots uploaded with this repository.

## Database Schema
The database includes the following tables:
- **orders**: Contains order-related details such as `order_id`, `order_date`, and `order_time`.
- **order_details**: Contains the relationship between orders and pizzas, including `pizza_id`, `order_id`, `quantity`, and price data.
- **pizzas**: Contains information about each pizza, such as its size, price, and `pizza_type_id`.
- **pizza_types**: Contains details about each pizza type, including its name, category, and ingredients.

## Key Insights

### Most Ordered Pizza Size
This analysis identifies the most commonly ordered pizza size based on the total quantity sold.

### Top 5 Most Ordered Pizza Types
The top 5 pizza types by order quantity are identified, providing insight into customer preferences.

### Pizza Category Distribution
The distribution of pizza orders across different categories (e.g., Classic, Supreme, Veggie, etc.) reveals which categories are most popular among customers.

### Order Distribution by Hour of the Day
Analyzing the distribution of orders by the hour of the day helps identify peak times for pizza sales, which can be useful for staffing and resource management.

### Cumulative Revenue Over Time
This analysis tracks revenue over time, showing how it accumulates day by day and providing insight into sales growth.

### Top 3 Most Ordered Pizza Types by Revenue for Each Category
The top 3 pizza types for each category (e.g., Veggie, Chicken) are identified based on total revenue.

### Percentage Contribution of Each Pizza Type to Total Revenue
This analysis calculates the percentage contribution of each pizza type to the overall revenue, helping to identify the highest revenue-generating pizzas.

## Screenshots
All SQL queries and their results have been documented in the screenshots provided in the repository. 

  
(Add more screenshots as needed and update paths accordingly)

## Conclusion
This project showcases the use of SQL to analyze pizza sales data. By querying a pizza sales database, valuable insights were derived to help businesses optimize operations and marketing efforts. These findings highlight customer preferences, peak order times, and the most profitable pizza types, all of which can guide data-driven decision-making.

---

