CREATE DATABASE IF NOT EXISTS bb;

CREATE EXTERNAL TABLE bb.store_sales_bucketed
(
  ss_sold_date_sk           bigint,
  ss_sold_time_sk           bigint,
  ss_item_sk                bigint,
  ss_customer_sk            bigint,
  ss_cdemo_sk               bigint,
  ss_hdemo_sk               bigint,
  ss_addr_sk                bigint,
  ss_store_sk               bigint,
  ss_promo_sk               bigint,
  ss_ticket_number          bigint,
  ss_quantity               int,
  ss_wholesale_cost         double,
  ss_list_price             double,
  ss_sales_price            double,
  ss_ext_discount_amt       double,
  ss_ext_sales_price        double,
  ss_ext_wholesale_cost     double,
  ss_ext_list_price         double,
  ss_ext_tax                double,
  ss_coupon_amt             double,
  ss_net_paid               double,
  ss_net_paid_inc_tax       double,
  ss_net_profit             double
)
CLUSTERED BY (ss_customer_sk) INTO 100 BUCKETS
STORED AS PARQUET
LOCATION '<store_location>/store_sales';

CREATE EXTERNAL TABLE bb.store_returns_bucketed
(
  sr_returned_date_sk       bigint,
  sr_return_time_sk         bigint,
  sr_item_sk                bigint,
  sr_customer_sk            bigint,
  sr_cdemo_sk               bigint,
  sr_hdemo_sk               bigint,
  sr_addr_sk                bigint,
  sr_store_sk               bigint,
  sr_reason_sk              bigint,
  sr_ticket_number          bigint,
  sr_return_quantity        int,
  sr_return_amt             double,
  sr_return_tax             double,
  sr_return_amt_inc_tax     double,
  sr_fee                    double,
  sr_return_ship_cost       double,
  sr_refunded_cash          double,
  sr_reversed_charge        double,
  sr_store_credit           double,
  sr_net_loss               double
)
CLUSTERED BY (sr_customer_sk) INTO 100 BUCKETS
STORED AS PARQUET
LOCATION '<store_location>/store_returns';

CREATE EXTERNAL TABLE bb.catalog_sales_bucketed
(
    cs_sold_date_sk           bigint,
    cs_sold_time_sk           bigint,
    cs_ship_date_sk           bigint,
    cs_bill_customer_sk       bigint,
    cs_bill_cdemo_sk          bigint,
    cs_bill_hdemo_sk          bigint,
    cs_bill_addr_sk           bigint,
    cs_ship_customer_sk       bigint,
    cs_ship_cdemo_sk          bigint,
    cs_ship_hdemo_sk          bigint,
    cs_ship_addr_sk           bigint,
    cs_call_center_sk         bigint,
    cs_catalog_page_sk        bigint,
    cs_ship_mode_sk           bigint,
    cs_warehouse_sk           bigint,
    cs_item_sk                bigint,
    cs_promo_sk               bigint,
    cs_order_number           bigint,
    cs_quantity               int,
    cs_wholesale_cost         double,
    cs_list_price             double,
    cs_sales_price            double,
    cs_ext_discount_amt       double,
    cs_ext_sales_price        double,
    cs_ext_wholesale_cost     double,
    cs_ext_list_price         double,
    cs_ext_tax                double,
    cs_coupon_amt             double,
    cs_ext_ship_cost          double,
    cs_net_paid               double,
    cs_net_paid_inc_tax       double,
    cs_net_paid_inc_ship      double,
    cs_net_paid_inc_ship_tax  double,
    cs_net_profit             double
)
CLUSTERED BY (cs_bill_customer_sk) INTO 100 BUCKETS
STORED AS PARQUET
LOCATION '<store_location>/catalog_sales';