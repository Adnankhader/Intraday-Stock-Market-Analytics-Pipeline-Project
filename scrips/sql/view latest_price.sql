create view latest_price as 

with q1 as (
    select *,
        row_number() over(partition by trade_date, symbol order by trade_time desc) AS rnk,
        sum(volume) over(partition by trade_date, symbol order by trade_time desc) as total_volume
    from intraday_base
)
select
    trade_date,
    symbol,
    [close] AS latest_price,
    total_volume
from q1
where rnk = 1

