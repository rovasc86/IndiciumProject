with source as (
select
    stateprovinceid,
    stateprovincecode,
    countryregioncode,
    --isonlystateprovinceflag,
    name
    --territoryid
    --rowguid,
    --modifieddate
from {{ source('IndiciumDataset', 'stateprovince') }}
)

select * from source