select
 s.date_date,
 s.products_id,
 s.revenue,
 s.quantity,
 p.purchase_price,
 round(s.quantity*p.purchase_price,2) as purchase_cost,
 round(s.revenue-(s.quantity*p.purchase_price),2) as margin 
 from {{ref("stg_raw_gz__sales")}} s
 left join {{ref("stg_raw_gz__product")}} p
on s.products_id = p.products_id
