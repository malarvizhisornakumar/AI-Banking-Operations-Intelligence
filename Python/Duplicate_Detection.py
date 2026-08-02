"""
===============================================================================
Project : AI Cheque Extraction Quality Analytics Platform
File    : 04_Duplicate_Detection.py
Author  : Malarvizhi S
Description : Duplicate Detection Engine
===============================================================================
"""

import pandas as pd

print("=" * 70)
print("DUPLICATE DETECTION ENGINE")
print("=" * 70)

# ------------------------------------------------------------
# Load Data
# ------------------------------------------------------------

df = pd.read_csv("Validated_Banking_Data.csv")

print(f"Total Records Loaded : {len(df)}")

# ------------------------------------------------------------
# Detect Duplicate Account + Cheque
# ------------------------------------------------------------

duplicates = df[
    df.duplicated(
        subset=["AccountNo", "ChequeNo"],
        keep=False
    )
].copy()

# ------------------------------------------------------------
# Sort duplicates
# ------------------------------------------------------------

duplicates = duplicates.sort_values(
    by=["AccountNo", "ChequeNo"]
)

# ------------------------------------------------------------
# Add Duplicate Group Number
# ------------------------------------------------------------

duplicates["DuplicateGroup"] = (
    duplicates
    .groupby(["AccountNo", "ChequeNo"])
    .ngroup() + 1
)

# ------------------------------------------------------------
# Duplicate Summary
# ------------------------------------------------------------

summary = (
    duplicates
    .groupby(["AccountNo", "ChequeNo"])
    .size()
    .reset_index(name="DuplicateCount")
)

# ------------------------------------------------------------
# Save Reports
# ------------------------------------------------------------

duplicates.to_csv(
    "Duplicate_Exception_Report.csv",
    index=False
)

summary.to_csv(
    "Duplicate_Summary.csv",
    index=False
)

# ------------------------------------------------------------
# Console Output
# ------------------------------------------------------------

print("\nDuplicate Detection Completed")

print(f"Duplicate Records Found : {len(duplicates)}")

print(f"Duplicate Groups : {len(summary)}")

print("\nTop Duplicate Groups")

print(summary.head(10))

print("\nReports Generated Successfully")

print("- Duplicate_Exception_Report.csv")

print("- Duplicate_Summary.csv")

print("=" * 70)
