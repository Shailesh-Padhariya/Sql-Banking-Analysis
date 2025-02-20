create table trans_loan as 
select td.*, ln.loan_id, 
ln.date as Loan_date, 
ln.amount as loan_amount, 
ln.duration as loan_duration, 
ln.payments as loan_payments, 
ln.status as loan_status 
from loan ln 
join transaction_data td on ln.account_id = td.account_id;

select * from trans_loan;



create table account_orders as 
select o.*,
 acc.date as account_date, 
acc.district_id as account_district_id, 
acc.frequency as account_frequency 
from account acc 
left join orders o on  acc.account_id=o.account_id;

select * from account_orders;


create table card_disp as
select card.*, 
disp.account_id,
disp.client_id as disposition_client_id,
disp.type as disposition_type 
from card card join disp disp on card.disp_id = disp.disp_id;

select * from card_disp;


create table card_disp_client as 
select* from card_disp cd join client c on cd.disposition_client_id = c.client_id;

select * from card_disp_client;

create table card_disp_client_dist as 
select * from card_disp_client cdc join district dist on cdc.district_id = dist.A1;

select * from card_disp_client_dist;

create table acc_ord_card_disp_client as 
select 
cdcd.*, ao.order_id,
ao.bank_to,
ao.account_to,
ao.amount,
ao.k_symbol,
ao.account_date,
ao.account_district_id,
ao.account_frequency from account_orders ao
left join card_disp_client_dist cdcd on ao.account_id=cdcd.account_id;

select * from acc_ord_card_disp_client;

select * from acc_ord_card_disp_client aocdcd join trans_loan lt on lt.account_id= aocdcd.account_id ;