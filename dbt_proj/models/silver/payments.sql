select
    payment_id::int as payment_id,
    order_id::int as order_id,
    lower(trim(payment_method))::varchar as payment_method,
    amount::number(10,2) as payment_amount,
    lower(trim(payment_status))::varchar as payment_status,
    to_timestamp_ntz(created_at) as payment_processed_at
from {{ source('ecommerce', 'payments') }}