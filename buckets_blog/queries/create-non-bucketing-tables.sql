CREATE TABLE buckets_blog.customer_non_bucketed
(
    c_customer_sk             bigint,
    c_customer_id             string,
    c_first_name              string,
    c_last_name               string
)
STORED AS PARQUET
LOCATION 's3://<s3bucket>/buckets_blog/customer';

CREATE TABLE buckets_blog.store_sales_non_bucketed
(
  ss_sold_date_sk BIGINT,
  ss_sold_time_sk BIGINT,
  ss_item_sk BIGINT,
  ss_customer_sk BIGINT,
  ss_quantity INT,
  ss_list_price DOUBLE,
  ss_sales_price DOUBLE
)
STORED AS PARQUET
LOCATION 's3://<s3bucket>/buckets_blog/store_sales';

CREATE TABLE buckets_blog.store_returns_non_bucketed
(
    sr_returned_date_sk       bigint,
    sr_return_time_sk         bigint,
    sr_item_sk                bigint,
    sr_customer_sk            bigint,
    sr_return_quantity        int,
    sr_return_amt             double
)
STORED AS PARQUET
LOCATION 's3://<s3bucket>/buckets_blog/store_returns';
