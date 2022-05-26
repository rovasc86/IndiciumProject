with source as (
select
    addressid,
    --addressline1,
    --addressline2,
    city,
    stateprovinceid
    --postalcode,
    --spatiallocation,
    --rowguid,
   -- modifieddate
from {{ source('IndiciumDataset', 'address') }}
)

select * from source




