CREATE DATABASE customer_churn_analytics;
USE customer_churn_analytics;
SHOW DATABASES;
USE customer_churn_analytics;

SELECT COUNT(*) AS total_customers
FROM `telco-customer-churn-cleaned`;

SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS retained_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM `telco-customer-churn-cleaned`;

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY Contract
ORDER BY churn_rate DESC;

SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY InternetService
ORDER BY churn_rate DESC;

SELECT
    OnlineSecurity,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY OnlineSecurity
ORDER BY churn_rate DESC;

SELECT
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY TechSupport
ORDER BY churn_rate DESC;

SELECT
    OnlineBackup,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY OnlineBackup
ORDER BY churn_rate DESC;

SELECT
    DeviceProtection,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY DeviceProtection
ORDER BY churn_rate DESC;

SELECT
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY TechSupport
ORDER BY churn_rate DESC;

SELECT
    StreamingTV,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY StreamingTV
ORDER BY churn_rate DESC;

SELECT
    StreamingMovies,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY StreamingMovies
ORDER BY churn_rate DESC;

SELECT
    MultipleLines,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY MultipleLines
ORDER BY churn_rate DESC;

SELECT
    PaperlessBilling,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY PaperlessBilling
ORDER BY churn_rate DESC;

SELECT
    Churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(MIN(MonthlyCharges), 2) AS min_monthly_charges,
    ROUND(MAX(MonthlyCharges), 2) AS max_monthly_charges
FROM `telco-customer-churn-cleaned`
GROUP BY Churn;

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49-72 Months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY tenure_group
ORDER BY churn_rate DESC;

SELECT
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY SeniorCitizen
ORDER BY churn_rate DESC;

SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY gender
ORDER BY churn_rate DESC;

SELECT
    Partner,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY Partner
ORDER BY churn_rate DESC;

SELECT
    Dependents,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY Dependents
ORDER BY churn_rate DESC;

SELECT
    CASE
        WHEN MonthlyCharges < 35 THEN 'Low Charges'
        WHEN MonthlyCharges < 70 THEN 'Medium Charges'
        ELSE 'High Charges'
    END AS charge_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100,
        2
    ) AS churn_rate
FROM `telco-customer-churn-cleaned`
GROUP BY charge_group
ORDER BY churn_rate DESC;

SELECT
    COUNT(*) AS churned_customers,
    ROUND(SUM(MonthlyCharges), 2) AS lost_monthly_revenue,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge,
    ROUND(SUM(TotalCharges), 2) AS total_historical_revenue_lost
FROM `telco-customer-churn-cleaned`
WHERE Churn = 'Yes';

DESCRIBE `telco-customer-churn-cleaned`;

SELECT
    Contract,
    tenure,
    MonthlyCharges,
    TotalCharges,
    Churn
FROM `telco-customer-churn-cleaned`
WHERE Churn = 'Yes'
ORDER BY MonthlyCharges DESC
LIMIT 20;

SELECT
    CASE
        WHEN MonthlyCharges < 35 THEN 'Low Charges'
        WHEN MonthlyCharges BETWEEN 35 AND 70 THEN 'Medium Charges'
        ELSE 'High Charges'
    END AS charge_group,

    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,

    ROUND(
        AVG(CASE
            WHEN Churn = 'Yes' THEN 1.0
            ELSE 0
        END) * 100, 2
    ) AS churn_rate

FROM `telco-customer-churn-cleaned`
GROUP BY charge_group
ORDER BY churn_rate DESC;

SELECT
    TenureGroup,
    COUNT(*) AS total_customers,

    SUM(
        CASE WHEN Churn = 'Yes'
        THEN 1 ELSE 0 END
    ) AS churned_customers,

    ROUND(
        AVG(
            CASE WHEN Churn = 'Yes'
            THEN 1.0 ELSE 0 END
        ) * 100, 2
    ) AS churn_rate

FROM `telco-customer-churn-cleaned`
GROUP BY TenureGroup
ORDER BY churn_rate DESC;