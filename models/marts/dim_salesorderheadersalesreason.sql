with salesreasonT as (
    select
        salesreasonid,
        name,
        reasontype
    from {{ref('stg_salesreason')}}
),

salesorderheadersalesreasonT as (
    select
	    row_number() over (order by salesorderheadersalesreason.salesorderid) as salesorderheadersalesreason_sk,
        salesorderid,
        salesreasonT.name as salesreasonname,
        salesreasonT.reasontype as salesreasontype
    from {{ref('stg_salesorderheadersalesreason')}} as salesorderheadersalesreason
    left join salesreasonT on
        salesorderheadersalesreason.salesreasonid = salesreasonT.salesreasonid
)

select * from salesorderheadersalesreasonT