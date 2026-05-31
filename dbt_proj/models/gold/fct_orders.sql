select
    o.order_id,
    o.customer_id,
    o.ordered_at,
    o.order_status,
    p.product_name,
    p.category as product_category,
    o.quantity,
    (o.quantity * p.price)::number(10,2) as gross_revenue,
    case 
        when pay.payment_status = 'success' then (o.quantity * p.price)
        else 0.00 
    end::number(10,2) as net_revenue,
    coalesce(pay.payment_method, 'none') as payment_method
from {{ ref('orders') }} o
left join {{ ref('products') }} p on o.product_id = p.product_id
left join {{ ref('payments') }} pay on o.order_id = pay.order_id