-- Total number of customers
SELECT
    COUNT(*) AS total_customers
FROM wa_fn_usec;


-- Check for duplicate customer IDs
SELECT
    "customerID",
    COUNT(*) AS duplicate_count
FROM wa_fn_usec
GROUP BY "customerID"
HAVING COUNT(*) > 1;


-- Check for NULL values
SELECT *
FROM wa_fn_usec
WHERE "tenure" IS NULL
   OR "TotalCharges" IS NULL;


-- Contract types
SELECT DISTINCT
    "Contract"
FROM wa_fn_usec;


-- Internet service types
SELECT DISTINCT
    "InternetService"
FROM wa_fn_usec;


-- Payment methods
SELECT DISTINCT
    "PaymentMethod"
FROM wa_fn_usec;


-- Churn values
SELECT DISTINCT
    "Churn"
FROM wa_fn_usec;


-- Number of churned and retained customers
SELECT
    "Churn",
    COUNT(*) AS total_customers
FROM wa_fn_usec
GROUP BY "Churn";


-- Most common contract type
SELECT
    "Contract",
    COUNT(*) AS total_customers
FROM wa_fn_usec
GROUP BY "Contract"
ORDER BY total_customers DESC;


-- Average monthly charges
SELECT
    ROUND(AVG("MonthlyCharges"), 2) AS avg_monthly_charges
FROM wa_fn_usec;


-- Minimum and maximum tenure
SELECT
    MIN("tenure") AS min_tenure,
    MAX("tenure") AS max_tenure
FROM wa_fn_usec;


-- ANALYSIS 1:
-- Contract vs Churn
-- Hypothesis:
-- Customers with month-to-month contracts churn more frequently

SELECT
    "Contract",

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN "Churn" = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Churn" = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate

FROM wa_fn_usec
GROUP BY "Contract"
ORDER BY churn_rate DESC;
--Customers with month-to-month contracts have the highest churn rate, indicating lower customer loyalty among short-term contract users.
--High churn in this segment may negatively affect long-term revenue stability. 
--The company could reduce churn by encouraging customers to switch to long-term contracts through discounts or loyalty programs.

-- ANALYSIS 2:
-- Monthly Charges vs Churn
-- Hypothesis:
-- Customers with higher monthly charges churn more frequently

SELECT
    "Churn",
    AVG("MonthlyCharges") AS avg_monthly_charges
FROM wa_fn_usec
GROUP BY "Churn";
--Customers who churned had higher average monthly charges compared to retained customers.
--This may indicate that pricing affects customer satisfaction and retention.
--High churn among high-paying customers may negatively affect company revenue.
--The company could review pricing strategies or provide personalized offers for high-paying customers.


-- ANALYSIS 3:
-- Tenure vs Churn
-- Hypothesis:
-- Newer customers are more likely to churn

SELECT
    "Churn",

    ROUND(
        AVG("tenure"),
        2
    ) AS avg_tenure
FROM wa_fn_usec
GROUP BY "Churn";
-- Customers who churned had significantly lower average tenure compared to retained customers.
-- This suggests that newer customers are more likely to leave the company.
-- High churn during the early stages of the customer lifecycle may reduce long-term customer retention.
-- The company could improve onboarding, customer engagement, and early support strategies to retain new customers.


-- ANALYSIS 4:
-- TechSupport vs Churn
-- Hypothesis:
-- Customers without tech support churn more frequently

SELECT
    "TechSupport",

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN "Churn" = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Churn" = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate
FROM wa_fn_usec
GROUP BY "TechSupport"
ORDER BY churn_rate DESC;
-- Customers without technical support have higher churn rates compared to customers who use support services.
-- This may indicate that technical support improves customer satisfaction and reduces customer frustration.
-- High churn among customers without support may negatively affect customer retention and service quality perception.
-- The company could reduce churn by improving technical support accessibility and encouraging customers to use support services.

-- ANALYSIS 5:
-- InternetService vs Churn
-- Hypothesis:
-- Internet service type affects customer churn

SELECT
    "InternetService",

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN "Churn" = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Churn" = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate
FROM wa_fn_usec
GROUP BY "InternetService"
ORDER BY churn_rate DESC;
-- Customers using Fiber Optic internet service have the highest churn rate among all internet service groups.
-- This may indicate possible issues related to pricing, service quality, or customer expectations.
-- High churn among Fiber Optic users may negatively affect revenue from premium service customers.
-- The company could investigate customer satisfaction among Fiber Optic users and improve service quality or pricing strategies.


-- ANALYSIS 6:
-- PaymentMethod vs Churn
-- Hypothesis:
-- Payment method may affect customer churn

SELECT
    "PaymentMethod",

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN "Churn" = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN "Churn" = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate
FROM wa_fn_usec
GROUP BY "PaymentMethod"
ORDER BY churn_rate DESC;
-- Customers using electronic check payment methods have the highest churn rate.
-- This may indicate lower customer engagement or differences in customer behavior across payment methods.
-- High churn among these customers may increase customer acquisition and retention costs.
-- The company could encourage customers to switch to automatic payment methods through incentives or loyalty benefits.
