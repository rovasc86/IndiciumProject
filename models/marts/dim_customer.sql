with personT as (
    select
        businessentityid,
        firstname,
        lastname
    from {{ref('stg_person')}}
),

customerT as (
    select
        row_number() over (order by customerid) as customer_sk,
        customerid,
        customer.personid,
        personT.firstname,
        personT.lastname,
        concat(trim(personT.firstname),' ',trim(personT.lastname)) as fullname,
    from {{ref('stg_customer')}} as customer
    left join personT on
        customer.personid = personT.businessentityid
)

select * from customerT


