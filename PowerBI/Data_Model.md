# Power BI Data Model

## Project

AI Cheque Extraction Quality Analytics Platform

---

# Data Source

SQL Server

Database

AI_Cheque_Analytics_DB

Schema

Banking

---

# Tables

## Fact Tables

Fact_VLM_Extraction

Fact_Processing_Log

Fact_Manual_Correction

Fact_Quality_Check

---

## Dimension Tables

Dim_Status

Dim_Error_Type

Dim_Date

Dim_Box

Dim_Operator

---

# Relationship Model

```
Dim_Date
      │
      │
      ▼
Fact_Processing_Log

Dim_Status
      │
      │
      ▼
Fact_VLM_Extraction

Dim_Status
      │
      ▼
Fact_Quality_Check

Dim_Box
      │
      ▼
Fact_VLM_Extraction

Dim_Operator
      │
      ▼
Fact_Manual_Correction

Dim_Error_Type
      │
      ▼
Fact_Manual_Correction
```

---

# Star Schema

```
                Dim_Date
                    │
                    │
                    ▼

Dim_Status ---> Fact_VLM_Extraction <--- Dim_Box

                    │

                    ▼

          Fact_Quality_Check

                    │

                    ▼

        Fact_Manual_Correction

                    ▲

                    │

              Dim_Operator
```

---

# Fact Tables

## Fact_VLM_Extraction

Contains

- Account Number
- Cheque Number
- Confidence
- Image
- Extraction Status

---

## Fact_Processing_Log

Contains

- Batch
- Images
- Accuracy
- Duration
- Success

---

## Fact_Manual_Correction

Contains

- Operator
- Correction Time
- Field Corrected
- Review Status

---

## Fact_Quality_Check

Contains

- Validation Results
- Duplicate Check
- Date Check
- Confidence Check

---

# Dimension Tables

## Dim_Status

Completed

Failed

Pending

Corrected

---

## Dim_Box

Box

RC Box

Shoe Box

---

## Dim_Date

Year

Quarter

Month

Week

Day

---

## Dim_Operator

Operator Name

Shift

Department

---

# Benefits

✔ Fast Performance

✔ Reusable Measures

✔ Easy Filtering

✔ Enterprise Standard

✔ Optimized for Power BI
