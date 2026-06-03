with customer_orders as (
    select
        customer_id,
        min(ordered_at) as first_order_datessssss,
        max(ordered_at) as most_recent_order_date,
        count(distinct order_id) as total_orders,
        sum(net_revenue) as lifetime_value
    from {{ ref('fct_orders') }}
    group by 1
)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.customer_signup_at,
    coalesce(co.total_orders, 0) as total_orders,
    coalesce(co.lifetime_value, 0.00)::number(10,2) as lifetime_value,
    co.first_order_datessssss,
    co.most_recent_order_date,
    case 
        when co.total_orders > 0 then true 
        else false 
    end as is_active_customer
from {{ ref('customers') }} c
left join customer_orders co on c.customer_id = co.customer_id