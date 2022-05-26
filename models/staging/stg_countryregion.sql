with source as (
select
    countryregioncode,
    name,
    --modifieddate
from {{ source('IndiciumDataset', 'countryregion') }}
)

select * from source