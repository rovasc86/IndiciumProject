with source as (
select
    businessentityid,
    --persontype,
    --namestyle,
    --title,
    firstname,
    --middlename,
    lastname,
    --suffix,
    --emailpromotion,
    --additionalcontactinfo,
    --demographics
    --rowguid,
    --modifieddate
from {{ source('IndiciumDataset', 'person') }}
)

select * from source