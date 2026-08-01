# Business Requirements Document (BRD)

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
|1.0|02-Aug-2026|Malarvizhi S|Initial Business Requirements Document|

---

# Table of Contents

1. Introduction
2. Business Background
3. Problem Statement
4. Business Objectives
5. Project Scope
6. Stakeholders
7. Current Business Process
8. Proposed Business Process
9. Business Requirements
10. Success Criteria
11. Risks
12. Future Enhancements

---

# 1. Introduction

The AI Cheque Extraction Quality Analytics Platform is designed to support the validation, monitoring, and reporting of cheque data extracted using Vision Language Models (VLM).

The platform focuses on improving data quality, monitoring extraction performance, tracking operational productivity, and providing business insights through SQL Server and Power BI dashboards.

The VLM extraction engine is considered an existing upstream system. This project focuses on the analytics, validation, reporting, and operational monitoring layers.

---

# 2. Business Background

Financial institutions process millions of historical cheque images as part of digitization and archival initiatives.

Each cheque image undergoes AI-based extraction to identify important business fields such as:

- Account Number
- Account Name
- Cheque Number
- Cheque Date

Although AI significantly reduces manual effort, extracted data still requires business validation before being used for downstream reporting and archival.

The organization requires a centralized analytics platform capable of monitoring extraction quality, identifying validation failures, tracking operational KPIs, and supporting manual correction workflows.

---

# 3. Problem Statement

The organization currently processes thousands of cheque images per batch using AI-powered extraction.

Business challenges include:

- Validation of handwritten cheque fields
- Preservation of leading zeros in Account Number and Cheque Number
- Detection of duplicate cheque records
- Monitoring extraction accuracy
- Tracking manual correction workload
- Measuring processing productivity
- Identifying low-confidence AI predictions
- Providing management dashboards for operational monitoring

Without centralized analytics, business users cannot efficiently monitor extraction quality or operational performance.

---

# 4. Business Objectives

The primary objectives of this project are:

- Improve overall cheque data quality.
- Validate AI extracted cheque information using business rules.
- Reduce manual validation effort.
- Monitor AI extraction performance.
- Track operator productivity.
- Measure processing turnaround time.
- Provide centralized Power BI dashboards.
- Support business decision-making using operational KPIs.
- Maintain complete audit history for manual corrections.

---

# 5. Project Scope

## In Scope

The project includes:

- Banking cheque metadata analysis
- Folder hierarchy tracking
- Batch management
- AI extracted data validation
- SQL Server database
- Data quality validation
- Duplicate detection
- Manual correction tracking
- Operational KPI reporting
- Power BI dashboards
- AI insight generation
- Audit reporting

---

## Out of Scope

The following items are outside the project scope:

- Cheque image scanning
- Vision Language Model development
- AI model training
- OCR engine development
- Banking transaction processing
- Customer account management
- Core banking applications

---

# 6. Stakeholders

| Stakeholder | Responsibility |
|--------------------------|-------------------------------------------|
|Business Users|Monitor extraction performance|
|Operations Team|Process cheque batches|
|Data Analysts|Validate extracted data|
|Quality Assurance Team|Review manual corrections|
|Project Manager|Monitor project delivery|
|Management|Review operational dashboards|
|IT Support Team|Maintain SQL Server environment|

---

# 7. Current Business Process

The current process consists of the following steps:

1. Physical cheques are scanned.
2. Images are organized into:
   - Box
   - RC Box
   - Shoe Box
3. Vision Language Model extracts cheque information.
4. Extracted data is stored in SQL Server.
5. Data Analysts validate extracted information.
6. Failed records undergo manual correction.
7. Corrected records are updated.
8. Reports are generated for management.

---

# 8. Proposed Business Process

The proposed analytics platform introduces centralized monitoring and validation.

Workflow:

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

Manual Correction

↓

Quality Approval

↓

Power BI Dashboards

↓

Business Insights

↓

Management Reporting

---

# 9. Business Requirements

## BR-001

The system shall maintain Box, RC Box and Shoe Box hierarchy for every cheque image.

---

## BR-002

The system shall preserve leading zeros in Account Number and Cheque Number.

---

## BR-003

The system shall validate Account Number length according to business rules.

---

## BR-004

The system shall identify duplicate cheque records using:

Account Number + Cheque Number

---

## BR-005

The system shall validate cheque dates within the historical business period.

Allowed Range:

01-Jan-2000

to

31-Dec-2017

---

## BR-006

The system shall record VLM confidence scores.

---

## BR-007

The system shall support manual correction for failed extractions.

---

## BR-008

The system shall maintain complete correction audit history.

---

## BR-009

The system shall monitor processing time for each Shoe Box.

---

## BR-010

The system shall provide operational dashboards for management.

---

## BR-011

The system shall monitor extraction accuracy.

---

## BR-012

The system shall generate KPI reports for:

- Total Images
- Success Rate
- Failure Rate
- Manual Corrections
- Pending Validation
- Processing Time
- Productivity

---

# 10. Success Criteria

The project will be considered successful if:

- All mandatory fields are validated.
- Duplicate cheque detection is implemented.
- Leading zeros are preserved.
- Historical date validation is completed.
- AI extraction quality is measurable.
- Manual corrections are traceable.
- Management dashboards are available.
- Business KPIs are updated automatically.

---

# 11. Risks

| Risk | Impact | Mitigation |
|-------------------------|------------|----------------------------|
|Poor handwritten quality|High|Manual correction workflow|
|Low AI confidence|Medium|Quality validation|
|Missing mandatory fields|High|Business rule validation|
|Duplicate records|High|Duplicate detection logic|
|Database performance|Medium|SQL indexing and optimization|

---

# 12. Future Enhancements

Future releases may include:

- Real-time monitoring dashboards
- Predictive extraction quality analysis
- AI-powered anomaly detection
- Automated business recommendations
- Email alert notifications
- Batch SLA monitoring
- Integration with workflow management systems
- Role-based user access
- REST API integration
- Cloud deployment

---

# Business Value

The AI Cheque Extraction Quality Analytics Platform provides a centralized solution for monitoring AI extraction quality, validating business-critical cheque information, tracking operational performance, and enabling data-driven decision-making through interactive dashboards and quality metrics.

The solution reduces manual effort, improves reporting accuracy, enhances operational visibility, and supports continuous improvement of AI-assisted cheque digitization processes.
