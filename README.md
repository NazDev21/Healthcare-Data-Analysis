# Data Cleaning & Preparation

Prior to analysis, the healthcare dataset was examined and prepared to ensure data quality, consistency, and reliability. The dataset initially contained **55,500 records and 15 variables**, including patient demographics, hospital information, admission details, and billing data. Since the dataset is **synthetically generated**, the cleaning process primarily focused on verifying structural integrity and demonstrating standard data preparation practices commonly applied in real-world datasets.

---

## Duplicate Records

The dataset was first inspected for duplicate observations to prevent redundant data from affecting analysis results.

Using Excel’s **Remove Duplicates** function across all columns:

* **534 exact duplicate rows were identified and removed.**

Further inspection revealed an additional duplication pattern in which records were identical across all columns **except the `Age` column**. This suggested that some entries represented the same patient record with only the age value differing.

To resolve this:

* The **Remove Duplicates** function was executed again.
* The **Age column was excluded** from the duplicate comparison.

This ensured that records matching across all other variables were treated as duplicates.

After performing this step, the dataset was reduced to:

**50,000 total records**

This produced a cleaner and more consistent dataset for analysis.

---

## Missing Data Assessment

A systematic check for missing values was performed using Excel’s:

`Home → Find & Select → Go To Special → Blanks`

**Result:**

* No missing values were detected across the dataset.
* No imputation or row deletion was required.

---

## Standardization of Text Fields

Text fields were reviewed for formatting inconsistencies.

The **Name** column contained mixed capitalization styles, including:

* UPPERCASE
* lowercase
* Proper Case

To standardize formatting, the following Excel functions were applied:

```
=PROPER(TRIM(Name))
```

This ensured:

* Consistent capitalization
* Removal of leading or trailing spaces

---

## Validation of Date Fields

The dataset contains two date variables:

* **Date of Admission**
* **Discharge Date**

To verify logical consistency, a validation check ensured that:

```
Discharge Date ≥ Date of Admission
```

All records satisfied this condition, confirming that there were **no temporal inconsistencies** in admission sequences.

---

## Billing Amount Verification

The **Billing Amount** column was inspected for anomalies.

A small number of records contained **negative billing values**, which may represent:

* Billing adjustments
* Refunds
* Corrections

Instead of deleting these rows, a **flag variable** was introduced to identify such entries as adjustments.

Additionally, a new column called **Adjusted Billing Amount** was created to support revenue analysis.

Purpose of the column:

* Retains **only positive billing values**
* Preserves negative values in the original **Billing Amount** column for transparency

This allows financial analysis without losing adjustment records.

---

## Outlier Screening

Numeric variables were reviewed for unusual values, particularly:

* **Billing Amount**
* **Age**

Outliers were identified using:

* Sorting
* Conditional formatting in Excel

Although some high billing values were observed, these were **retained** because the dataset is synthetic and may intentionally include extreme values.

---

## Additional Derived Variable

To support further analysis, a new variable called **Length of Stay** was created.

```
Length of Stay = Discharge Date − Date of Admission
```

This variable enables analysis of:

* Hospital utilization
* Patient recovery duration
* Admission type comparisons

---

## Summary

The data cleaning process confirmed that the dataset was largely well-structured and contained minimal quality issues.

Key cleaning steps included:

* Removing duplicate records
* Addressing partial duplicates excluding the `Age` column
* Standardizing text formatting
* Validating admission and discharge dates
* Flagging negative billing values
* Creating an **Adjusted Billing Amount** variable
* Screening for outliers
* Creating a **Length of Stay** feature

After cleaning, the final dataset contains:

**50,000 records ready for exploratory data analysis and visualization.**

Final Dataset

Records: 50,000
Columns: 18

Key Derived Variables:
- length_of_stay
- adjustment_flag
- adjusted_billing_amount


# Exploratory Data Analysis (EDA)

## Business Question

**How do patient characteristics and admission factors influence hospital length of stay and treatment costs?**

## Business Goal

The goal of this analysis is to identify how **medical conditions, admission types, and hospitalization duration** influence treatment costs and hospital utilization. Understanding these relationships can help healthcare administrators better evaluate **resource usage, operational efficiency, and cost drivers** within hospital systems.

Because the dataset is **synthetically generated**, the analysis primarily demonstrates common healthcare analytics techniques rather than reflecting real-world hospital distributions.

