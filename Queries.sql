


-----
----- Abdullah Al-Queashi
----- 01 Sha'ban 1445
----- 10.02.2024
----- This is a small porject for Analysing The Walmart Database
-----



CREATE DATABASE walmart;




use walmart;

select
    *
from
    sales
LIMIT
    500;

-- 1  time_of_day ----------------------------------------------------
SELECT
    time,
    (
        CASE
            WHEN time BETWEEN "00:00:00"
            AND "12:00:00" THEN "Morning"
            WHEN time BETWEEN "12:01:00"
            AND "16:00:00" THEN "Afternoon"
            ELSE "Evening"
        END
    ) AS time_of_day
FROM
    sales;

-- 2  day_name ------------------------------------------------
desc sales;

select
    date
FROM
    sales;

SELECT
    date
from
    sales
WHERE
    DAYNAME(date) = 'Saturday';

SELECT
    `Invoice ID`,
    `City`,
    date,
    CASE
        WHEN DAYNAME(date) = 'Saturday' THEN 'Saturday'
        WHEN DAYNAME(date) = 'Sunday' THEN 'Sunday'
        WHEN DAYNAME(date) = 'Monday' THEN 'Monday'
        WHEN DAYNAME(date) = 'Tuesday' THEN 'Tuesday'
        WHEN DAYNAME(date) = 'Wednesday' THEN 'Wednesday'
        WHEN DAYNAME(date) = 'Thursday' THEN 'Thursday'
        WHEN DAYNAME(date) = 'Friday' THEN 'Friday'
    END as day_name
FROM
    sales;

SELECT
    date,
    DAYNAME(date) AS day_name
FROM
    sales;

SELECT
    *
FROM
    sales;

ALTER TABLE
    sales
ADD
    COLUMN day_name VARCHAR(20);

SELECT
    *
FROM
    sales;

UPDATE
    sales
SET
    day_name = (DAYNAME(date));

UPDATE
    sales
SET
    day_name =(
        CASE
            WHEN DAYNAME(date) = 'Saturday' THEN 'Saturday'
            WHEN DAYNAME(date) = 'Sunday' THEN 'Sunday'
            WHEN DAYNAME(date) = 'Monday' THEN 'Monday'
            WHEN DAYNAME(date) = 'Tuesday' THEN 'Tuesday'
            WHEN DAYNAME(date) = 'Wednesday' THEN 'Wednesday'
            WHEN DAYNAME(date) = 'Thursday' THEN 'Thursday'
            WHEN DAYNAME(date) = 'Friday' THEN 'Friday'
        END
    );

SELECT
    *
FROM
    sales;

-- 3 month_name ----------------------------------------------------------------
select
    date
from
    sales
WHERE
    MONTHNAME(date) = 'January';

SELECT
    date,
    CASE
        WHEN MONTHNAME(date) = 'January' THEN 'January'
        WHEN MONTHNAME(date) = 'February' THEN 'February'
        WHEN MONTHNAME(date) = 'March' THEN 'March'
        WHEN MONTHNAME(date) = 'April' THEN 'April'
        WHEN MONTHNAME(date) = 'May' THEN 'May'
        WHEN MONTHNAME(date) = 'June' THEN 'June'
        WHEN MONTHNAME(date) = 'July' THEN 'July'
        WHEN MONTHNAME(date) = 'August' THEN 'August'
        WHEN MONTHNAME(date) = 'September' THEN 'September'
        WHEN MONTHNAME(date) = 'October' THEN 'October'
        WHEN MONTHNAME(date) = 'November' THEN 'November'
        WHEN MONTHNAME(date) = 'December' THEN 'December'
    END AS month_name
FROM
    sales;

-- Suggestion from Bard (Gemini) new name for Bard -> 8 Feb Jumaa day
-- Did not work!!!!!!!!!!!!!!! Hi Gooooooooooogle!
SELECT
    date,
    EXTRACT(
        MONTH
        FROM
            date
    ) AS month_num,
    CASE
        month_num
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
    END AS month_name
FROM
    sales;

--  Suggestions from ChatGPT !!!!!!
-- Worked!
SELECT
    date,
    MONTHNAME(date) AS month_name
FROM
    sales;

ALTER TABLE
    sales
ADD
    Column month_name VARCHAR(20);

SELECT
    *
from
    sales;

-- ADD COLUMNs in one Clicl to more than 1000 rows!
UPDATE
    sales
SET
    month_name = (MONTHNAME(date));

SELECT
    *
from
    sales;

-- -------------------------------------------
----------4 -> has two questions
-- -------------------------------------------
---------1. How many unique cities does the data have? 
-- ->   Answer:> 3 cites (1.Yangon: 340, 2.Naypyitaw: 328, 3.Mandalay: 332)
desc sales;

SELECT
    city,
    COUNT(`City`) as numOfCities
FROM
    sales
GROUP BY
    `City`;

