with source as (
select
    customerid,
    personid
    --storeid,
    --territoryid,
    --rowguid,
    --modifieddate
from {{ source('IndiciumDataset', 'customer') }}
)

select * from source