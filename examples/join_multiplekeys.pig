daily = load '../data/NYSE_daily.txt' as (exchange, symbol, date, open, high, low, close,
			volume, adj_close);
divs  = load '../data/NYSE_dividends.txt' as (exchange, symbol, date, dividends);
jnd   = join daily by (symbol, date), divs by (symbol, date);
store jnd into '../output/';
