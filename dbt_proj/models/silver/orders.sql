select
    order_id::int as order_id,
    customer_id::int as customer_id,
    product_id::int as product_id,
    quantity::int as quantity,
    lower(trim(status))::varchar as order_status,
    to_timestamp_ntz(order_date) as ordered_at
from {{ source('ecommerce', 'orders') }}