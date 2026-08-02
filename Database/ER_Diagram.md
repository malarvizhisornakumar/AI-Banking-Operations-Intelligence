# Entity Relationship Diagram (ERD)

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
|1.0|02-Aug-2026|Malarvizhi S|Initial ER Diagram Documentation|

---

# Table of Contents

1. Purpose
2. Database Overview
3. Database Tables
4. Entity Relationships
5. Cardinality
6. Relationship Description
7. Logical ER Diagram
8. Summary

---

# 1. Purpose

This document describes the logical Entity Relationship Diagram (ERD) for the AI Cheque Extraction Quality Analytics Platform.

The database is designed to support AI-generated cheque extraction, business rule validation, manual correction, audit tracking, and business reporting.

---

# 2. Database Overview

The solution consists of six core business tables.

| Table Name | Purpose |
|------------|----------------------------------------------|
| Batch_Information | Stores Box, RC Box, Shoe Box information |
| Cheque_Images | Stores scanned cheque image information |
| VLM_Extraction | Stores AI extracted cheque data |
| Cheque_Quality_Check | Stores validation results |
| Manual_Correction_Audit | Stores manual correction history |
| Processing_Log | Stores batch processing statistics |

---

# 3. Database Tables

## 1. Batch_Information

Stores the physical hierarchy.

Contains:

- Box Barcode
- RC Box Barcode
- Shoe Box Barcode
- Total Scanned Images

---

## 2. Cheque_Images

Stores every scanned cheque image.

Each image belongs to one Shoe Box.

---

## 3. VLM_Extraction

Stores AI extracted fields.

Contains:

- Account Number
- Account Name
- Cheque Number
- Cheque Date
- Confidence Score

---

## 4. Cheque_Quality_Check

Stores validation results.

Contains:

- Leading Zero Validation
- Duplicate Validation
- Date Validation
- Mandatory Field Validation
- Final Status

---

## 5. Manual_Correction_Audit

Stores every manual correction.

Contains:

- Old Value
- New Value
- Corrected By
- Corrected On
- Review Status

---

## 6. Processing_Log

Stores operational processing statistics.

Contains:

- Processing Time
- Success Rate
- Failure Rate
- Manual Corrections
- Processing Status

---

# 4. Entity Relationships

## Relationship 1

Batch_Information

↓

Cheque_Images

Relationship

One Batch

↓

Many Images

Cardinality

1 : N

---

## Relationship 2

Cheque_Images

↓

VLM_Extraction

Relationship

One Image

↓

One Extraction Record

Cardinality

1 : 1

---

## Relationship 3

VLM_Extraction

↓

Cheque_Quality_Check

Relationship

One Extraction

↓

One Validation

Cardinality

1 : 1

---

## Relationship 4

VLM_Extraction

↓

Manual_Correction_Audit

Relationship

One Extraction

↓

Many Corrections

Cardinality

1 : N

---

## Relationship 5

Batch_Information

↓

Processing_Log

Relationship

One Batch

↓

One Processing Log

Cardinality

1 : 1

---

# 5. Cardinality Summary

| Parent Table | Child Table | Relationship |
|---------------|---------------------------|--------------|
| Batch_Information | Cheque_Images | One to Many |
| Cheque_Images | VLM_Extraction | One to One |
| VLM_Extraction | Cheque_Quality_Check | One to One |
| VLM_Extraction | Manual_Correction_Audit | One to Many |
| Batch_Information | Processing_Log | One to One |

---

# 6. Relationship Description

## Batch_Information → Cheque_Images

Each Shoe Box contains multiple cheque images.

A cheque image belongs to only one Shoe Box.

---

## Cheque_Images → VLM_Extraction

Every scanned image is processed once by the Vision Language Model.

Each image produces one extraction record.

---

## VLM_Extraction → Cheque_Quality_Check

Every extracted record is validated exactly once.

Validation determines whether the record passes or requires manual review.

---

## VLM_Extraction → Manual_Correction_Audit

Some extracted records require manual correction.

A single extraction may have multiple correction records if several fields are updated.

---

## Batch_Information → Processing_Log

Every processing batch has one processing log recording operational statistics.

---

# 7. Logical ER Diagram

```
+----------------------+
| Batch_Information    |
+----------------------+
| BatchID (PK)         |
| BoxBarcode           |
| RCBoxBarcode         |
| ShoeBoxBarcode       |
| TotalScannedImages   |
+----------+-----------+
           |
           | 1
           |
           | N
+----------v-----------+
| Cheque_Images        |
+----------------------+
| ImageID (PK)         |
| BatchID (FK)         |
| FileName             |
| ImagePath            |
| ImageStatus          |
+----------+-----------+
           |
           | 1
           |
           | 1
+----------v-----------+
| VLM_Extraction       |
+----------------------+
| ExtractionID (PK)    |
| ImageID (FK)         |
| AccountNo            |
| AccountName          |
| ChequeNo             |
| ChequeDate           |
| ConfidenceScore      |
+------+---------+-----+
       |         |
     1 |         | N
       |         |
       |         |
+------v----+   +----------------------------+
| Cheque_   |   | Manual_Correction_Audit    |
| Quality_  |   +----------------------------+
| Check     |   | AuditID (PK)               |
+-----------+   | ExtractionID (FK)          |
|ValidationID|  | FieldName                  |
|ExtractionID|  | OldValue                   |
|FinalStatus |  | NewValue                   |
+------------+  | CorrectedBy                |
                +----------------------------+

+----------------------+
| Processing_Log       |
+----------------------+
| LogID (PK)           |
| BatchID (FK)         |
| ProcessingDuration   |
| SuccessRate          |
| FailureRate          |
+----------------------+
```

---

# 8. Summary

The Entity Relationship Diagram defines the logical structure of the AI_Cheque_Analytics_DB database.

The relationships ensure:

- Data consistency
- Referential integrity
- Efficient reporting
- Audit traceability
- Scalable database design

This ERD serves as the foundation for SQL table creation, foreign key relationships, Power BI data modeling, and future system enhancements.
