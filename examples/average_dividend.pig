dividends = load '../data/NYSE_dividends.txt' as (exchange, symbol, date, dividend);
grouped   = group dividends by symbol;
avg       = foreach grouped generate group, AVG(dividends.dividend);
store avg into '../output/average_dividend';
