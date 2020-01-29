# Buckets test

This test is based on standard TPC-DS dataset and includes just 3 tables from it. customer, store_sales and store_returns.

## Test infrastructure

### Okera cluster setup
1 planner, 3 workers - m5.4xlarge

### Client used
EMR hive: 1 master, 3 workers - m5.4xlarge

### Record count and size
Files are stored in parquet format

| Dataset Name |  Record Count | Record Size |
| :------------------ | :---------- | :---------- |
| Customer      | 12000000 | 366 MB |
| Customer      | 2879987999 | 37.8 GB |
| Customer      | 287999764 | 6 GB |

## Test setup
* Test tables create statements can be found under test-tables/create-bucketed-tables.sql and test-tables/create-non-bucketed-tables.sql. For simplicity, the same underlying data is used for non-bucketed vs bucketed comparison.
* Test view statements can be found under test-tables/create-test-views.sql. We use views in this test so that the SQL gets executed within Okera and not at the client, hive in this case.

## Test Queries
* Queries can be found under queries/buckets-demo-queries.sql
