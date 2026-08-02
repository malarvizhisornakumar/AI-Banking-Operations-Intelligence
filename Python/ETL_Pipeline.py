"""
===============================================================================
Project : AI Cheque Extraction Quality Analytics Platform
File    : 02_ETL_Pipeline.py
Author  : Malarvizhi S
Description : ETL Pipeline
===============================================================================
"""

import pandas as pd

# ----------------------------------------------------
# STEP 1 : Extract
# ----------------------------------------------------

print("=" * 60)
print("STEP 1 : Extracting Data")
print("=" * 60)

df = pd.read_csv("Generated_Banking_Data.csv")

print(f"Total Records Loaded : {len(df)}")

# ----------------------------------------------------
# STEP 2 : Transform
# ----------------------------------------------------

print("\nSTEP 2 : Transforming Data")

# Remove duplicate records
df = df.drop_duplicates()

# Remove leading/trailing spaces
df["AccountNo"] = df["AccountNo"].astype(str).str.strip()
df["AccountName"] = df["AccountName"].astype(str).str.strip().str.upper()
df["ChequeNo"] = df["ChequeNo"].astype(str).str.strip()

# Convert date column
df["ChequeDate"] = pd.to_datetime(df["ChequeDate"])

# Preserve leading zeros
df["AccountNo"] = df["AccountNo"].str.zfill(10)

df["ChequeNo"] = df["ChequeNo"].str.zfill(6)

print("Transformation Completed")

# ----------------------------------------------------
# STEP 3 : Validation
# ----------------------------------------------------

print("\nSTEP 3 : Data Validation")

df["ValidationStatus"] = "Passed"

# Confidence Validation
df.loc[df["ConfidenceScore"] < 80, "ValidationStatus"] = "Manual Review"

# Date Validation
df.loc[
    (df["ChequeDate"] < "2000-01-01") |
    (df["ChequeDate"] > "2017-12-31"),
    "ValidationStatus"
] = "Invalid Date"

# Duplicate Validation
duplicates = df.duplicated(
    subset=["AccountNo", "ChequeNo"],
    keep=False
)

df.loc[duplicates, "ValidationStatus"] = "Duplicate"

print(df["ValidationStatus"].value_counts())

# ----------------------------------------------------
# STEP 4 : Load
# ----------------------------------------------------

print("\nSTEP 4 : Saving Clean Data")

df.to_csv(
    "Validated_Banking_Data.csv",
    index=False
)

print("Validated_Banking_Data.csv Created Successfully")

print("=" * 60)
print("ETL Pipeline Completed Successfully")
print("=" * 60)
