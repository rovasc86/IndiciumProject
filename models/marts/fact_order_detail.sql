with product as (
    select *
    from {{ref('dim_product')}}
),

address as (
    select *
    from {{ref('dim_address')}}
),

creditcard as (
    select *
    from {{ref('dim_creditcard')}}
),

customer as (
    select *
    from {{ref('dim_customer')}}
),

salesorderheadersalesreason as (
    select *
    from {{ref('dim_salesorderheadersalesreason')}}
),

salesorderheader_with_sk as (
    select
        salesorderheader.salesorderid,
        address.address_sk as address_fk,
        customer.customer_sk as customer_fk,
        creditcard.creditcard_sk as creditcard_fk,
        salesorderheadersalesreason.salesorderheadersalesreason_sk as salesorderheadersalesreason_fk,
        salesorderheader.orderdate,
        salesorderheader.status,
        salesorderheader.subtotal,
        salesorderheader.taxamt,
        salesorderheader.freight,
        salesorderheader.totaldue
    from {{ref('stg_salesorderheader')}} as salesorderheader
    left join address on
        salesorderheader.shiptoaddressid = address.addressid
    left join creditcard on
        salesorderheader.creditcardid = creditcard.creditcardid
    left join customer on
        salesorderheader.customerid = customer.customerid
    left join salesorderheadersalesreason on
        salesorderheader.salesorderid = salesorderheadersalesreason.salesorderid
),

salesorderdetail_with_sk as (
    select
        salesorderid,
        product.product_sk as product_fk,
        salesorderdetail.orderqty,
        salesorderdetail.unitprice,
        salesorderdetail.unitpricediscount
    from {{ref('stg_salesorderdetail')}} as salesorderdetail
    left join product on
        salesorderdetail.productid = product.productid
),

final as (
    select
        salesorderheader_with_sk.salesorderid,
        salesorderheader_with_sk.address_fk,
        salesorderheader_with_sk.customer_fk,
        salesorderheader_with_sk.creditcard_fk,
        salesorderheader_with_sk.salesorderheadersalesreason_fk,
        salesorderheader_with_sk.orderdate,
        salesorderheader_with_sk.status,
        salesorderheader_with_sk.subtotal,
        salesorderheader_with_sk.taxamt,
        salesorderheader_with_sk.freight,
        salesorderheader_with_sk.totaldue,
        salesorderdetail_with_sk.product_fk,
        salesorderdetail_with_sk.orderqty,
        salesorderdetail_with_sk.unitprice,
        salesorderdetail_with_sk.unitpricediscount,
    from salesorderheader_with_sk
    left join salesorderdetail_with_sk on
        salesorderheader_with_sk.salesorderid = salesorderdetail_with_sk.salesorderid
)

select * from final