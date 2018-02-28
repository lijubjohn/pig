divs = load '../data/NYSE_dividends.txt' as (exchange:chararray, symbol:chararray,date:chararray, dividends:float);
filtered = filter divs by symbol matches 'CM*';
store filtered into '../output/';