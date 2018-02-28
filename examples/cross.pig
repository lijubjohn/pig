file1 = LOAD '../data/file1.txt' using PigStorage(',') as (request_domain: chararray,msisdn:int);       
file2 = LOAD '../data/file2.txt' using PigStorage(',') as (domain: chararray,provider: chararray);
crossed = CROSS file1,file2;
//indexof - searches 2nd arg in first and returns first index , -1 if not found
filtered = FILTER crossed BY INDEXOF(file1::request_domain,file2::domain) != -1 ;
STORE filtered INTO 'output/test1.out';
