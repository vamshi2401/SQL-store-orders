SELECT * FROM orders;

-- Total Sales, Profit, and Quantity
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity
FROM orders;

-- Average, Minimum, and Maximum Values for Sales, Profit, and Quantity
SELECT
    AVG(sales) AS average_sales,
    MIN(sales) AS min_sales,
    MAX(sales) AS max_sales,
    AVG(profit) AS average_profit,
    MIN(profit) AS min_profit,
    MAX(profit) AS max_profit,
    AVG(quantity) AS average_quantity,
    MIN(quantity) AS min_quantity,
    MAX(quantity) AS max_quantity
FROM orders;

-- Temporal Analysis - Sales, Profit, and Quantity Trends by Quarter
SELECT
    YEAR(order_date) AS order_year,
    QUARTER(order_date) AS order_quarter,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity
FROM orders
GROUP BY order_year, order_quarter
ORDER BY order_year, order_quarter;



-- Top-Selling Categories and Sub-Categories
SELECT
    category,
    sub_category,
    SUM(sales) AS total_sales
FROM orders
GROUP BY category, sub_category
ORDER BY total_sales DESC;

-- Most Profitable Categories and Sub-Categories
SELECT
    category,
    sub_category,
    SUM(profit) AS total_profit
FROM orders
GROUP BY category, sub_category
ORDER BY total_profit DESC;

-- Sales and Profit by Region
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_profit DESC;

-- Most Valuable Customer Segments
SELECT
    segment,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM orders
GROUP BY segment
ORDER BY total_profit DESC;

-- Most Profitable and Top-Selling Products
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM orders
GROUP BY product_name
ORDER BY total_profit DESC, total_sales DESC;

-- Impact of Discounts on Sales and Profit
SELECT
    discount,
    AVG(sales) AS average_sales,
    AVG(profit) AS average_profit
FROM orders
GROUP BY discount
ORDER BY discount DESC;


-- Shipping Costs and Their Impact on Profit
SELECT
    ship_mode,
    AVG(shipping_cost) AS avg_shipping_cost,
    AVG(profit) AS average_profit
FROM orders
GROUP BY ship_mode
ORDER BY avg_shipping_cost DESC;

-- Distribution of Order Priorities
SELECT
    order_priority,
    AVG(sales) AS avg_sales,
    AVG(profit) AS avg_profit,
    COUNT(distinct order_id) AS order_count
FROM orders
GROUP BY order_priority
ORDER BY order_priority;

-- Top Customers Based on Total Sales
SELECT
    customer_name,
    SUM(sales) AS total_sales
FROM orders
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10; 

-- Top Customers Based on Total Profit
SELECT
    customer_name,
    SUM(profit) AS total_profit
FROM orders
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10; -- Adjust the limit as needed

-- Analyze Customer Buying Patterns
SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    AVG(sales) AS average_sales_per_order
FROM orders
GROUP BY customer_name
ORDER BY total_orders DESC
LIMIT 10;



