with stateprovinceT as (
    select
        stateprovinceid,
        stateprovincecode,
        countryregioncode,
        name
    from {{ref('stg_stateprovince')}}
),

countryregionT as (
    select
        countryregioncode,
        name
    from {{ref('stg_countryregion')}}
),

addressT as (
    select
        row_number() over (order by addressid) as address_sk,
        addressid,
        city,
        stateprovinceT.stateprovincecode as stateprovincecode,
        stateprovinceT.name as statename,
        stateprovinceT.countryregioncode,
        countryregionT.name as countryregionname
    from {{ref('stg_address')}} as address
    left join stateprovinceT on
        address.stateprovinceid = stateprovinceT.stateprovinceid
    left join countryregionT on
        stateprovinceT.countryregioncode = countryregionT.countryregioncode
) 

select * from addressT