divs = load '../data/NYSE_dividends.txt' as (exchange:chararray,symbol:chararray,date:chararray,divident:float);
grped = group divs by symbol;
result = foreach grped {
sorted = order divs by divident desc;
top3 = limit sorted 3;
generate group,flatten(top3);
}

store result into '../output/';
