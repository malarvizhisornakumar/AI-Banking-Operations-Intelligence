# Project Glossary

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
|1.0|02-Aug-2026|Malarvizhi S|Initial Project Glossary|

---

# Table of Contents

1. Purpose
2. Business Terms
3. Technical Terms
4. Database Terms
5. AI & Analytics Terms
6. Reporting Terms
7. Project Acronyms

---

# 1. Purpose

This document provides standardized definitions for business, technical, database, AI, and reporting terminology used throughout the AI Cheque Extraction Quality Analytics Platform.

It serves as a common reference for Business Users, Data Analysts, Developers, QA Engineers, Project Managers, and Management.

---

# 2. Business Terms

| Term | Definition |
|------|------------|
| Batch | A processing unit representing one Shoe Box of cheque images. |
| Box | The highest level of the physical storage hierarchy containing RC Boxes. |
| RC Box | A container inside a Box that holds one or more Shoe Boxes. |
| Shoe Box | The lowest physical storage unit containing approximately 2,000–3,000 cheque images. |
| Cheque Image | A scanned image representing a single cheque. |
| Manual Review | The process of validating or correcting AI-extracted data by a human analyst. |
| Manual Correction | Updating incorrect AI-extracted values after verification. |
| Validation | Checking extracted data against predefined business rules. |
| Batch Completion | Status indicating that all images in a Shoe Box have been processed and validated. |

---

# 3. Technical Terms

| Term | Definition |
|------|------------|
| SQL Server | Relational Database Management System used for storing and querying project data. |
| Power BI | Business Intelligence platform used to create dashboards and reports. |
| ETL | Extract, Transform, Load process used to prepare data for reporting. |
| Data Validation | Process of verifying data accuracy and completeness. |
| Data Quality | Measurement of the accuracy, consistency, completeness, and reliability of data. |
| Audit Trail | Historical record of all manual corrections and system changes. |
| Repository | GitHub project containing all documentation, SQL scripts, Python code, and dashboards. |
| Version Control | Process of tracking and managing changes using Git and GitHub. |

---

# 4. Database Terms

| Term | Definition |
|------|------------|
| Database | Collection of structured tables used to store project data. |
| Table | Structured collection of rows and columns. |
| Record | A single row within a table. |
| Column | A field representing one attribute of a record. |
| Primary Key | Unique identifier for each record in a table. |
| Foreign Key | Column that establishes a relationship between two tables. |
| View | Virtual table created using SQL queries. |
| Stored Procedure | Reusable SQL program that performs predefined operations. |
| Index | Database object that improves query performance. |
| Constraint | Rule that ensures data integrity. |

---

# 5. AI & Analytics Terms

| Term | Definition |
|------|------------|
| VLM | Vision Language Model used to extract information from cheque images. |
| Confidence Score | AI-generated probability indicating extraction reliability. |
| AI Extraction | Automated extraction of cheque fields using a Vision Language Model. |
| OCR | Optical Character Recognition technology used to recognize printed or handwritten text. |
| Handwritten Data | Text manually written on the cheque, such as Account Name or Date. |
| AI Accuracy | Percentage of correctly extracted cheque records. |
| Manual Intervention | Human review and correction of AI-generated results. |
| Business Insight | Meaningful information derived from validated data to support decision-making. |

---

# 6. Reporting Terms

| Term | Definition |
|------|------------|
| KPI | Key Performance Indicator used to measure operational performance. |
| Dashboard | Interactive Power BI report displaying business metrics. |
| Executive Dashboard | High-level dashboard designed for management. |
| Operations Dashboard | Dashboard for monitoring daily processing activities. |
| Data Quality Dashboard | Dashboard highlighting validation issues and correction statistics. |
| Productivity Dashboard | Dashboard measuring operator and batch performance. |
| Trend Analysis | Evaluation of performance changes over time. |
| Drill Through | Power BI feature that allows users to navigate from summary data to detailed records. |
| Slicer | Interactive Power BI filter used to refine report data. |

---

# 7. Project Acronyms

| Acronym | Full Form |
|----------|-----------|
| AI | Artificial Intelligence |
| VLM | Vision Language Model |
| OCR | Optical Character Recognition |
| ETL | Extract, Transform, Load |
| SQL | Structured Query Language |
| BI | Business Intelligence |
| KPI | Key Performance Indicator |
| QA | Quality Assurance |
| BRD | Business Requirements Document |
| FRS | Functional Requirements Specification |
| NFR | Non-Functional Requirements |
| UAT | User Acceptance Testing |
| SLA | Service Level Agreement |
| API | Application Programming Interface |

---

# Summary

The Project Glossary establishes a common vocabulary for all stakeholders involved in the AI Cheque Extraction Quality Analytics Platform.

Using standardized terminology improves communication, reduces ambiguity, supports consistent documentation, and ensures alignment across business analysis, development, testing, reporting, and project management activities.
