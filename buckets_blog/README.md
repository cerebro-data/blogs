Test Metrics

hive> select count(*) from buckets_blog.customer;
OK
12000000
Time taken: 0.418 seconds, Fetched: 1 row(s)
hive> select count(*) from buckets_blog.store_sales;
OK
2879987999
Time taken: 0.113 seconds, Fetched: 1 row(s)
hive> select count(*) from buckets_blog.store_returns;
OK
287999764
Time taken: 0.106 seconds, Fetched: 1 row(s)

