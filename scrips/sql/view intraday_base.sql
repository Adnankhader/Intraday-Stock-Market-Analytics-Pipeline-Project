create view intraday_base as (
select
    * 
from(
    select
        imd.datetime,
        cast(imd.datetime as date) as trade_date,
        cast(imd.datetime as time(0)) as trade_time,
        imd.symbol,
        sm.name as stock_name,
        sm.sector as sector,
        imd.[open],
        imd.[high],
        imd.[low],
        imd.[close],
        imd.volume
    from intraday_market_data imd
    join stock_metadata sm
        on imd.symbol = sm.symbol
)t where cast([datetime] as date) in (select max(cast([datetime] as date)) from intraday_market_data)

)

