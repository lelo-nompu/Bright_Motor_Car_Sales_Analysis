-- 1. View the first 10 records --

SELECT *
FROM bright_motors_car_sales
LIMIT 10;

-- 2. Count total records in the dataset --

SELECT 
  COUNT(*) AS total_records
FROM bright_motors_car_sales;


-- 3. Check for missing values in important columns

SELECT
  COUNT(*) AS total_rows,

  SUM(CASE 
        WHEN make IS NULL OR make = '' THEN 1 
        ELSE 0 
      END) AS missing_make,

  SUM(CASE 
        WHEN model IS NULL OR model = '' THEN 1 
        ELSE 0 
      END) AS missing_model,

  SUM(CASE 
        WHEN state IS NULL OR state = '' THEN 1 
        ELSE 0 
      END) AS missing_state,

  SUM(CASE 
        WHEN sellingprice IS NULL THEN 1 
        ELSE 0 
      END) AS missing_selling_price,

  SUM(CASE 
        WHEN odometer IS NULL THEN 1 
        ELSE 0 
      END) AS missing_odometer

FROM bright_motors_car_sales;



-- 4. Top car makes by number of cars sold

SELECT
  COALESCE(NULLIF(make, ''), 'Unknown') AS make,
  COUNT(*) AS total_sales
FROM bright_motors_car_sales
GROUP BY COALESCE(NULLIF(make, ''), 'Unknown')
ORDER BY total_sales DESC;



-- 5. Top car makes by total sales value

SELECT
  COALESCE(NULLIF(make, ''), 'Unknown') AS make,
  COUNT(*) AS total_sales,
  SUM(sellingprice) AS total_sales_value,
  AVG(sellingprice) AS average_selling_price
FROM bright_motors_car_sales
WHERE sellingprice IS NOT NULL
GROUP BY COALESCE(NULLIF(make, ''), 'Unknown')
ORDER BY total_sales_value DESC;



-- 6. Top car models by total sales value

SELECT
  COALESCE(NULLIF(make, ''), 'Unknown') AS make,
  COALESCE(NULLIF(model, ''), 'Unknown') AS model,
  COUNT(*) AS total_sales,
  SUM(sellingprice) AS total_sales_value,
  AVG(sellingprice) AS average_selling_price
FROM bright_motors_car_sales
WHERE sellingprice IS NOT NULL
GROUP BY 
  COALESCE(NULLIF(make, ''), 'Unknown'),
  COALESCE(NULLIF(model, ''), 'Unknown')
ORDER BY total_sales_value DESC
LIMIT 10;



-- 7. Regional performance by state

SELECT
  COALESCE(NULLIF(state, ''), 'Unknown') AS state,
  COUNT(*) AS total_sales,
  SUM(sellingprice) AS total_sales_value,
  AVG(sellingprice) AS average_selling_price
FROM bright_motors_car_sales
WHERE sellingprice IS NOT NULL
GROUP BY COALESCE(NULLIF(state, ''), 'Unknown')
ORDER BY total_sales DESC;



-- 8. Average selling price by car year

SELECT
  year AS car_year,
  COUNT(*) AS total_sales,
  AVG(sellingprice) AS average_selling_price
FROM bright_motors_car_sales
WHERE sellingprice IS NOT NULL
AND year IS NOT NULL
GROUP BY year
ORDER BY year;



-- 9. Relationship between mileage and selling price --

SELECT
  odometer,
  sellingprice
FROM bright_motors_car_sales
WHERE odometer IS NOT NULL
AND sellingprice IS NOT NULL;



-- 10. Average selling price by mileage range

SELECT
  CASE
    WHEN odometer < 50000 THEN 'Low Mileage: Under 50,000'
    WHEN odometer >= 50000 AND odometer < 100000 THEN 'Medium Mileage: 50,000 - 99,999'
    WHEN odometer >= 100000 AND odometer < 150000 THEN 'High Mileage: 100,000 - 149,999'
    ELSE 'Very High Mileage: 150,000+'
  END AS mileage_category,
  COUNT(*) AS total_sales,
  AVG(sellingprice) AS average_selling_price
FROM bright_motors_car_sales
WHERE odometer IS NOT NULL
AND sellingprice IS NOT NULL
GROUP BY 
  CASE
    WHEN odometer < 50000 THEN 'Low Mileage: Under 50,000'
    WHEN odometer >= 50000 AND odometer < 100000 THEN 'Medium Mileage: 50,000 - 99,999'
    WHEN odometer >= 100000 AND odometer < 150000 THEN 'High Mileage: 100,000 - 149,999'
    ELSE 'Very High Mileage: 150,000+'
  END
