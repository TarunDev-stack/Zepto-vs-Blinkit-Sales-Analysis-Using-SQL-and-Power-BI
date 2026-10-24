-- 1. Top 5 Customers by Spend
CREATE VIEW top_customers_by_spend AS
SELECT 
    customers.customer_name, 
    SUM(orders.total_bill) AS total_spend
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_name
ORDER BY total_spend DESC
LIMIT 5;

-- 2. Age & Brand-wise Revenue
CREATE VIEW age_brand_revenue AS
SELECT 
    products.brand,
    customers.age,
    SUM(orders.total_bill) AS total_revenue
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN products ON orders.product_id = products.product_id
GROUP BY customers.age, products.brand;

-- 3. Most Ordered Product Category by Brand
CREATE VIEW most_ordered_category_by_brand AS
WITH ranked_categories AS (
    SELECT 
        product_category,
        brand,
        SUM(price) AS total_amount,
        RANK() OVER(PARTITION BY brand ORDER BY SUM(price) DESC) AS rk
    FROM products
    GROUP BY product_category, brand
)
SELECT brand, product_category
FROM ranked_categories
WHERE rk = 1;

-- 4. Age Group-wise Revenue from Each Platform
CREATE VIEW age_group_platform_revenue AS
SELECT 
    products.brand,
    CASE 
        WHEN customers.age BETWEEN 18 AND 30 THEN 'young'
        ELSE 'senior'
    END AS age_group,
    SUM(orders.total_bill) AS total_revenue
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN products ON orders.product_id = products.product_id
GROUP BY products.brand, age_group;

-- 5. Top 3 Selling Products in Each Brand
CREATE VIEW top_3_products_per_brand AS
WITH ranked_products AS (
    SELECT 
        brand,
        product_name,
        SUM(price) AS total_revenue,
        RANK() OVER(PARTITION BY brand ORDER BY SUM(price) DESC) AS rk
    FROM products
    GROUP BY brand, product_name
)
SELECT brand, product_name, total_revenue
FROM ranked_products
WHERE rk <= 3;

-- 6. Product Categories Sold on Zepto but Not on Blinkit
CREATE VIEW zepto_exclusive_categories AS
SELECT DISTINCT product_category
FROM products
WHERE brand = 'Zepto'
AND product_category NOT IN (
    SELECT DISTINCT product_category
    FROM products
    WHERE brand = 'Blinkit'
);

-- 7. Year-wise Total Sales by Each Brand
CREATE VIEW yearly_sales_by_brand AS
SELECT 
    orders.year,
    products.brand,
    SUM(orders.total_bill) AS total_revenue
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY orders.year, products.brand;

-- 8. Top 3 Cities by Orders for Each Brand
CREATE VIEW top_3_cities_per_brand AS
WITH city_ranks AS (
    SELECT 
        orders.city,
        products.brand,
        SUM(orders.total_bill) AS total_revenue,
        RANK() OVER(PARTITION BY products.brand ORDER BY SUM(orders.total_bill) DESC) AS city_rank
    FROM products
    JOIN orders ON products.product_id = orders.product_id
    GROUP BY orders.city, products.brand
)
SELECT city, brand, total_revenue
FROM city_ranks
WHERE city_rank <= 3;

-- 9. Least Orders by State (Bottom 3 by Brand)
CREATE VIEW least_performing_states AS
WITH state_ranks AS (
    SELECT 
        orders.state,
        products.brand,
        SUM(orders.total_bill) AS total_revenue,
        RANK() OVER(PARTITION BY products.brand ORDER BY SUM(orders.total_bill)) AS state_rank
    FROM products
    JOIN orders ON products.product_id = orders.product_id
    GROUP BY orders.state, products.brand
)
SELECT state, brand, total_revenue
FROM state_ranks
WHERE state_rank <= 3;

-- 10. Month-Year Wise Revenue Comparison
CREATE VIEW monthly_yearly_sales_comparison AS
SELECT 
    products.brand, 
    orders.month_name, 
    orders.year, 
    orders.monthno,
    SUM(orders.total_bill) AS total_revenue
FROM products 
JOIN orders ON products.product_id = orders.product_id
GROUP BY products.brand, orders.month_name, orders.year, orders.monthno
ORDER BY orders.year, products.brand, orders.monthno;

-- 11. Total Weekend Sales by Each Brand
CREATE VIEW weekend_sales_by_brand AS
SELECT 
    products.brand,
    SUM(orders.total_bill) AS weekend_total_sales
FROM orders
JOIN products ON orders.product_id = products.product_id
WHERE orders.Day_Name IN ('Saturday', 'Sunday')
GROUP BY products.brand
ORDER BY weekend_total_sales DESC;

-- 12. Repeat Orders Per Brand (Customer who ordered > 3 times)
CREATE VIEW repeat_orders_per_brand AS
SELECT 
    orders.customer_id,
    products.brand,
    COUNT(*) AS order_count
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY orders.customer_id, products.brand
HAVING COUNT(*) > 3;

-- 13. Total Repeat Orders by Brand
CREATE VIEW total_repeat_orders_summary AS
SELECT 
    brand,
    SUM(order_count) AS total_repeat_orders
FROM repeat_orders_per_brand
GROUP BY brand
ORDER BY total_repeat_orders DESC;
