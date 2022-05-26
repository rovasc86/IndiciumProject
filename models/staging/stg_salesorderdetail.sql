with source as (
select
    salesorderid,
    salesorderdetailid,
    --carriertrackingnumber,
    orderqty,
    productid,
    --specialofferid,
    unitprice,
    unitpricediscount
    --rowguid,
    --modifieddate
from {{ source('IndiciumDataset', 'salesorderdetail') }}
)

select * from source