# Acceptance Criteria

**Project Name:** AI Cheque Extraction Quality Analytics Platform

**Project Version:** 1.0

**Document Version:** 1.0

**Prepared By:** Malarvizhi S

**Role:** Data Analyst

**Methodology:** Agile Scrum

**Last Updated:** 02-Aug-2026

---

# Document Control

| Version | Date | Author | Description |
|----------|------------|----------------|------------------------------|
|1.0|02-Aug-2026|Malarvizhi S|Initial Acceptance Criteria Document|

---

# Table of Contents

1. Purpose
2. Acceptance Criteria
3. Dashboard Acceptance
4. Reporting Acceptance
5. Summary

---

# 1. Purpose

This document defines the acceptance criteria for the AI Cheque Extraction Quality Analytics Platform.

The acceptance criteria describe the conditions that must be satisfied before a business requirement is considered complete and accepted by stakeholders.

---

# 2. Acceptance Criteria

---

## AC-001 Batch Information

### Requirement

Maintain Box, RC Box, Shoe Box hierarchy.

### Acceptance Criteria

- Every Shoe Box must belong to exactly one RC Box.
- Every RC Box must belong to exactly one Box.
- Every cheque image must belong to one Shoe Box.
- Batch information must be stored successfully.

Status

✅ Accepted when hierarchy is maintained correctly.

---

## AC-002 AI Extraction

### Requirement

Store VLM extracted data.

### Acceptance Criteria

The system shall store:

- Account Number
- Account Name
- Cheque Number
- Cheque Date
- Confidence Score

Status

✅ Accepted when all extracted fields are available in SQL Server.

---

## AC-003 Leading Zero Validation

### Requirement

Preserve leading zeros.

### Acceptance Criteria

Leading zeros shall remain unchanged after storage.

Example

```
0001234567

shall NOT become

1234567
```

Status

✅ Accepted when leading zeros are preserved.

---

## AC-004 Account Number Validation

### Requirement

Validate account number length.

### Acceptance Criteria

Valid account lengths

- Customer → 10 digits
- Corporate → 6–8 digits
- Manager Cheque → 16 digits

Invalid lengths shall be marked for manual review.

---

## AC-005 Mandatory Fields

### Requirement

Mandatory fields shall not be empty.

Required fields

- Account Number
- Account Name
- Cheque Number
- Cheque Date

Acceptance

Any missing field shall fail validation.

---

## AC-006 Duplicate Validation

### Requirement

Prevent duplicate cheque records.

Acceptance

The combination

Account Number + Cheque Number

shall be unique.

Duplicate records shall be flagged.

---

## AC-007 Date Validation

### Requirement

Validate historical cheque dates.

Acceptance

Dates shall be between

01-Jan-2000

and

31-Dec-2017

Dates outside the range shall fail validation.

---

## AC-008 Confidence Validation

### Requirement

Validate AI confidence score.

Acceptance

Records below the configured confidence threshold shall be marked for manual review.

---

## AC-009 Manual Correction

### Requirement

Support manual correction.

Acceptance

The analyst shall be able to update

- Account Number
- Account Name
- Cheque Number
- Cheque Date

All changes shall be recorded.

---

## AC-010 Manual Correction Audit

### Requirement

Maintain audit history.

Acceptance

Every correction shall capture

- Old Value
- New Value
- Corrected By
- Corrected On
- Correction Reason
- Review Status

---

## AC-011 Processing Log

### Requirement

Maintain processing statistics.

Acceptance

Each Shoe Box shall record

- Start Time
- End Time
- Processing Duration
- Total Images
- Successful Extractions
- Failed Extractions
- Manual Corrections

---

## AC-012 Power BI Dashboards

### Requirement

Generate business dashboards.

Acceptance

The platform shall provide

- Executive Dashboard
- Operations Dashboard
- Data Quality Dashboard
- AI Performance Dashboard
- Productivity Dashboard

---

## AC-013 KPI Reporting

Acceptance

The dashboard shall display

- Total Images
- Success Rate
- Failure Rate
- Pending Validation
- Manual Corrections
- Average Processing Time
- Images per Operator
- Images per Shoe Box

---

## AC-014 Search Functionality

Acceptance

Business users shall be able to search records using

- Account Number
- Cheque Number
- Box Barcode
- RC Box Barcode
- Shoe Box Barcode

---

## AC-015 Historical Reporting

Acceptance

Business users shall be able to generate reports by

- Date
- Batch
- Box
- RC Box
- Shoe Box

---

# 3. Dashboard Acceptance

The dashboards shall support:

## Executive Dashboard

- KPI Cards
- Daily Trend
- Success Rate
- Failure Rate

---

## Operations Dashboard

- Processing Status
- Batch Progress
- Shoe Box Progress
- Processing Time

---

## Data Quality Dashboard

- Duplicate Records
- Missing Fields
- Invalid Dates
- Manual Corrections

---

## AI Dashboard

- AI Accuracy
- Confidence Distribution
- Low Confidence Records

---

## Productivity Dashboard

- Images Processed
- Images per Operator
- Average Processing Time
- Daily Productivity

---

# 4. Reporting Acceptance

Reports shall be considered accepted when:

- All KPIs are calculated correctly.
- Business rules are applied successfully.
- SQL data matches Power BI dashboards.
- Historical reports are available.
- Audit history is maintained.
- Manual corrections are reflected in reports.

---

# 5. Summary

The AI Cheque Extraction Quality Analytics Platform shall be considered ready for business use when all acceptance criteria defined in this document are successfully satisfied.

The acceptance criteria ensure that business requirements, validation rules, reporting, dashboards, and audit capabilities meet the expectations of business users, data analysts, operations teams, and management.
