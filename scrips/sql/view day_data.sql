create view day_data as 

with q1 as (
	select
		*,
		first_value([open]) over(partition by trade_date,symbol order by trade_time) day_open,
		last_value([close]) over(partition by trade_date,symbol order by trade_time  rows between unbounded preceding and unbounded following ) day_close
	from intraday_base)
, q2 as(
	select
		trade_date,
	    symbol,
		day_open,
		day_close,
		sum(volume) over(partition by trade_date,symbol order by trade_time rows between unbounded preceding and unbounded following) total_volume,
		row_number() over(partition by trade_date,symbol order by trade_time) rank
	from q1
)
select 
	trade_date,
	symbol,
	total_volume,
    day_open,
	day_close,
	day_close - day_open price_change,

	case 
		when (day_close - day_open) > 0 then 'Bullish Day'
		else 'Bearish day'
	end day_type
from q2
where rank = 1

