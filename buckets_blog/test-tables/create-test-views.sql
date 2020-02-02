CREATE VIEW bb.cs__sr__bucketed__view AS
SELECT * FROM bb.catalog_sales_bucketed
INNER JOIN bb.store_returns_bucketed
ON (cs_bill_customer_sk = sr_customer_sk AND cs_item_sk = sr_item_sk);

CREATE VIEW bb.ss__sr__bucketed__view AS
SELECT * FROM bb.store_sales_bucketed
INNER JOIN bb.store_returns_bucketed
ON (ss_customer_sk = sr_customer_sk AND ss_item_sk = sr_item_sk AND ss_ticket_number = sr_ticket_number);

CREATE VIEW bb.ss__cs__bucketed__view AS
SELECT * FROM bb.store_sales_bucketed
INNER JOIN bb.catalog_sales_bucketed
ON (ss_customer_sk = cs_bill_customer_sk AND ss_item_sk = cs_item_sk);

CREATE VIEW bb.cs__sr__non_bucketed__view AS
SELECT * FROM bb.catalog_sales_non_bucketed
INNER JOIN bb.store_returns_non_bucketed
ON (cs_bill_customer_sk = sr_customer_sk AND cs_item_sk = sr_item_sk);

CREATE VIEW bb.ss__sr__non_bucketed__view AS
SELECT * FROM bb.store_sales_non_bucketed
INNER JOIN bb.store_returns_non_bucketed
ON (ss_customer_sk = sr_customer_sk AND ss_item_sk = sr_item_sk AND ss_ticket_number = sr_ticket_number);

CREATE VIEW bb.ss__cs__non_bucketed__view AS
SELECT * FROM bb.store_sales_non_bucketed
INNER JOIN bb.catalog_sales_non_bucketed
ON (ss_customer_sk = cs_bill_customer_sk AND ss_item_sk = cs_item_sk);