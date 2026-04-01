/* =========================================================
   📊 PHONEPE DATA ANALYSIS PROJECT (SQL SERVER)
   =========================================================

   🔍 Objective:
   Analyze transaction data to extract business insights 
   such as revenue trends, top-performing regions, and 
   user transaction behavior.

   🛠 Database: SQL Server
   ========================================================= */

-- =========================
-- 1. DATABASE SETUP
-- =========================

CREATE DATABASE phonepe;
GO

USE phonepe;
GO

-- =========================
-- 2. TABLE CREATION
-- =========================

-- 📌 Aggregated Transaction Table
CREATE TABLE dbo.aggregated_transaction (
    state VARCHAR(100),
    year INT,
    quarter INT,
    transaction_type VARCHAR(100),
    transaction_count BIGINT,
    transaction_amount FLOAT
);

-- 📌 District-Level Data
CREATE TABLE dbo.top_district (
    state VARCHAR(100),
    year INT,
    quarter INT,
    district VARCHAR(100),
    transaction_count BIGINT,
    transaction_amount FLOAT
);

-- 📌 Pincode-Level Data
CREATE TABLE dbo.top_pincode (
    state VARCHAR(100),
    year INT,
    quarter INT,
    pincode VARCHAR(20),
    transaction_count BIGINT,
    transaction_amount FLOAT
);

-- =========================
-- 3. DATA PREVIEW
-- =========================

SELECT TOP 10 * FROM dbo.aggregated_transaction;
SELECT TOP 10 * FROM dbo.top_district;
SELECT TOP 10 * FROM dbo.top_pincode;

-- =========================
-- 4. KEY ANALYSIS
-- =========================

-- 🔹 4.1 Total Transaction Value
SELECT ROUND(SUM(transaction_amount), 2) AS total_transaction_value
FROM dbo.aggregated_transaction;

-- 🔹 4.2 Top 10 States by Transaction Value
SELECT TOP 10 
    state,
    ROUND(SUM(transaction_amount), 2) AS total_value
FROM dbo.aggregated_transaction
GROUP BY state
ORDER BY total_value DESC;

-- 🔹 4.3 Transaction Type Analysis
SELECT 
    transaction_type,
    ROUND(SUM(transaction_amount), 2) AS total_value
FROM dbo.aggregated_transaction
GROUP BY transaction_type
ORDER BY total_value DESC;

-- 🔹 4.4 Year-wise Growth Trend
SELECT 
    year,
    ROUND(SUM(transaction_amount), 2) AS yearly_total
FROM dbo.aggregated_transaction
GROUP BY year
ORDER BY year;

-- 🔹 4.5 Quarter-wise Trend Analysis
SELECT 
    year,
    quarter,
    ROUND(SUM(transaction_amount), 2) AS quarterly_total
FROM dbo.aggregated_transaction
GROUP BY year, quarter
ORDER BY year, quarter;

-- 🔹 4.6 Top 10 Districts by Transaction Value
SELECT TOP 10 
    district,
    ROUND(SUM(transaction_amount), 2) AS total_value
FROM dbo.top_district
GROUP BY district
ORDER BY total_value DESC;

-- 🔹 4.7 Top 10 Pincodes by Transaction Value
SELECT TOP 10 
    pincode,
    ROUND(SUM(transaction_amount), 2) AS total_value
FROM dbo.top_pincode
GROUP BY pincode
ORDER BY total_value DESC;

-- 🔹 4.8 State-wise Transaction Volume
SELECT 
    state,
    SUM(transaction_count) AS total_transactions
FROM dbo.aggregated_transaction
GROUP BY state
ORDER BY total_transactions DESC;

-- =========================
-- 5. BUSINESS INSIGHTS
-- =========================

/*
📌 Insights:

1. The platform handles a significantly high transaction value, 
   indicating strong adoption of digital payments.

2. A small number of states contribute the majority of 
   transaction volume, highlighting regional concentration.

3. Transaction types such as P2P and recharge dominate usage, 
   reflecting user preferences.

4. Year-wise growth shows a consistent upward trend, 
   indicating increasing user engagement.

5. District and pincode-level analysis reveals opportunities 
   for hyperlocal expansion and targeting.
*/

-- =========================
-- 6. BUSINESS RECOMMENDATIONS
-- =========================

/*
📌 Recommendations:

1. Focus marketing and investment on top-performing states 
   to maximize ROI.

2. Target emerging regions with promotional campaigns 
   to drive adoption.

3. Enhance features in high-usage transaction categories 
   to improve user retention.

4. Expand services in high-growth districts and pincodes 
   for deeper market penetration.
*/

-- =========================
-- END OF PROJECT
-- =========================