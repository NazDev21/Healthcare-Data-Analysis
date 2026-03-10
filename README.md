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
