with source as (
select
    creditcardid,
    cardtype
    --cardnumber,
    --expmonth,
    --expyear,
    --modifieddate
from {{ source('IndiciumDataset', 'creditcard') }}
)

select * from source