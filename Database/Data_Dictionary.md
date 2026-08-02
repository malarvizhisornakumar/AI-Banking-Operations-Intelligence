# Database Data Dictionary

**Project Name:** AI Cheque Extraction Quality Analytics Platform

**Database Name:** AI_Cheque_Analytics_DB

**Document Version:** 1.0

**Prepared By:** Malarvizhi S

**Role:** Data Analyst

**Last Updated:** 02-Aug-2026

---

# Document Control

| Version | Date | Author | Description |
|----------|------------|----------------|------------------------------|
|1.0|02-Aug-2026|Malarvizhi S|Initial Database Data Dictionary|

---

# Table of Contents

1. Purpose
2. Database Overview
3. Table Definitions
4. Naming Standards
5. Data Type Standards

---

# 1. Purpose

This document defines the database schema, column descriptions, data types, constraints, and business meaning for all tables in the AI_Cheque_Analytics_DB.

It serves as a reference for developers, data analysts, business analysts, QA engineers, and Power BI developers.

---

# 2. Database Overview

| Table | Purpose |
|---------|------------------------------------------|
| Batch_Information | Stores physical batch hierarchy |
| Cheque_Images | Stores scanned cheque image information |
| VLM_Extraction | Stores AI extracted cheque data |
| Cheque_Quality_Check | Stores business validation results |
| Manual_Correction_Audit | Stores manual correction history |
| Processing_Log | Stores batch processing statistics |

---

# 3. Table Definitions

---

# Batch_Information

| Column | Data Type | Constraint | Description |
|----------|------------|-------------|-------------------------------|
| BatchID | INT | PK, Identity | Unique Batch Identifier |
| BoxBarcode | VARCHAR(50) | NOT NULL | Physical Box Barcode |
| RCBoxBarcode | VARCHAR(50) | NOT NULL | RC Box Barcode |
| ShoeBoxBarcode | VARCHAR(50) | NOT NULL | Shoe Box Barcode |
| TotalScannedImages | INT | NOT NULL | Number of scanned cheque images |
| ScanDate | DATE | NOT NULL | Date scanning completed |
| Status | VARCHAR(20) | NOT NULL | Batch Status |

---

# Cheque_Images

| Column | Data Type | Constraint | Description |
|----------|------------|-------------|-------------------------------|
| ImageID | INT | PK, Identity | Unique Image Identifier |
| BatchID | INT | FK | References Batch_Information |
| FileName | VARCHAR(255) | NOT NULL | Image File Name |
| ImagePath | VARCHAR(500) | NOT NULL | Complete Image Path |
| ImageStatus | VARCHAR(20) | NOT NULL | Image Processing Status |

---

# VLM_Extraction

| Column | Data Type | Constraint | Description |
|----------|------------|-------------|-------------------------------|
| ExtractionID | INT | PK, Identity | Unique Extraction Identifier |
| ImageID | INT | FK | References Cheque_Images |
| AccountNo | VARCHAR(30) | NOT NULL | Extracted Account Number |
| AccountName | VARCHAR(255) | NOT NULL | Extracted Account Name |
| ChequeNo | VARCHAR(30) | NOT NULL | Extracted Cheque Number |
| ChequeDate | VARCHAR(30) | NOT NULL | Extracted Cheque Date |
| ConfidenceScore | DECIMAL(5,2) | NOT NULL | AI Confidence Score |
| ExtractionStatus | VARCHAR(20) | NOT NULL | Success / Failed |

---

# Cheque_Quality_Check

| Column | Data Type | Constraint | Description |
|----------|------------|-------------|-------------------------------|
| ValidationID | INT | PK, Identity | Unique Validation Record |
| ExtractionID | INT | FK | References VLM_Extraction |
| ValidationStatus | VARCHAR(20) | NOT NULL | Passed / Failed / Manual Review |
| LeadingZeroValidation | BIT | NOT NULL | Leading Zero Validation Result |
| AccountLengthValidation | BIT | NOT NULL | Account Length Validation Result |
| MandatoryFieldValidation | BIT | NOT NULL | Mandatory Field Validation Result |
| DuplicateChequeValidation | BIT | NOT NULL | Duplicate Validation Result |
| DateValidation | BIT | NOT NULL | Date Validation Result |
| ConfidenceValidation | BIT | NOT NULL | Confidence Validation Result |
| ValidationRemarks | VARCHAR(500) | NULL | Validation Comments |
| CorrectedFlag | BIT | NOT NULL | Manual Correction Indicator |
| CorrectedBy | VARCHAR(100) | NULL | Analyst Name |
| CorrectedOn | DATETIME | NULL | Correction Timestamp |
| FinalStatus | VARCHAR(20) | NOT NULL | Final Status |

