# User Stories

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
|1.0|02-Aug-2026|Malarvizhi S|Initial User Stories Document|

---

# Table of Contents

1. Purpose
2. User Roles
3. Epic Overview
4. User Stories
5. Story Prioritization
6. Story Summary

---

# 1. Purpose

This document defines the business user stories for the AI Cheque Extraction Quality Analytics Platform.

The user stories describe the expectations of different stakeholders interacting with the system. They provide a clear understanding of business needs and help guide development, testing, and acceptance activities.

---

# 2. User Roles

The primary users of the platform are:

- Business User
- Data Analyst
- Operations Executive
- Quality Analyst
- Team Lead
- Management
- System Administrator

---

# 3. Epic Overview

| Epic ID | Epic Name |
|-----------|-------------------------------|
| EP-001 | Batch Management |
| EP-002 | AI Extraction Monitoring |
| EP-003 | Data Validation |
| EP-004 | Manual Correction |
| EP-005 | Data Quality Monitoring |
| EP-006 | Operational Reporting |
| EP-007 | Executive Dashboard |
| EP-008 | Audit Management |

---

# 4. User Stories

---

## US-001 Batch Tracking

**Epic:** EP-001

**As a** Business User

**I want to**

view Box, RC Box, and Shoe Box details

**So that**

I can monitor the processing status of cheque batches.

**Priority**

High

---

## US-002 View Cheque Images

**Epic:** EP-001

**As a** Data Analyst

**I want to**

view cheque image information for each batch

**So that**

I can validate extracted data.

**Priority**

High

---

## US-003 View AI Extracted Data

**Epic:** EP-002

**As a** Data Analyst

**I want to**

view Account Number, Account Name, Cheque Number, Date, and Confidence Score

**So that**

I can validate AI extraction quality.

**Priority**

High

---

## US-004 Validate Leading Zeros

**Epic:** EP-003

**As a** Data Analyst

**I want to**

verify leading zeros are preserved

**So that**

banking information remains accurate.

**Priority**

High

---

## US-005 Validate Duplicate Cheques

**Epic:** EP-003

**As a** Data Analyst

**I want to**

identify duplicate Account Number and Cheque Number combinations

**So that**

duplicate cheque records are prevented.

**Priority**

High

---

## US-006 Validate Historical Dates

**Epic:** EP-003

**As a** Quality Analyst

**I want to**

validate cheque dates fall between 2000 and 2017

**So that**

historical business records remain valid.

**Priority**

High

---

## US-007 Review Low Confidence Records

**Epic:** EP-003

**As a** Quality Analyst

**I want to**

review low-confidence AI extractions

**So that**

business users receive reliable information.

**Priority**

High

---

## US-008 Manual Data Correction

**Epic:** EP-004

**As a** Data Analyst

**I want to**

correct invalid extracted values

**So that**

validated records can be reported accurately.

**Priority**

High

---

## US-009 Track Manual Corrections

**Epic:** EP-004

**As a** Team Lead

**I want to**

review all manual corrections

**So that**

quality standards are maintained.

**Priority**

Medium

---

## US-010 View Audit History

**Epic:** EP-008

**As a** Team Lead

**I want to**

view complete correction history

**So that**

every modification is traceable.

**Priority**

Medium

---

## US-011 Monitor Batch Processing

**Epic:** EP-006

**As a** Operations Executive

**I want to**

monitor processing progress for every Shoe Box

**So that**

processing delays can be identified.

**Priority**

High

---

## US-012 Monitor Productivity

**Epic:** EP-006

**As a** Manager

**I want to**

view images processed per operator

**So that**

I can monitor operational productivity.

**Priority**

High

---

## US-013 View Extraction Accuracy

**Epic:** EP-005

**As a** Manager

**I want to**

view AI extraction accuracy

**So that**

I can evaluate AI performance.

**Priority**

High

---

## US-014 Monitor Validation Failures

**Epic:** EP-005

**As a** Business User

**I want to**

view validation failures

**So that**

data quality issues can be addressed quickly.

**Priority**

High

---

## US-015 Monitor Manual Intervention

**Epic:** EP-005

**As a** Manager

**I want to**

track manual intervention rate

**So that**

I can evaluate AI effectiveness.

**Priority**

Medium

---

## US-016 Executive Dashboard

**Epic:** EP-007

**As a** Senior Management User

**I want to**

view executive KPIs

**So that**

business decisions can be made using operational insights.

**Priority**

High

---

## US-017 Search Cheque Records

**Epic:** EP-002

**As a** Data Analyst

**I want to**

search records using Account Number, Cheque Number, Batch, Box Barcode, RC Box Barcode, or Shoe Box Barcode

**So that**

specific records can be located quickly.

**Priority**

Medium

---

## US-018 Historical Analysis

**Epic:** EP-007

**As a** Business User

**I want to**

analyze historical extraction trends

**So that**

performance improvements can be measured.

**Priority**

Medium

---

## US-019 Review Processing Time

**Epic:** EP-006

**As a** Operations Manager

**I want to**

monitor average processing time for each Shoe Box

**So that**

processing bottlenecks can be identified.

**Priority**

Medium

---

## US-020 Monitor Daily KPIs

**Epic:** EP-007

**As a** Management User

**I want to**

view daily KPIs including processed images, success rate, failure rate, pending validation, and manual corrections

**So that**

overall operational performance can be monitored.

**Priority**

High

---

# 5. Story Prioritization

| Priority | Description |
|-----------|------------------------------|
| High | Required for initial release |
| Medium | Important for business operations |
| Low | Future enhancement |

---

# 6. Story Summary

This document captures the primary business needs of stakeholders interacting with the AI Cheque Extraction Quality Analytics Platform.

The user stories cover the complete operational lifecycle, including batch tracking, AI extraction monitoring, business rule validation, manual correction, audit tracking, operational reporting, productivity monitoring, and executive dashboards.

These user stories provide the foundation for sprint planning, functional development, testing, and acceptance within an Agile Scrum delivery model.
