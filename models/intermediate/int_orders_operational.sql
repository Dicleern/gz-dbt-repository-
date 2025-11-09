SELECT
	o.orders_id
	,o.date_date
	,o.quantity
	,o.revenue
	,o.purchase_cost
	,o.margin
	,cast(s.shipping_fee as FLOAT64) as shipping_fee
	,cast(logcost as FLOAT64) as logcost
	,cast(ship_cost as FLOAT64) as ship_cost
    ,ROUND
     (cast(o.margin as FLOAT64) 
     +cast(s.shipping_fee as FLOAT64)  
     -cast(logcost as FLOAT64)  + cast(ship_cost as FLOAT64) ,2) AS operational_margin
FROM {{ref("int_orders_margin")}} o
LEFT JOIN {{ref("stg_raw_gz__ship")}} s
	USING(orders_id)
ORDER BY orders_id desc