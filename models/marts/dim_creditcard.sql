with creditcardT as (
    select
        row_number() over (order by creditcardid) as creditcard_sk,
        creditcardid,
        cardtype
    from {{ref('stg_creditcard')}}
)

select * from creditcardT