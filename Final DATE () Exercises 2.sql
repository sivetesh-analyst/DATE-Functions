-- Databricks notebook source
SELECT* FROM datesexercise.dateschema.orders;

--Q1: Return each order with the day name of the order date.
SELECT order_id, customer_id, order_date, DAYNAME(order_date) AS day_name
FROM datesexercise.dateschema.orders;

--Q2:Return each customer with the name of the month in which they signed up.
SELECT customer_id, customer_name, signup_date, MONTHNAME(signup_date) AS signup_month_name
FROM datesexercise.dateschema.customer_signups;

--Q3:Return each sale with the month number extracted from sale_date.
SELECT sale_id, product_name, sale_date, MONTH(sale_date) AS sale_month
FROM datesexercise.dateschema.sales; 

--Q4:Return each transaction with the year extracted from transaction_date.
SELECT transaction_id, customer_id, transaction_date, YEAR(transaction_date) AS transaction_year
FROM datesexercise.dateschema.transactions;

--Q5:Return each delivery with the day of the month extracted from delivery_date.
SELECT delivery_id, customer_id, delivery_date, DAY(delivery_date) AS day_of_month
FROM datesexercise.dateschema.deliveries;

--Q6:Return all employees and add a column showing today's date.
SELECT employee_id, employee_name,department, CURRENT_DATE() AS today_date
FROM datesexercise.dateschema.employees;

--Q7:Convert the order_date_text string column into a proper date column.
SELECT order_id, customer_id, order_date_text, TO_DATE(order_date_text, 'YYYY-MM-DD') AS order_date
FROM datesexercise.dateschema.`online-orders`;

--Q8: Format payment_date as a text string in the format YYYY-MM-DD.
SELECT payment_id, customer_id, payment_date, DATE_FORMAT(payment_date, 'yyyy-mm-dd') AS formatted_payment_date
FROM datesexercise.dateschema.payment_dates;

--Q9:Calculate how many days have passed since each customer's last purchase. Use today's date.
SELECT customer_id, customer_name, last_purchase_date, DATEDIFF(CURRENT_DATE(), last_purchase_date) AS days_since_last_purchase
FROM datesexercise.dateschema.customer_purchases;

--Q10:Calculate the expected delivery date by adding 7 days to the order_date.
SELECT order_id, customer_id, order_date, order_date + INTERVAL '7 day' AS expected_delivery_date
FROM datesexercise.dateschema.shipping_orders;

--Q11: Extract the year, month number, and day from booking_date into three separate columns.
SELECT booking_id, customer_id, booking_date, YEAR(booking_date)AS booking_year, MONTH(booking_date) AS booking_month, DAY(booking_date) AS booking_day
FROM datesexercise.dateschema.bookings;

--Q12: Return only orders from the year 2026.
SELECT order_id, customer_id, order_date, YEAR(order_date) AS order_year, amount
FROM datesexercise.dateschema.yearly_orders
WHERE order_date >'2025-12-31'; 

--Q13: Return only orders placed in March (month number 3).
SELECT order_id, customer_id, order_date, MONTH(order_date) AS order_month, amount
FROM datesexercise.dateschema.monthly_orders
WHERE MONTH(order_date) =3;

--Q14:Return the last day of the month for each subscription start date.
SELECT subscription_id, customer_id, start_date, LAST_DAY(start_date) AS month_end_date
FROM datesexercise.dateschema.subscriptions;

--Q15: Return the first day of the month for each campaign send date.
SELECT send_id, customer_id,send_date, DATE_TRUNC('MONTH', send_date) AS month_start_date
FROM datesexercise.dateschema.campaign_sends;

--Q16:Format invoice_date as a text string showing month name and year. Example: January 2026.
SELECT invoice_id,customer_id, invoice_date, DATE_FORMAT(invoice_date, 'MMMM yyyy') AS invoice_month_year 
FROM datesexercise.dateschema.invoice_dates;

--Q17:Calculate each customer's age in years using their date of birth and today's date.
SELECT customer_id, customer_name, date_of_birth, YEAR(CURRENT_DATE()) - YEAR(date_of_birth) AS customer_age
FROM datesexercise.dateschema.customer_birthdays;

--Q18: Classify each order as Weekend or Weekday based on the day name of the order date.
SELECT order_id, customer_id, order_date, DAYNAME(order_date) AS day_name,
       CASE 
           WHEN DAYNAME(order_date) IN ('Saturday', 'Sunday') THEN 'weekend'
           ELSE 'weekday'
       END AS day_type
FROM datesexercise.dateschema.weekend_orders;

--Q19: Extract the quarter number from each transaction date.
SELECT transaction_id, customer_id, transaction_date, QUARTER(transaction_date) AS transaction_quarter, amount
FROM datesexercise.dateschema.quarterly_transactions;

--Q20: Return only orders that are more than 30 days old from today. Calculate days_since_order using today's date.
SELECT order_id, customer_id,order_date, DATEDIFF(CURRENT_DATE(),order_date) AS days_since_order, amount
FROM datesexercise.dateschema.recent_orders
WHERE DATEDIFF(CURRENT_DATE(),order_date) >30;

--BONUS CHALLENGE: Calculate days_since_last_purchase for each customer using CURRENT_DATE. Then use CASE to classify: ≤ 30 days = Active Customer, 31–90 days = At Risk Customer, > 90 days = Inactive Customer.
