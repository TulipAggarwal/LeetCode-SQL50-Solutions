# Write your MySQL query statement below
SELECT p.product_id,
IFNULL(ROUND(SUM(p.price*pp.units)/SUM(pp.units),2),0) as average_price
FROM prices p LEFT JOIN unitssold pp
ON p.product_id = pp.product_id
AND pp.purchase_date BETWEEN p.start_date AND  p.end_date
GROUP BY p.product_id
