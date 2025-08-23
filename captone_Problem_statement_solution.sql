-- Create a table combining transaction and loan data
CREATE TABLE trans_loan AS 
SELECT 
    t.*,
    l.loan_id, 
    l.date AS loan_date, 
    l.amount AS loan_amount, 
    l.duration AS loan_duration, 
    l.payments AS loan_payments, 
    l.status AS loan_status 
FROM loan l 
JOIN transaction_data t ON l.account_id = t.account_id;

SELECT * FROM trans_loan;


-- Create a table combining account and order data
CREATE TABLE account_orders AS 
SELECT 
    o.*,
    a.date AS account_date, 
    a.district_id AS account_district_id, 
    a.frequency AS account_frequency 
FROM account a 
LEFT JOIN orders o ON a.account_id = o.account_id;

SELECT * FROM account_orders;


-- Create a table combining card and disposition data
CREATE TABLE card_disposition AS
SELECT 
    c.*,
    d.account_id,
    d.client_id AS disp_client_id,
    d.type AS disp_type 
FROM card c 
JOIN disp d ON c.disp_id = d.disp_id;

SELECT * FROM card_disposition;


-- Add client data to the card_disposition table
CREATE TABLE card_disp_client AS 
SELECT 
    cd.*,
    cl.* 
FROM card_disposition cd 
JOIN client cl ON cd.disp_client_id = cl.client_id;

SELECT * FROM card_disp_client;


-- Add district data to the card_disp_client table
CREATE TABLE card_disp_client_district AS 
SELECT 
    cdc.*,
    d.* 
FROM card_disp_client cdc 
JOIN district d ON cdc.district_id = d.A1;

SELECT * FROM card_disp_client_district;


-- Combine account_orders with card_disp_client_district
CREATE TABLE acc_orders_card_disp_client AS 
SELECT 
    cdc.*,
    ao.order_id,
    ao.bank_to,
    ao.account_to,
    ao.amount AS order_amount,
    ao.k_symbol,
    ao.account_date,
    ao.account_district_id,
    ao.account_frequency 
FROM account_orders ao
LEFT JOIN card_disp_client_district cdc ON ao.account_id = cdc.account_id;

SELECT * FROM acc_orders_card_disp_client;


-- Final join: Combine with loan/transaction data
SELECT * 
FROM acc_orders_card_disp_client aoc 
JOIN trans_loan tl ON tl.account_id = aoc.account_id;
