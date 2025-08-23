select * from trans_loan;

select * from account_orders;

select * from card_disp;

select * from card_disp_client;

select * from card_disp_client_dist;

select * from acc_ord_card_disp_client;

select * from acc_ord_card_disp_client aocdcd join trans_loan lt on lt.account_id= aocdcd.account_id ;