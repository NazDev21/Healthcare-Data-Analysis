# Healthcare Data Analytics Project

## Project Background

This project analyzes a **synthetic healthcare dataset** to simulate how a healthcare organization might evaluate hospital admissions, patient length of stay, treatment costs, and insurance billing patterns.

The objective of the analysis is to identify patterns in **hospital utilization, treatment costs, and patient admission characteristics** that could help healthcare administrators improve operational efficiency and financial decision-making.

While the dataset is **synthetically generated**, the analytical workflow mirrors the type of analysis commonly performed by healthcare data analysts working within hospital systems. The analysis focuses on understanding how patient admissions, medical conditions, and hospitalization duration influence treatment costs and hospital resource utilization.

Healthcare organizations typically monitor several operational and financial metrics when evaluating performance, including:

* Hospital admission volume
* Average patient length of stay
* Treatment costs by medical condition
* Insurance billing and revenue distribution
* Hospital resource utilization and patient throughput

This project demonstrates how these types of metrics can be analyzed using **SQL, Excel, and data visualization techniques** to support data-driven decision making.

### Key Analysis Areas

Insights and recommendations are provided across the following key areas:

- **Admission Distribution and Patient Intake Patterns**
- **Hospital Length of Stay Analysis**
- **Treatment Cost Drivers by Medical Condition**
- **Insurance Billing and Revenue Distribution**

---

### Supporting Resources

Targeted SQL queries regarding business questions can be found here:
**[SQL Analysis Queries](code/healthcare_eda.sql)**

The raw and clean healthcare datasets can be found here:
**[Healthcare Datasets](data/)**

An interactive Excel dashboard used to explore trends and insights can be found here:
**[Excel Dashboard](dashboard/)**

### Dashboard Preview

![Admission Distribution](visuals/healthcare_dashboard.png)

---

# Data Structure & Initial Checks

The dataset used in this project consists of **synthetic hospital admission and billing records** designed to simulate operational healthcare data. After cleaning and preprocessing, the dataset contains **50,000 patient records** with multiple variables related to patient demographics, hospital utilization, and billing information.

### Main Data Structure

The analysis dataset consists of one primary analytical table derived from healthcare admission records.

| Field                   | Description                                  |
| ----------------------- | -------------------------------------------- |
| name                    | Patient identifier                           |
| age                     | Patient age                                  |
| gender                  | Patient gender                               |
| blood_type              | Blood type classification                    |
| medical_condition       | Diagnosed condition                          |
| admission_type          | Admission type (Emergency, Elective, Urgent) |
| hospital                | Hospital location                            |
| doctor                  | Attending physician                          |
| admission_date          | Date of admission                            |
| discharge_date          | Date of discharge                            |
| length_of_stay          | Calculated hospital stay duration            |
| billing_amount          | Original billing amount                      |
| adjustment_flag         | Indicates billing charge vs adjustment       |
| adjusted_billing_amount | Positive billing value used for analysis     |
| insurance_provider      | Insurance company responsible for billing    |
| medication              | Medication prescribed                        |
| test_results            | Diagnostic test outcome                      |
| room_number             | Assigned hospital room                       |

### Initial Data Quality Checks

Several preprocessing and validation steps were performed before analysis:

* Removed **534 exact duplicate records**
* Removed additional duplicates where records differed only by **age**
* Verified that **no missing values** existed in the dataset
* Confirmed that **discharge dates always occurred after admission dates**
* Created derived variables including:

  * `length_of_stay`
  * `adjusted_billing_amount`
  * `adjustment_flag`

These steps ensured the dataset was clean and suitable for exploratory analysis.

---

# Executive Summary

### Overview of Findings

Three key insights emerged from the analysis of hospital admission and billing data:

1. **Longer hospital stays are associated with higher treatment costs**, indicating that hospitalization duration is a major driver of healthcare expenditures.
2. **Treatment costs vary across medical conditions**, suggesting differences in treatment complexity and resource utilization.
3. **Admissions and billing distribution appear balanced across categories**, which reflects the synthetic structure of the dataset but demonstrates how hospitals can monitor operational patterns.

For healthcare leadership, these findings highlight the importance of monitoring **hospital stay duration, treatment cost drivers, and patient admission patterns** to improve operational efficiency and cost management.

---

# Insights Deep Dive

## Admission Distribution and Patient Intake Patterns

• Admissions are distributed across emergency, elective, and urgent categories, demonstrating how hospitals classify patient intake based on treatment urgency.

• Emergency admissions represent a critical operational area that requires immediate resource allocation and medical attention.

• Elective admissions typically represent scheduled procedures, allowing hospitals to better plan staff and facility utilization.

• Understanding admission patterns helps hospital administrators monitor patient flow and operational demand.

![Admission Distribution](visuals/admission_distribution_by_admission_type.png)

---

## Hospital Length of Stay Analysis

• Average hospital stay duration varies by medical condition, suggesting differences in treatment intensity and recovery time.

• Some conditions require longer hospitalization due to more complex treatment protocols or extended monitoring.

• Longer hospital stays increase resource utilization, including bed occupancy and staffing requirements.

• Monitoring length of stay helps hospitals identify opportunities to improve operational efficiency and patient throughput.

![Admission Distribution](visuals/average_length_of_stay_by_medical_condition.png)

![Admission Distribution](visuals/length_of_stay_vs_average_treatment_cost.png)

---

## Treatment Cost Drivers by Medical Condition

• Average treatment costs differ across medical conditions, reflecting variations in diagnostic testing, medication, and procedures.

• Conditions requiring specialized treatment tend to produce higher billing amounts.

• Treatment cost analysis helps identify conditions contributing most to hospital expenditures.

• Understanding cost drivers supports financial planning and cost management strategies.

![Admission Distribution](visuals/average_treatment_cost_by_medical_condition.png)

---

## Insurance Billing and Revenue Distribution

• Billing totals are distributed across multiple insurance providers.

• Insurance reimbursements represent a significant source of hospital revenue.

• Monitoring payer mix helps healthcare organizations understand financial risk and revenue concentration.

• Billing analysis can support strategic planning and negotiations with insurance providers.

![Admission Distribution](visuals/total_billing_by_insurance_provider.png)

---

# Recommendations

Based on the analysis and insights identified above, healthcare management teams should consider the following actions:

• **Monitor high-cost medical conditions.**
Hospitals should track conditions associated with higher treatment costs and longer hospital stays to better allocate resources and manage operational expenses.

• **Optimize hospital length of stay.**
Improving discharge planning and care coordination may help reduce unnecessary hospitalization duration while maintaining quality patient care.

• **Improve financial monitoring.**
Regular review of billing adjustments and insurance reimbursements can help improve revenue tracking and financial transparency.

• **Enhance resource planning for high-demand admissions.**
Analyzing admission patterns helps hospitals prepare staffing and bed capacity for fluctuating patient demand.

• **Invest in healthcare analytics capabilities.**
Developing stronger data analytics capabilities can support better decision-making related to hospital operations, cost management, and patient care.

---

This project demonstrates how **healthcare data analytics can be used to evaluate hospital utilization, treatment costs, and patient admission patterns**, while illustrating how analytical insights can support operational and financial decision-making in healthcare organizations.
