with source as (
select
    salesorderid,
    salesreasonid
    --modifieddate
from {{ source('IndiciumDataset', 'salesorderheadersalesreason') }}
)

select * from source