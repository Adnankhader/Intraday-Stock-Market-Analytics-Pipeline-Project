create view stock_dim as 
select 
	symbol,
	name,
	sector,
	isnull(market_cap,0) market_cap,
	isnull(shares_outstanding,0) shares_outstanding
from stock_metadata