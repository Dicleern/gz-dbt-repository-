with totals as (
 select 
 date_date,
 count(orders_id) as total_transactions,
 round(sum(revenue),0) as total_revenue,
 round(sum(margin),0) total_margin,
 round(sum(operational_margin),0) as total_operational_margin,
 round(sum(purchase_cost),0) as total_purc_cost,
 round(sum(shipping_fee),0) as total_shipping_cost,
 round(sum(ship_cost),0) as ship_cost,
 round(sum(logcost),0) as total_logcost,
 round(sum(quantity),0) as total_quantity
from {{ref("int_orders_operational")}}
group by date_date
) 
select
 date_date,
 total_transactions,
 total_revenue,
 total_margin,
 total_operational_margin,
 total_purc_cost,
 total_shipping_cost,
 round((total_logcost + ship_cost),0) as total_logistic_cost,
 total_quantity,
 round((total_revenue/NULLIF(total_transactions),0),0) as avg_basket
 from totals
 order by date_date desc