---------2. In which city is each branch?
----- Answer:> [ A ] [ B ] [ C ] 
------ [ A ] -> Yangon
------ [ B ] -> Mandalay
------ [ C ] -> Naypyitaw
SELECT
    branch,
    city
FROM
    sales
SELECT
    branch,
    city
FROM
    sales
GROUP BY
    `Branch`,
    `City`;

-- -------------------------------------------
-- -------- 5 -> ### Product
-- -------------------------------------------
-- 1. How many unique product lines does the data have?
-- 2. What is the most common payment method?
-- 3. What is the most selling product line?
-- 4. What is the total revenue by month?
-- 5. What month had the largest COGS?
-- 6. What product line had the largest revenue?
-- 7. What is the city with the largest revenue?
-- 8. What product line had the largest VAT?
-- 9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
-- 10. Which branch sold more products than average product sold?
-- 11. What is the most common product line by gender?
-- 12. What is the average rating of each product line?


----------------------------------------------------------------




----------------------- Answers: --------------------------------



-- 1. How many unique product lines does the data have?
-- Answer:

--- I think the answer will be -> 6 unique product lines
--
----  1.Fashion accessories -> 178
----  2.Food and beverages -> 174
----  3.Electronic accessories -> 170
----  4.Sports and travel -> 166
----  5.Home and lifestyle -> 160
----  6.Health and beauty -> 152


desc sales;

select
   Product_line;
from
    sales;

select
   Product_line;
from
    sales
GROUP BY
    Product_line;


SELECT COUNT(Product_line) from sales;


select
   Product_line,
    COUNT(Product_line) AS UniProduct
from
    sales
GROUP BY
   Product_line
ORDER BY
    UniProduct DESC;



-------------- 2. What is the most common payment method?

----- Answer -> Ewallet [ 354 ]:

--- Ewallet -> 345
--- Cash -> 344
--- Credit card -> 311



desc sales;

SELECT
    Payment
from
    sales;

SELECT
    Payment
from
    sales
GROUP BY
    Payment;

SELECT
    Payment,
    COUNT(`Payment`)
from
    sales
GROUP BY
    Payment;


---------------- -- 3. What is the most selling product line?

----- Answer: ->  1.Fashion accessories [ 178 ]


----  1.Fashion accessories -> 178
----  2.Food and beverages -> 174
----  3.Electronic accessories -> 170
----  4.Sports and travel -> 166
----  5.Home and lifestyle -> 160
----  6.Health and beauty -> 152


desc sales;

select
   Product_line
from
    sales;

select
   Product_line
from
    sales
GROUP BY
   Product_line;


select
   Product_line,
    COUNT(Product_line) AS UniProduct
from
    sales
GROUP BY
   Product_line
ORDER BY
    UniProduct DESC;




----- -- 4. What is the total revenue by month?

-- Total revenue by month:
--- 1.January -> 116,291.87
--- 2.March -> 109,455.51
--- February -> 97,219.37


desc sales;


SELECT 
        date,
        month_name,
        Product_line,
        Unit_price,
        Total,
        gross_income,
        gross_margin_percentage,
        cogs
from 
    sales
ORDER BY month_name DESC;


SELECT 
        month_name,
        ROUND(SUM(total) , 2) as Total_revenue
FROM        
    sales
GROUP BY 
    month_name
ORDER BY Total_revenue DESC;





-------------------- 5. What month had the largest COGS?

-- is January -> 110754.16000000002

desc sales;

select
     month_name,
     SUM(cogs) as  cogs
from sales
GROUP BY month_name 
ORDER BY cogs ;



SELECT
	month_name AS month,
	SUM(cogs) AS cogs
FROM sales
GROUP BY month_name 
ORDER BY cogs;



-------





----------- 6. What product line had the largest revenue?

--- Answer: -> Food and beverages -> 56144.844
--- 1.Food and beverages -> 56,144.84
--- 2.Sports and travel -> 55,122.82
--- 3.Electronic accessories -> 54,337.53
--- 4.Fashion accessories -> 54,305.89
--- 5.Home and lifestyle -> 53,861.91
--- 6.Health and beauty -> 49,193.73


desc sales;


ALTER TABLE sales RENAME COLUMN  `Product line` To Product_line;
ALTER TABLE sales RENAME COLUMN  `customer type` To customer_type;

ALTER TABLE sales RENAME COLUMN  `Unit price` To Unit_price;

ALTER TABLE sales RENAME COLUMN  `invoice id` To invoice_id;

ALTER TABLE sales RENAME COLUMN  `Tax 5%` To tax_5;

ALTER TABLE sales RENAME COLUMN  `gross margin percentage` To gross_margin_percentage;

ALTER TABLE sales RENAME COLUMN  `gross income` To gross_income;


select
    product_line,
    ROUND(SUM(total), 3) AS total_product_revenue 
from sales
GROUP BY  Product_line
ORDER BY total_product_revenue DESC;







------- 7. What is the city with the largest revenue?

--- Answer -> Naypyitaw -> VAT: 5265.1765
----- 1. Naypyitaw -> 5265.1765
----- 2. Yangon -> 5057.1605
----- 3. Mandalay -> 5057.0320