---

# Manual_Correction_Audit

| Column | Data Type | Constraint | Description |
|----------|------------|-------------|-------------------------------|
| AuditID | INT | PK, Identity | Unique Audit Identifier |
| ExtractionID | INT | FK | References VLM_Extraction |
| ImageID | INT | FK | References Cheque_Images |
| BatchID | INT | FK | References Batch_Information |
| FieldName | VARCHAR(100) | NOT NULL | Corrected Field |
| OldValue | VARCHAR(500) | NULL | AI Extracted Value |
| NewValue | VARCHAR(500) | NOT NULL | Corrected Value |
| CorrectionReason | VARCHAR(255) | NOT NULL | Reason for Correction |
| CorrectedBy | VARCHAR(100) | NOT NULL | Analyst Name |
| CorrectionMethod | VARCHAR(50) | NOT NULL | Manual OCR / Data Entry |
| CorrectedOn | DATETIME | NOT NULL | Correction Date |
| ReviewStatus | VARCHAR(20) | NOT NULL | Pending / Approved |
| ReviewedBy | VARCHAR(100) | NULL | Reviewer |
| ReviewedOn | DATETIME | NULL | Review Date |
| Comments | VARCHAR(500) | NULL | Additional Remarks |

---

# Processing_Log

| Column | Data Type | Constraint | Description |
|----------|------------|-------------|-------------------------------|
| LogID | INT | PK, Identity | Unique Log Identifier |
| BatchID | INT | FK | References Batch_Information |
| ProcessStartTime | DATETIME | NOT NULL | Batch Start Time |
| ProcessEndTime | DATETIME | NOT NULL | Batch End Time |
| ProcessingDurationSeconds | INT | NOT NULL | Total Processing Time |
| TotalScannedImages | INT | NOT NULL | Total Images |
| TotalExtractedRecords | INT | NOT NULL | Extracted Records |
| SuccessfulExtractions | INT | NOT NULL | Successful Extractions |
| FailedExtractions | INT | NOT NULL | Failed Extractions |
| ManualCorrections | INT | NOT NULL | Manual Corrections |
| PendingValidation | INT | NOT NULL | Pending Records |
| ExtractionAccuracy | DECIMAL(5,2) | NOT NULL | Accuracy Percentage |
| ProcessingStatus | VARCHAR(20) | NOT NULL | Completed / Processing |
| ModelName | VARCHAR(50) | NOT NULL | Vision Language Model Name |
| ModelVersion | VARCHAR(30) | NOT NULL | Model Version |
| CreatedOn | DATETIME | NOT NULL | Record Creation Time |

---

# 4. Naming Standards

The database follows these naming conventions:

- Table Names use PascalCase with underscores.
- Primary Keys end with `ID`.
- Foreign Keys use the parent table identifier.
- Boolean fields use `BIT`.
- Dates use `DATE` or `DATETIME`.
- Text fields use `VARCHAR`.

---

# 5. Data Type Standards

| Data Type | Usage |
|------------|-------|
| INT | Primary Keys, Counts |
| VARCHAR | Text, Barcodes, Account Numbers |
| DATE | Business Dates |
| DATETIME | Audit and Processing Timestamps |
| DECIMAL | Confidence Score, Accuracy |
| BIT | Validation Results (True/False) |

---

# Summary

The Database Data Dictionary provides a standardized reference for all tables, columns, constraints, and business definitions within the AI_Cheque_Analytics_DB.

It ensures consistency across SQL development, Python ETL processes, Power BI dashboards, testing, and future enhancements.