ORDER BY average_selling_price DESC;



-- 11. Sales by body type

SELECT
  COALESCE(NULLIF(body, ''), 'Unknown') AS body_type,
  COUNT(*) AS total_sales,
  AVG(sellingprice) AS average_selling_price
FROM bright_motors_car_sales
WHERE sellingprice IS NOT NULL
GROUP BY COALESCE(NULLIF(body, ''), 'Unknown')
ORDER BY total_sales DESC;



-- 12. Sales by transmission type

SELECT
  COALESCE(NULLIF(transmission, ''), 'Unknown') AS transmission_type,
  COUNT(*) AS total_sales,
  AVG(sellingprice) AS average_selling_price
FROM bright_motors_car_sales
WHERE sellingprice IS NOT NULL
GROUP BY COALESCE(NULLIF(transmission, ''), 'Unknown')
ORDER BY total_sales DESC;



-- 13. Seller performance

SELECT
  COALESCE(NULLIF(seller, ''), 'Unknown') AS seller,
  COUNT(*) AS total_sales,
  SUM(sellingprice) AS total_sales_value,
  AVG(sellingprice) AS average_selling_price
FROM bright_motors_car_sales
WHERE sellingprice IS NOT NULL
GROUP BY COALESCE(NULLIF(seller, ''), 'Unknown')
ORDER BY total_sales_value DESC
LIMIT 10;



-- 14. Price performance compared to market value. MMR is used as the estimated market value --

SELECT
  CASE
    WHEN sellingprice > mmr THEN 'Sold Above Market Value'
    WHEN sellingprice = mmr THEN 'Sold At Market Value'
    WHEN sellingprice < mmr THEN 'Sold Below Market Value'
    ELSE 'Unknown'
  END AS price_performance,
  COUNT(*) AS total_sales,
  AVG(sellingprice) AS average_selling_price,
  AVG(mmr) AS average_market_value
FROM bright_motors_car_sales
WHERE sellingprice IS NOT NULL
AND mmr IS NOT NULL
GROUP BY 
  CASE
    WHEN sellingprice > mmr THEN 'Sold Above Market Value'
    WHEN sellingprice = mmr THEN 'Sold At Market Value'
    WHEN sellingprice < mmr THEN 'Sold Below Market Value'
    ELSE 'Unknown'
  END
ORDER BY total_sales DESC;



-- 15. Sales performance by vehicle condition

SELECT
  condition AS vehicle_condition,
  COUNT(*) AS total_sales,
  AVG(sellingprice) AS average_selling_price
FROM bright_motors_car_sales
WHERE condition IS NOT NULL
AND sellingprice IS NOT NULL
GROUP BY condition
ORDER BY vehicle_condition DESC;

-- Final export query for Excel dashboard --

SELECT
  year AS car_year,

  COALESCE(NULLIF(make, ''), 'Unknown') AS make,
  COALESCE(NULLIF(model, ''), 'Unknown') AS model,
  COALESCE(NULLIF(body, ''), 'Unknown') AS body_type,
  COALESCE(NULLIF(transmission, ''), 'Unknown') AS transmission,
  COALESCE(NULLIF(state, ''), 'Unknown') AS state,
  COALESCE(NULLIF(seller, ''), 'Unknown') AS seller,

  odometer,
  condition AS vehicle_condition,

  sellingprice AS selling_price,
  sellingprice AS total_revenue,
  mmr AS market_value,

  (sellingprice - mmr) AS price_difference,

  CASE
    WHEN mmr IS NULL OR sellingprice IS NULL THEN 'Unknown'
    WHEN sellingprice > mmr THEN 'Above Market'
    WHEN sellingprice = mmr THEN 'At Market'
    WHEN sellingprice < mmr THEN 'Below Market'
    ELSE 'Unknown'
  END AS price_category,

  CASE
    WHEN mmr IS NULL OR sellingprice IS NULL THEN 'Unknown'
    WHEN sellingprice > mmr THEN 'High Margin'
    WHEN sellingprice = mmr THEN 'Medium Margin'
    WHEN sellingprice < mmr THEN 'Low Margin'
    ELSE 'Unknown'
  END AS performance_tier,

  CASE
    WHEN odometer IS NULL THEN 'Unknown'
    WHEN odometer < 50000 THEN 'Low Mileage'
    WHEN odometer >= 50000 AND odometer < 100000 THEN 'Medium Mileage'
    WHEN odometer >= 100000 AND odometer < 150000 THEN 'High Mileage'
    ELSE 'Very High Mileage'
  END AS mileage_category

FROM bright_motors_car_sales
WHERE sellingprice IS NOT NULL;
