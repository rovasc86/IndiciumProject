with source as (
select
    salesreasonid,
    name,
    reasontype
    --modifieddate
from {{ source('IndiciumDataset', 'salesreason') }}
)

select * from source