desc sales;

select 
    branch,
    city,
    SUM(total) as VAT
from sales
GROUP BY city, branch
ORDER By VAT ;



---------------



------- 8. What product line had the largest VAT?
--- Largest VAT -> Food and beverages : 2673.564

---1. Food and beverages : 2673.564
---2. Sports and travel : 2624.896
---3. Electronic accessories : 2587.502
---4. Fashion accessories : 2585.995
---5. Home and lifestyle : 2564.853
---6. Health and beauty : 2342.559



desc sales;


SELECT 
    product_line,
    ROUND(AVG(tax_5), 3) as large_vat
FROM sales
GROUP BY  product_line
ORDER BY large_vat DESC;




---------------9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales


desc sales;


-- Solution
SELECT 
	AVG(quantity) AS avg_qnty
FROM sales;

SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM sales
GROUP BY product_line;

-- End

SELECT product_line, unit_price, total FROM sales;

select 
    product_line,
    ROUND(AVG(unit_price), 3) as avg
FROM sales
GROUP BY product_line
ORDER BY avg DESC;




-- ------------------------- 10. Which branch sold more products than average product sold?
SELECT 
	branch, 
    SUM(quantity) AS qnty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);


-- ------------------------------- 11.What is the most common product line by gender
SELECT
	gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM sales
GROUP BY gender, product_line
ORDER BY total_cnt DESC;

-- -----------------------12. What is the average rating of each product line
SELECT
	ROUND(AVG(rating), 2) as avg_rating,
    product_line
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;




----------------------------------------------------------------
----------------------------------------------------------------

-- ### Customer

-- 1. How many unique customer types does the data have?
-- 2. How many unique payment methods does the data have?
-- 3. What is the most common customer type?
-- 4. Which customer type buys the most?
-- 5. What is the gender of most of the customers?
-- 6. What is the gender distribution per branch?
-- 7. Which time of the day do customers give most ratings?
-- 8. Which time of the day do customers give most ratings per branch?
-- 9. Which day fo the week has the best avg ratings?
-- 10. Which day of the week has the best average ratings per branch?

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------



-- How many unique customer types does the data have?
SELECT
	DISTINCT customer_type
FROM sales;

-- How many unique payment methods does the data have?
SELECT
	DISTINCT payment
FROM sales;


-- What is the most common customer type?
SELECT
	customer_type,
	count(*) as count
FROM sales
GROUP BY customer_type
ORDER BY count DESC;

-- Which customer type buys the most?
SELECT
	customer_type,
    COUNT(*)
FROM sales
GROUP BY customer_type;


-- What is the gender of most of the customers?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM sales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- What is the gender distribution per branch?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM sales
WHERE branch = "C"
GROUP BY gender
ORDER BY gender_cnt DESC;
-- Gender per branch is more or less the same hence, I don't think has
-- an effect of the sales per branch and other factors.

-- Which time of the day do customers give most ratings?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;
-- Looks like time of the day does not really affect the rating, its
-- more or less the same rating each time of the day.alter


-- Which time of the day do customers give most ratings per branch?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
WHERE branch = "A"
GROUP BY time_of_day
ORDER BY avg_rating DESC;
-- Branch A and C are doing well in ratings, branch B needs to do a 
-- little more to get better ratings.


-- Which day fo the week has the best avg ratings?
SELECT
	day_name,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name 
ORDER BY avg_rating DESC;
-- Mon, Tue and Friday are the top best days for good ratings
-- why is that the case, how many sales are made on these days?



-- Which day of the week has the best average ratings per branch?
SELECT 
	day_name,
	COUNT(day_name) total_sales
FROM sales
WHERE branch = "C"
GROUP BY day_name
ORDER BY total_sales DESC;


-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

-- ### Sales

-- 1. Number of sales made in each time of the day per weekday
-- 2. Which of the customer types brings the most revenue?
-- 3. Which city has the largest tax percent/ VAT (**Value Added Tax**)?
-- 4. Which customer type pays the most in VAT?

-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

-- Number of sales made in each time of the day per weekday 
SELECT
	time_of_day,
	COUNT(*) AS total_sales
FROM sales
WHERE day_name = "Sunday"
GROUP BY time_of_day 
ORDER BY total_sales DESC;
-- Evenings experience most sales, the stores are 
-- filled during the evening hours

-- Which of the customer types brings the most revenue?
SELECT
	customer_type,
	SUM(total) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue;

-- Which city has the largest tax/VAT percent?
SELECT
	city,
    ROUND(AVG(tax_pct), 2) AS avg_tax_pct
FROM sales
GROUP BY city 
ORDER BY avg_tax_pct DESC;

-- Which customer type pays the most in VAT?
SELECT
	customer_type,
	AVG(tax_pct) AS total_tax
FROM sales
GROUP BY customer_type
ORDER BY total_tax;

-- --------------------------------------------------------------------
-- --------------------------------------------------------------------