---

## Admission Distribution by Admission Type

To understand how patients enter the hospital system, the distribution of admissions across **admission types** was analyzed.

The dataset includes three admission categories:

* Emergency
* Elective
* Urgent

The results show that admissions are relatively **balanced across the three categories**.

### Insight

This balanced distribution is consistent with synthetic datasets, which often distribute records evenly across categories to ensure that each category has sufficient representation for analysis.

Even though the dataset is synthetic, analyzing admission types helps illustrate how hospitals categorize patient intake and provides context for evaluating treatment costs and hospital utilization.

---

## Average Length of Stay by Medical Condition

Hospitalization duration was evaluated by calculating the **average length of stay for each medical condition**.

### Insight

The analysis shows that average hospitalization duration varies across medical conditions. Some conditions are associated with longer hospital stays, which may indicate greater treatment complexity or extended recovery periods.

Examining differences in hospital stay duration helps healthcare organizations understand **patient care demands and hospital resource utilization**.

---

## Average Treatment Cost by Medical Condition

Treatment costs were explored by calculating the **average adjusted billing amount** for each medical condition.

The **Adjusted Billing Amount** column was used to ensure that billing adjustments or refunds (represented by negative values in the original billing column) did not distort cost comparisons.

### Insight

Average treatment costs differ across medical conditions. These variations may reflect differences in diagnostic procedures, treatment complexity, and hospital resource utilization.

Analyzing cost patterns by condition helps healthcare organizations better understand **potential drivers of healthcare expenditures**.

---

## Relationship Between Length of Stay and Treatment Cost

To explore the relationship between hospital stay duration and treatment cost, the **average adjusted billing amount was calculated for each length-of-stay value**.

### Insight

The results suggest a **positive relationship between hospitalization duration and treatment cost**. In general, longer hospital stays are associated with higher average billing amounts, which is expected since extended care typically requires additional services, monitoring, and medical resources.

This relationship highlights how hospital utilization can influence overall healthcare expenditures.

---

## Total Billing by Insurance Provider

Billing amounts were aggregated by **insurance provider** to examine how hospital revenue is distributed across insurers.

### Insight

Billing totals appear relatively balanced across insurance providers. This pattern is consistent with the dataset being synthetic, where categories are intentionally distributed evenly.

In real-world healthcare settings, this type of analysis can help hospitals understand **revenue concentration across insurance providers and payer groups**.

---

# Dashboard

An interactive dashboard was developed in Microsoft Excel to visually summarize key insights from the healthcare dataset and allow users to explore relationships between hospital admissions, treatment costs, and hospitalization duration. The dashboard consolidates multiple analytical views into a single interface, enabling users to quickly identify patterns and trends within the dataset.

The dashboard was built using **PivotTables, PivotCharts, slicers, and interactive filters**, allowing dynamic exploration of the data without modifying the underlying dataset.

---

## Dashboard Components

The dashboard includes five primary visualizations that address the project’s business question regarding the factors that influence hospital length of stay and treatment costs.

### Admission Distribution by Admission Type

This chart displays the number of hospital admissions categorized by **admission type**, including emergency, elective, and urgent admissions. The visualization provides an overview of how patients enter the hospital system and helps illustrate the distribution of patient intake across different admission categories.

---

### Average Length of Stay by Medical Condition

This chart shows the **average length of hospital stay for each medical condition**. By comparing hospitalization duration across conditions, the chart highlights which diagnoses tend to require longer treatment periods and greater hospital resource utilization.

---

### Average Treatment Cost by Medical Condition

This visualization presents the **average adjusted billing amount for each medical condition**. The chart allows users to identify conditions that are associated with higher treatment costs and compare cost patterns across different diagnoses.

The **Adjusted Billing Amount** variable is used to ensure that billing adjustments or refunds do not distort cost comparisons.

---

### Length of Stay vs. Treatment Cost

A scatter plot was created to examine the relationship between **hospital length of stay and treatment cost**. The chart plots the average adjusted billing amount for each length-of-stay value, allowing users to observe how treatment costs change as hospitalization duration increases.

This visualization helps illustrate the positive relationship between **longer hospital stays and higher treatment costs**.

---

### Total Billing by Insurance Provider

