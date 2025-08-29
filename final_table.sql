CREATE TABLE customer_features_final AS
SELECT 
    aoc.client_id,
    
    -- Pick the district column from acc_orders_card_disp_client
    aoc.district_id AS district_id,
    
    -- Transactions
    COALESCE(SUM(CASE WHEN tl.amount > 0 THEN tl.amount ELSE 0 END), 0) AS total_inflow,
    COALESCE(SUM(CASE WHEN tl.amount < 0 THEN -tl.amount ELSE 0 END), 0) AS total_outflow,
    COUNT(tl.trans_id) AS transaction_count,
    
    -- Loans
    COUNT(tl.loan_id) AS loan_count,
    COALESCE(AVG(tl.loan_amount), 0) AS avg_loan_amount,
    COALESCE(SUM(tl.loan_amount), 0) AS total_loan_amount,
    
    -- Orders
    COUNT(aoc.order_id) AS order_count,
    COALESCE(SUM(aoc.order_amount), 0) AS total_order_amount,
    
    -- Cards
    COUNT(DISTINCT aoc.card_id) AS card_count

FROM acc_orders_card_disp_client aoc

-- Join transaction + loan table
LEFT JOIN trans_loan tl ON tl.account_id = aoc.account_id

GROUP BY aoc.client_id, aoc.district_id
ORDER BY aoc.client_id;
