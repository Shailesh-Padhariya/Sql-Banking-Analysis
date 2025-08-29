Bank Data Analysis
Project Overview

This project involves analyzing banking data to create a Master Table that consolidates client, account, transaction, loan, and demographic information. The goal is to structure and integrate multiple datasets for efficient querying and insights.

Dataset Description

The data consists of multiple relational tables representing different aspects of the banking system:

Accounts: Basic account details (creation date, branch, etc.).

Clients: Information about individual bank clients.

Disposition: Relationship between accounts and clients (who can access which account).

Orders: Payment orders linked to accounts.

Transactions: Records of all transactions performed.

Loans: Details of loans issued to accounts.

Credit Cards: Credit card data linked to accounts.

Demographic Data: Publicly available district-level statistics.

Data Processing & Integration

Using SQL:

Imported and cleaned all datasets.

Merged related tables to link transactions, loans, and orders to accounts.

Integrated demographic data to provide additional insights.

Created a Master Table that consolidates all key banking information.

Tools Used

SQL (MySQL) – Data integration, cleaning, and querying.

Excel/Pandas – Data verification and validation.

Relational Database Concepts – Efficient table structuring and normalization.

Key Findings from Cluster Analysis

Using KMeans clustering on aggregated client features (inflows, outflows, loans, orders, cards):

Cluster 1 – High-Value Clients

Very high total loan amounts and inflows.

High number of transactions and orders.

These are the VIP clients contributing the most to the bank’s revenue.

Cluster 3 – Mid-Value Clients

Moderate loans, inflows, and transactions.

Potential to upsell services or convert to high-value.

Cluster 0 – Low-Value Clients

Minimal activity in transactions and loans.

Low engagement with banking products.

Cluster 2 – Order-Heavy Clients

No loans or inflows, but very high order activity.

Likely special-purpose accounts or bulk payment clients.

These findings allow the bank to target high-value clients, identify mid-tier growth opportunities, and understand client behavior patterns across different clusters.