This chart aggregates the **total adjusted billing amount by insurance provider**, providing insight into how hospital revenue is distributed across different insurers. The visualization helps demonstrate how healthcare organizations may analyze revenue streams across payer groups.

---

## Interactive Dashboard Features

To enhance usability, the dashboard includes **interactive slicers and filters** that allow users to dynamically explore the data.

Users can filter the dashboard by several variables, including:

* Admission Type
* Medical Condition
* Insurance Provider
* Gender
* Test Results

When a slicer filter is applied, all dashboard visualizations update simultaneously, allowing users to analyze how different patient groups impact hospitalization duration, treatment costs, and billing patterns.

---

## Purpose of the Dashboard

The dashboard provides a centralized view of key metrics related to hospital utilization and treatment costs. By integrating multiple visualizations into a single interface, the dashboard allows healthcare administrators and analysts to quickly identify patterns in admissions, evaluate cost drivers, and explore relationships between patient characteristics and healthcare expenditures.

This interactive approach supports **data-driven decision-making** by making complex healthcare data more accessible and easier to interpret.

---

## Summary of Key Findings

The exploratory analysis revealed several patterns within the dataset:

* Admissions are evenly distributed across emergency, elective, and urgent categories.
* Average hospital stay duration varies across medical conditions.
* Treatment costs differ depending on the medical condition.
* Longer hospital stays tend to be associated with higher treatment costs.
* Billing totals appear relatively balanced across insurance providers.

Although the dataset is synthetic, the analytical methods demonstrated in this project reflect common approaches used in healthcare analytics to evaluate **hospital utilization, treatment costs, and patient admission patterns**.

---

# Answer to the Business Question

The analysis suggests that **hospital length of stay is a key factor influencing treatment costs**. As hospitalization duration increases, the average adjusted billing amount also tends to increase. This indicates a positive relationship between the amount of time a patient spends in the hospital and the overall cost of treatment.

Additionally, the analysis shows that **medical conditions play an important role in determining both hospitalization duration and treatment cost**. Certain conditions are associated with longer hospital stays and higher average billing amounts, suggesting that treatment complexity and required care levels vary by diagnosis.

Admission factors, such as admission type, provide further context for understanding patient intake and hospital utilization. Although admission categories appear evenly distributed in this synthetic dataset, the analysis demonstrates how hospitals can examine admission patterns to evaluate operational demand.

Overall, the findings suggest that **patient diagnosis and hospitalization duration are important drivers of healthcare costs**, and analyzing these factors can help healthcare organizations better understand resource utilization and cost patterns.

---

# Business Recommendations

Based on the findings of the exploratory data analysis, several strategic recommendations can be considered for healthcare organizations seeking to improve operational efficiency and cost management.

## Improve Resource Planning for Longer Hospital Stays

The analysis indicates that **longer hospital stays are associated with higher treatment costs**. Healthcare organizations should monitor patient stays closely and identify opportunities to streamline care processes where appropriate. Improving discharge planning, care coordination, and treatment efficiency can help reduce unnecessary hospitalization duration while maintaining quality patient care.

---

## Monitor High-Cost Medical Conditions

Since treatment costs vary across medical conditions, hospitals should analyze which conditions consistently lead to **higher treatment costs or longer hospital stays**. Identifying these conditions allows healthcare administrators to allocate resources more effectively and explore opportunities for cost optimization, improved care pathways, or preventative interventions.

---

## Strengthen Financial Monitoring of Billing and Adjustments

The presence of billing adjustments highlights the importance of maintaining transparency in healthcare financial reporting. Healthcare organizations should implement strong billing review processes to monitor adjustments and ensure accurate financial tracking of treatment costs and reimbursements.

---

## Evaluate Admission Processes and Operational Efficiency

Although the dataset shows a balanced distribution of admission types, real healthcare environments often experience surges in emergency admissions. Hospitals should regularly review admission patterns and ensure adequate staffing, bed capacity, and operational readiness to support fluctuations in patient demand.

---

## Use Data Analytics to Support Strategic Decision-Making

This analysis demonstrates how hospital data can be used to better understand **treatment costs, patient stay duration, and admission patterns**. Healthcare organizations should continue investing in data analytics capabilities to support informed decision-making related to resource allocation, cost management, and patient care optimization.

---

Overall, leveraging data-driven insights can help healthcare providers improve **operational efficiency, financial performance, and patient care outcomes**.
