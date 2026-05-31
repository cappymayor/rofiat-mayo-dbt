select
    customer_id::int as customer_id,
    trim(first_name)::varchar as first_name,
    trim(last_name)::varchar as last_name,
    lower(trim(email))::varchar as email,
    to_timestamp_ntz(created_at) as customer_signup_at
from {{ source('ecommerce', 'customers') }}