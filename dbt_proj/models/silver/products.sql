select
    product_id::int as product_id,
    trim(product_name)::varchar as product_name,
    trim(category)::varchar as category,
    price::number(10,2) as price
from {{ source('ecommerce', 'products') }}