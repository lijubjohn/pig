exch_sym = load '../data/NYSE_daily.txt' as (exchange:chararray,symbol:chararray);
grouped = group exch_sym by exchange;
result = foreach grouped {
 symbols = distinct exch_sym.symbol;
 generate group,COUNT(symbols) as count;
}
store result into '../output/';
