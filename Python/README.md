# Python ETL Pipeline

## Overview

This module simulates an enterprise banking data processing pipeline for AI-based cheque extraction.

---

## Pipeline Flow

```
Generate Data
      ↓
ETL Pipeline
      ↓
Data Validation
      ↓
Duplicate Detection
      ↓
KPI Generation
      ↓
SQL Server
      ↓
Power BI Dashboard
```

---

## Scripts

| Script | Purpose |
|----------|----------|
| 01_Generate_Banking_Data.py | Generate realistic banking data |
| 02_ETL_Pipeline.py | Extract, Transform, Load |
| 03_Data_Validation.py | Apply business rules |
| 04_Duplicate_Detection.py | Detect duplicate cheque records |
| 05_KPI_Generator.py | Generate KPIs |
| 06_Load_SQL_Server.py | Load validated data into SQL Server |
| 07_Config.py | Centralized configuration |

---

## Technologies

- Python
- Pandas
- Faker
- SQL Server
- PyODBC
- Power BI

---

## Output

- Validated_Banking_Data.csv
- Validation_Report.csv
- Duplicate_Exception_Report.csv
- KPI_Report.csv

---

## Author

**Malarvizhi S**
