# Business Process Flow

**Project Name:** AI Cheque Extraction Quality Analytics Platform

**Project Version:** 1.0

**Document Version:** 1.0

**Prepared By:** Malarvizhi S

**Role:** Data Analyst

**Last Updated:** 02-Aug-2026

---

# Document Control

| Version | Date | Author | Description |
|----------|------------|----------------|------------------------------|
|1.0|02-Aug-2026|Malarvizhi S|Initial Business Process Flow Document|

---

# Table of Contents

1. Purpose
2. Business Workflow
3. Folder Structure
4. AI Extraction Workflow
5. Validation Workflow
6. Manual Correction Workflow
7. Database Workflow
8. Dashboard Workflow
9. End-to-End Process Flow
10. Process Summary

---

# 1. Purpose

This document describes the end-to-end business workflow of the AI Cheque Extraction Quality Analytics Platform.

The workflow begins with physical cheque scanning and ends with business reporting through Power BI dashboards.

---

# 2. Business Workflow

The overall business process consists of the following stages:

1. Physical Cheque Collection
2. Document Scanning
3. Folder Organization
4. Vision Language Model (VLM) Extraction
5. SQL Server Data Storage
6. Business Rule Validation
7. Manual Correction
8. Audit Logging
9. KPI Calculation
10. Power BI Dashboard
11. Business Decision Making

---

# 3. Folder Structure

Each scanned cheque follows the hierarchy below.

```

BOX Barcode

↓

RC BOX Barcode

↓

SHOE BOX Barcode

↓

Cheque Images (.tif)

```

Example

```

BOX001
│
└── RC001
│
├── SHOE001
│ ├── 000001.tif
│ ├── 000002.tif
│ └── ...
│
├── SHOE002
│ ├── 000001.tif
│ └── ...
│
└── SHOE003
├── 000001.tif
└── ...

```

Each Shoe Box normally contains approximately **2,000–3,000 cheque images**.

---

# 4. AI Extraction Workflow

The Vision Language Model processes each cheque image.

Extracted Fields

- Account Number
- Account Name
- Cheque Number
- Cheque Date
- Confidence Score

The extracted data is automatically stored in SQL Server.

---

# 5. Validation Workflow

Every extracted record is validated using business rules.

Validation includes:

- Leading Zero Validation
- Mandatory Field Validation
- Duplicate Validation
- Date Validation
- Account Number Length Validation
- Confidence Validation
- Folder Hierarchy Validation

Validation Results

- Passed
- Manual Review Required

---

# 6. Manual Correction Workflow

If validation fails,

the record enters manual correction.

Workflow

```

AI Extraction

↓

Validation Failed

↓

Manual OCR

OR

Manual Data Entry

↓

Quality Review

↓

Database Update

↓

Audit Entry

```

Every correction is recorded in the Manual_Correction_Audit table.

---

# 7. Database Workflow

Validated records are stored in SQL Server.

Main Tables

- Batch_Information
- Cheque_Images
- VLM_Extraction
- Cheque_Quality_Check
- Manual_Correction_Audit
- Processing_Log

These tables support reporting, auditing, and analytics.

---

# 8. Dashboard Workflow

Power BI connects to SQL Server.

Dashboards include:

## Executive Dashboard

- Total Images
- Success Rate
- Failure Rate
- Pending Validation
- Batch Completion

---

## Operations Dashboard

- Processing Status
- Shoe Box Progress
- RC Box Progress
- Box Progress
- Processing Time

---

## Data Quality Dashboard

- Duplicate Cheques
- Invalid Dates
- Missing Fields
- Low Confidence Records
- Manual Corrections

---

## AI Performance Dashboard

- AI Accuracy
- Confidence Distribution
- Manual Intervention Rate
- Validation Trend

---

## Productivity Dashboard

- Images per Operator
- Average Processing Time
- Daily Productivity
- Batch Completion

---

# 9. End-to-End Process Flow

```

Physical Cheques

↓

Scanning

↓

Folder Hierarchy

↓

Vision Language Model

↓

SQL Server

↓

Business Rule Validation

↓

┌───────────────┐

│ Validation │

│ Passed │

└──────┬────────┘

↓

Power BI Dashboard

↓

Business Insights

↓

Management

OR

┌───────────────┐

│ Validation │

│ Failed │

└──────┬────────┘

↓

Manual OCR

OR

Manual Data Entry

↓

Quality Review

↓

Manual Correction Audit

↓

SQL Server Update

↓

Power BI Dashboard

↓

Business Insights

↓

Management

```

---

# 10. Process Summary

The AI Cheque Extraction Quality Analytics Platform transforms AI-extracted cheque information into reliable business intelligence.

The workflow ensures:

- Accurate cheque data
- Business rule compliance
- Data quality monitoring
- Complete audit history
- Operational visibility
- AI performance monitoring
- Executive reporting
- Data-driven decision making

The platform enables organizations to monitor cheque digitization projects efficiently while maintaining high standards of data quality and operational excellence.
