"""
===============================================================================
Project : AI Cheque Extraction Quality Analytics Platform
File    : 05_KPI_Generator.py
Author  : Malarvizhi S
Description : Business KPI Generator
===============================================================================
"""

import pandas as pd

print("=" * 70)
print("BANKING KPI GENERATOR")
print("=" * 70)

# ------------------------------------------------------------
# Load Data
# ------------------------------------------------------------

etl_df = pd.read_csv("Validated_Banking_Data.csv")
validation_df = pd.read_csv("Validation_Report.csv")
duplicates_df = pd.read_csv("Duplicate_Exception_Report.csv")

print(f"Validated Records : {len(etl_df)}")

# ------------------------------------------------------------
# KPI Calculations
# ------------------------------------------------------------

total_records = len(etl_df)

successful_records = len(
    etl_df[etl_df["ValidationStatus"] == "Passed"]
)

manual_review = len(
    etl_df[etl_df["ValidationStatus"] == "Manual Review"]
)

duplicate_records = len(duplicates_df)

failed_records = len(validation_df)

success_rate = round(
    (successful_records / total_records) * 100,
    2
)

failure_rate = round(
    (failed_records / total_records) * 100,
    2
)

manual_rate = round(
    (manual_review / total_records) * 100,
    2
)

duplicate_rate = round(
    (duplicate_records / total_records) * 100,
    2
)

average_confidence = round(
    etl_df["ConfidenceScore"].mean(),
    2
)

highest_confidence = round(
    etl_df["ConfidenceScore"].max(),
    2
)

lowest_confidence = round(
    etl_df["ConfidenceScore"].min(),
    2
)

# ------------------------------------------------------------
# KPI DataFrame
# ------------------------------------------------------------

kpi = pd.DataFrame({

    "KPI":[

        "Total Records",

        "Successful Records",

        "Failed Records",

        "Manual Review",

        "Duplicate Records",

        "Success Rate",

        "Failure Rate",

        "Manual Review Rate",

        "Duplicate Rate",

        "Average Confidence",

        "Highest Confidence",

        "Lowest Confidence"

    ],

    "Value":[

        total_records,

        successful_records,

        failed_records,

        manual_review,

        duplicate_records,

        success_rate,

        failure_rate,

        manual_rate,

        duplicate_rate,

        average_confidence,

        highest_confidence,

        lowest_confidence

    ]

})

# ------------------------------------------------------------
# Save KPI Report
# ------------------------------------------------------------

kpi.to_csv(

    "KPI_Report.csv",

    index=False

)

# ------------------------------------------------------------
# Console Output
# ------------------------------------------------------------

print()

print("=" * 70)

print("BUSINESS KPI SUMMARY")

print("=" * 70)

print()

print(kpi)

print()

print("=" * 70)

print("KPI Report Generated Successfully")

print("=" * 70)
