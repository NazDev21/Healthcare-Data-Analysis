# Healthcare EDA Project

-- What is the average length of stay by medical condition?
-- This helps understand which conditions tend to require longer hospitalizations.

SELECT medical_condition, ROUND(AVG(length_of_stay), 2) AS average_stay
FROM healthcare_dataset_final
GROUP BY medical_condition
ORDER BY average_stay DESC;

-- What is the total revenue by insurance provider?
-- This shows which insurance providers generate the largest billing totals.

SELECT insurance_provider, ROUND(SUM(adjusted_billing_amount), 2) AS insurance_revenue
FROM healthcare_dataset_final
GROUP BY insurance_provider
ORDER BY insurance_revenue DESC;

-- What does the admission type distribution look like?
-- This explores how patients enter the hospital.

SELECT
    admission_type,
    number_of_admissions,
    ROUND((number_of_admissions * 100.0 / SUM(number_of_admissions) OVER()), 2) AS percentage_of_admissions
FROM (
    SELECT
        admission_type,
        COUNT(name) AS number_of_admissions
    FROM healthcare_dataset_final
    GROUP BY admission_type
) AS admission_table
ORDER BY number_of_admissions DESC;

-- What is the average billing amount broken down by medical condition?
-- This shows which conditions are most expensive to treat.

SELECT medical_condition, ROUND(AVG(adjusted_billing_amount), 2) AS average_billing_amount
FROM healthcare_dataset_final
GROUP BY medical_condition
ORDER BY average_billing_amount DESC;

-- What is the length of stay VS billing amount?
-- This explores the relationship between hospital stay duration and treatment cost.

SELECT
    length_of_stay,
    COUNT(*) AS admission_count,
    ROUND(AVG(adjusted_billing_amount), 2) AS avg_billing_amount
FROM healthcare_dataset_final
GROUP BY length_of_stay
ORDER BY length_of_stay ASC;