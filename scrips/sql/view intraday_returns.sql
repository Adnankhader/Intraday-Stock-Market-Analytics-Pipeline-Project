create view intraday_returns as
with q1 as (select
	*,
	lag([close]) over(partition by trade_date,symbol order by trade_time) prev_close 
from intraday_base)

select 
	trade_date,
	symbol,
	[close],
	round(isnull(prev_close,0),2) prev_close,
	isnull(round([close]-prev_close,2),0) price_change,
	isnull(round(([close]-prev_close )*100.0 / nullif(prev_close,0),2),0) percentage_change
from q1

