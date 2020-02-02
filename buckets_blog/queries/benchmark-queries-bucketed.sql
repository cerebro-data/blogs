-- Query 1: Join between catalog_sales and store_returns. Simulates big-medium tables
SELECT
 i_item_id,
 i_item_desc,
 s_state,
 count(sr_return_quantity) as store_return_quantitycount,
 count(cs_quantity) as catalog_sales_quantitycount
FROM bb.cs__sr__bucketed__view
JOIN bb.store ON (s_store_sk = sr_store_sk )
JOIN bb.item ON (i_item_sk = sr_item_sk)
group by i_item_id, i_item_desc, s_state
order by i_item_id, i_item_desc, s_state;

-- Query 2: Join of two big-medium table joins. One between catalog_sales and store_returns,
-- another between store_sales and store_returns.
select i_item_id
       ,i_item_desc
       ,s_state
       ,count(ss_sr.ss_quantity) as store_sales_quantitycount
       ,avg(ss_sr.ss_quantity) as store_sales_quantityave
       ,stddev_samp(ss_sr.ss_quantity) as store_sales_quantitystdev
       ,stddev_samp(ss_sr.ss_quantity)/avg(ss_sr.ss_quantity) as store_sales_quantitycov
       ,count(cs_sr.sr_return_quantity) as_store_returns_quantitycount
       ,avg(cs_sr.sr_return_quantity) as_store_returns_quantityave
       ,stddev_samp(cs_sr.sr_return_quantity) as_store_returns_quantitystdev
       ,stddev_samp(cs_sr.sr_return_quantity)/avg(cs_sr.sr_return_quantity) as store_returns_quantitycov
       ,count(cs_sr.cs_quantity) as catalog_sales_quantitycount
       ,avg(cs_sr.cs_quantity) as catalog_sales_quantityave
       ,stddev_samp(cs_sr.cs_quantity)/avg(cs_sr.cs_quantity) as catalog_sales_quantitystdev
       ,stddev_samp(cs_sr.cs_quantity)/avg(cs_sr.cs_quantity) as catalog_sales_quantitycov
 from bb.cs__sr__bucketed__view cs_sr,
  bb.ss__sr__bucketed__view ss_sr,
  bb.date_dim d1,
  bb.date_dim d2,
  bb.date_dim d3,
  bb.store,
  bb.item
 where d1.d_quarter_name = '2001Q1'
   and d1.d_date_sk = ss_sr.ss_sold_date_sk
   and i_item_sk = ss_sr.ss_item_sk
   and s_store_sk = ss_sr.ss_store_sk
   and ss_sr.ss_customer_sk = cs_sr.sr_customer_sk
   and ss_sr.ss_item_sk = cs_sr.sr_item_sk
   and ss_sr.ss_ticket_number = cs_sr.sr_ticket_number
   and cs_sr.sr_returned_date_sk = d2.d_date_sk
   and d2.d_quarter_name in ('2001Q1','2001Q2','2001Q3')
   and cs_sr.cs_sold_date_sk = d3.d_date_sk
   and d3.d_quarter_name in ('2001Q1','2001Q2','2001Q3')
 group by i_item_id, i_item_desc, s_state
 order by i_item_id, i_item_desc, s_state
 limit 100;

-- Query 3: Join between 2 big tables. store_sales joined with catalog_sales.
select i_item_id
       ,i_item_desc
       ,s_state
       ,count(ss_quantity) as store_sales_quantitycount,
       count(cs_quantity) as catalog_sales_quantitycount
FROM bb.ss__cs__bucketed__view
JOIN bb.store ON (s_store_sk = ss_store_sk )
JOIN bb.item ON (i_item_sk = ss_item_sk)
group by i_item_id, i_item_desc, s_state
order by i_item_id, i_item_desc, s_state;