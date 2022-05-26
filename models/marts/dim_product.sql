with productT as (
        select
            row_number() over (order by productid) as product_sk,
            productid,
            name
    from {{ref('stg_product')}}
)

select * from productT