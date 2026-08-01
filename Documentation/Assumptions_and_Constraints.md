# Assumptions and Constraints

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
|1.0|02-Aug-2026|Malarvizhi S|Initial Assumptions and Constraints Document|

---

# Table of Contents

1. Purpose
2. Project Assumptions
3. Business Assumptions
4. Technical Assumptions
5. Project Constraints
6. Business Constraints
7. Technical Constraints
8. Dependencies
9. Risks
10. Future Considerations
11. Summary

---

# 1. Purpose

This document identifies the assumptions, constraints, dependencies, and known limitations applicable to the AI Cheque Extraction Quality Analytics Platform.

Understanding these assumptions and constraints helps stakeholders manage project expectations and supports future project planning.

---

# 2. Project Assumptions

The following assumptions have been made during solution design.

- The Vision Language Model (VLM) has already extracted cheque information.
- The extraction process is completed before validation begins.
- SQL Server is available for storing extracted and validated data.
- Power BI is available for reporting and dashboard development.
- Business users have access to required reports and dashboards.
- All project documentation is maintained using GitHub.

---

# 3. Business Assumptions

The following business assumptions apply.

- Each scanned image represents one cheque.
- Every cheque belongs to one Shoe Box.
- Every Shoe Box belongs to one RC Box.
- Every RC Box belongs to one Box.
- Shoe Boxes generally contain approximately 2,000–3,000 cheque images.
- Account Number and Cheque Number must preserve leading zeros.
- Handwritten fields may require manual validation.
- Historical cheque dates are expected to fall between 01-Jan-2000 and 31-Dec-2017.
- Failed records can be manually corrected before final reporting.
- Corrected records become part of the validated dataset.

---

# 4. Technical Assumptions

The following technical assumptions are considered.

- SQL Server is the primary relational database.
- Power BI connects directly to SQL Server.
- Business validation rules are applied after AI extraction.
- Confidence scores are available for every extracted record.
- Batch processing statistics are recorded for every Shoe Box.
- Manual correction history is maintained in the audit table.
- Database backups are managed outside the scope of this project.

---

# 5. Project Constraints

The following constraints define the project boundaries.

- The project does not perform cheque scanning.
- The project does not develop or train the Vision Language Model.
- OCR engine development is outside project scope.
- Core banking transaction processing is outside project scope.
- Customer account maintenance is outside project scope.
- The project focuses only on analytics, validation, reporting, and audit.

---

# 6. Business Constraints

The following business rules limit project implementation.

- Historical cheque dates are limited to the approved business period (2000–2017).
- Duplicate Account Number + Cheque Number combinations are not permitted.
- Mandatory business fields cannot remain blank after validation.
- Records failing validation require manual review before reporting.
- Only validated or corrected records are considered for final reporting.

---

# 7. Technical Constraints

The following technical limitations apply.

- The platform depends on the availability of SQL Server.
- Dashboard accuracy depends on the quality of extracted data.
- AI extraction quality depends on the upstream Vision Language Model.
- Manual correction workload increases if AI confidence decreases.
- Processing performance depends on batch size and available system resources.

---

# 8. Dependencies

The successful operation of the platform depends on the following components.

| Dependency | Purpose |
|------------|---------|
| Vision Language Model | Extract cheque information |
| SQL Server | Store extracted and validated data |
| Power BI | Reporting and dashboards |
| Business Rules | Validate extracted information |
| Manual Review Process | Correct failed extractions |
| GitHub | Maintain project documentation and version control |

---

# 9. Risks

| Risk | Business Impact | Mitigation |
|------|-----------------|------------|
| Poor handwriting | Incorrect extraction | Manual review process |
| Low AI confidence | Increased manual effort | Confidence-based validation |
| Missing mandatory fields | Reporting errors | Business rule validation |
| Duplicate cheque records | Data integrity issues | Duplicate validation |
| SQL Server performance | Slow reporting | Query optimization and indexing |
| Incorrect manual correction | Poor data quality | Review and audit workflow |
| Large batch sizes | Increased processing time | Batch monitoring and KPI tracking |

---

# 10. Future Considerations

The platform has been designed to support future enhancements.

Potential future improvements include:

- Real-time processing dashboards
- Automated email notifications
- AI-based anomaly detection
- Trend forecasting
- Predictive workload estimation
- REST API integration
- Cloud deployment
- Role-based access control
- Automated SLA monitoring
- Multi-bank support
- Additional document types
- Advanced AI quality scoring

---

# 11. Summary

The assumptions and constraints documented in this specification establish the operational boundaries of the AI Cheque Extraction Quality Analytics Platform.

The solution assumes that AI-based cheque extraction is completed before analytics begin and focuses on business validation, data quality, auditability, operational reporting, and management dashboards.

Clearly documenting these assumptions and constraints ensures that project stakeholders share a common understanding of the solution scope, limitations, dependencies, and future enhancement opportunities.
