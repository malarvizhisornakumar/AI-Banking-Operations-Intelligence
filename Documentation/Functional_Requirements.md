# Functional Requirements Specification (FRS)

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
|1.0|02-Aug-2026|Malarvizhi S|Initial Functional Requirements Specification|

---

# Table of Contents

1. Purpose
2. Functional Modules
3. Functional Requirements
4. Input Data
5. Output Reports
6. Validation Workflow
7. Exception Handling
8. Reporting Requirements
9. Functional Dependency Matrix

---

# 1. Purpose

This document defines the functional requirements of the AI Cheque Extraction Quality Analytics Platform.

The purpose of the platform is to validate, monitor, analyze, and report cheque data extracted by an existing Vision Language Model (VLM). The platform provides operational dashboards, data quality monitoring, business rule validation, manual correction tracking, and management reporting.

---

# 2. Functional Modules

The solution consists of the following functional modules:

- Batch Management
- Cheque Image Management
- AI Extraction Monitoring
- Data Validation
- Manual Correction
- Audit Tracking
- Processing Monitoring
- KPI Reporting
- Dashboard Analytics

---

# 3. Functional Requirements

## FR-001 Batch Management

### Description

The system shall maintain batch information for every processed Shoe Box.

### Inputs

- Box Barcode
- RC Box Barcode
- Shoe Box Barcode
- Total Scanned Images

### Outputs

- Batch Information
- Processing Status

---

## FR-002 Cheque Image Registration

### Description

The system shall register every cheque image processed within a Shoe Box.

### Inputs

- Image File Name
- Image Path
- Batch ID

### Outputs

- Image Registration
- Image Status

---

## FR-003 AI Extraction Monitoring

### Description

The system shall store AI extracted cheque information received from the Vision Language Model.

### Inputs

- Account Number
- Account Name
- Cheque Number
- Cheque Date
- Confidence Score

### Outputs

- Extraction Status
- Confidence Metrics

---

## FR-004 Business Rule Validation

### Description

The system shall validate every extracted record using predefined business rules.

### Validation Rules

- Leading Zero Validation
- Mandatory Field Validation
- Duplicate Cheque Validation
- Date Validation
- Account Number Length Validation
- Confidence Validation

### Outputs

- Validation Status
- Validation Remarks

---

## FR-005 Duplicate Detection

### Description

The system shall verify that the combination of:

Account Number + Cheque Number

is unique.

### Outputs

- Duplicate Flag
- Validation Failure

---

## FR-006 Manual Correction

### Description

If validation fails, the system shall allow manual correction of extracted fields.

### Editable Fields

- Account Number
- Account Name
- Cheque Number
- Cheque Date

### Outputs

- Updated Record
- Correction Audit

---

## FR-007 Manual Correction Audit

### Description

Every manual correction shall be recorded.

The system shall capture:

- Old Value
- New Value
- Corrected By
- Correction Date
- Correction Reason
- Review Status

---

## FR-008 Processing Monitoring

### Description

The system shall record processing statistics for every Shoe Box.

### Metrics

- Processing Start Time
- Processing End Time
- Processing Duration
- Total Images
- Successful Extractions
- Failed Extractions
- Pending Validation
- Manual Corrections

---

## FR-009 Dashboard Generation

### Description

The system shall provide Power BI dashboards for business users.

### Dashboard Categories

- Executive Dashboard
- Operations Dashboard
- Data Quality Dashboard
- AI Extraction Dashboard
- Productivity Dashboard

---

## FR-010 KPI Reporting

The system shall generate KPIs including:

- Total Images Processed
- Extraction Success Rate
- Extraction Failure Rate
- Manual Correction Count
- Pending Validation
- Average Processing Time
- Images per Shoe Box
- Images per Operator
- Batch Completion Rate

---

## FR-011 Search Functionality

Business users shall be able to search records using:

- Account Number
- Cheque Number
- Box Barcode
- RC Box Barcode
- Shoe Box Barcode
- Batch ID

---

## FR-012 Historical Reporting

The system shall support historical reporting by:

- Date
- Batch
- Box
- RC Box
- Shoe Box

---

## FR-013 Exception Reporting

The system shall generate exception reports for:

- Duplicate Cheques
- Invalid Dates
- Missing Mandatory Fields
- Low Confidence Extractions
- Failed Validations

---

## FR-014 AI Performance Monitoring

The system shall monitor AI extraction quality.

Metrics include:

- Average Confidence Score
- Low Confidence Records
- Manual Intervention Rate
- AI Success Rate

---

## FR-015 Audit Reporting

The system shall generate audit reports showing:

- Manual Corrections
- Reviewer Information
- Correction Timeline
- Correction Reason
- Field-wise Changes

---

# 4. Input Data

The system receives data from the existing AI extraction engine.

## Input Fields

- Box Barcode
- RC Box Barcode
- Shoe Box Barcode
- Image Name
- Account Number
- Account Name
- Cheque Number
- Cheque Date
- Confidence Score

---

# 5. Output Reports

The system shall generate:

- Daily Operations Report
- Batch Summary Report
- Extraction Accuracy Report
- Manual Correction Report
- Productivity Report
- Data Quality Report
- Executive KPI Dashboard

---

# 6. Validation Workflow

```
Cheque Image

↓

Vision Language Model

↓

SQL Server

↓

Business Rule Validation

↓

Passed
      ↓
Reporting

OR

Failed
      ↓
Manual Correction

↓

Quality Review

↓

Database Update

↓

Power BI Dashboard
```

---

# 7. Exception Handling

The system shall identify and report:

- Duplicate Records
- Missing Account Number
- Missing Account Name
- Missing Cheque Number
- Invalid Date
- Invalid Account Length
- Low Confidence Records

Every exception shall be available for manual review.

---

# 8. Reporting Requirements

The platform shall support reporting for:

## Operations

- Daily Batch Processing
- Shoe Box Progress
- Box Completion

---

## Quality

- Validation Success Rate
- Validation Failure Rate
- Manual Corrections

---

## AI

- Confidence Distribution
- AI Accuracy
- Manual Intervention

---

## Productivity

- Images Processed per Operator
- Average Processing Time
- Daily Productivity

---

## Executive

- Overall KPI Summary
- Processing Trend
- Success Trend
- Failure Trend

---

# 9. Functional Dependency Matrix

| Module | Depends On |
|----------|----------------------------|
|Batch Management|Folder Hierarchy|
|Cheque Images|Batch Management|
|VLM Extraction|Cheque Images|
|Validation|VLM Extraction|
|Manual Correction|Validation|
|Audit|Manual Correction|
|Processing Log|Validation|
|Power BI Dashboard|All Modules|
|Executive Reports|Power BI Dashboard|

---

# Functional Summary

The AI Cheque Extraction Quality Analytics Platform provides end-to-end functionality for monitoring AI-based cheque extraction, validating business-critical data, supporting manual correction workflows, maintaining audit history, tracking operational KPIs, and delivering business intelligence dashboards for management.

The functional design ensures that extracted cheque data is validated, traceable, measurable, and suitable for enterprise reporting while improving operational efficiency and data quality.
