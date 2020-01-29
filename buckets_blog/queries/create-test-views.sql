-- Views in Okera
-- bucketed
create view buckets_blog.query_1_bucketed_view AS select * from buckets_blog.store_sales ss join buckets_blog.store_returns sr where (ss.ss_customer_sk = sr.sr_customer_sk);

-- non-bucketed
create view buckets_blog.query_1_non_bucketed_view AS select * from buckets_blog.store_sales_non_bucketed ss join buckets_blog.store_returns_non_bucketed sr where (ss.ss_customer_sk = sr.sr_customer_sk);
