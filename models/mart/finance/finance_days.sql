SELECT
date_date,
COUNT (orders_id) AS total_number_of_transactions,
SUM (revenue) AS total_revenue,
SAFE_DIVIDE (SUM (revenue), count(orders_id))AS average_basket,
SUM (operational_margin) AS operational_margin,
SUM (purchase_cost) AS total_purchase_cost,
SUM (shipping_fee) AS total_shipping_fees,
SUM (logcost) AS total_log_costs,
SUM (quantity) AS quantity_of_products_sold
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
ORDER BY date_date DESC
