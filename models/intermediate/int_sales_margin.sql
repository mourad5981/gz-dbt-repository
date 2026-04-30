SELECT *,
s.quantity * p.purchase_price AS purchase_cost,
s.revenue - (s.quantity * p.purchase_price) AS margin
from {{ ref('stg_gz_raw_data__raw_gz_sales') }} AS s
left join {{ ref('stg_gz_raw_data__raw_gz_product') }} AS p
USING (products_id)

