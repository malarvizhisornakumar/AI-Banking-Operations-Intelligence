"""
===============================================================================
Project : AI Cheque Extraction Quality Analytics Platform
File    : 03_Data_Validation.py
Author  : Malarvizhi S
Description : Business Rule Validation Engine
===============================================================================
"""

import pandas as pd

print("=" * 70)
print("AI CHEQUE VALIDATION ENGINE")
print("=" * 70)

# ------------------------------------------------------------
# Load Data
# ------------------------------------------------------------

df = pd.read_csv("Validated_Banking_Data.csv")

print(f"Records Loaded : {len(df)}")

# ------------------------------------------------------------
# Validation Report
# ------------------------------------------------------------

validation_results = []

# ------------------------------------------------------------
# BR-001 Account Number Length
# ------------------------------------------------------------

valid_lengths = [6, 7, 8, 10, 16]

invalid_account = df[
    ~df["AccountNo"].astype(str).str.len().isin(valid_lengths)
]

for _, row in invalid_account.iterrows():

    validation_results.append({
        "RuleID":"BR001",
        "Rule":"Invalid Account Length",
        "ChequeNo":row["ChequeNo"],
        "AccountNo":row["AccountNo"],
        "Status":"FAILED"
    })

# ------------------------------------------------------------
# BR-002 Mandatory Fields
# ------------------------------------------------------------

mandatory = df[
    df[
        [
            "AccountNo",
            "AccountName",
            "ChequeNo",
            "ChequeDate"
        ]
    ].isnull().any(axis=1)
]

for _, row in mandatory.iterrows():

    validation_results.append({

        "RuleID":"BR002",

        "Rule":"Mandatory Field Missing",

        "ChequeNo":row["ChequeNo"],

        "AccountNo":row["AccountNo"],

        "Status":"FAILED"

    })

# ------------------------------------------------------------
# BR-003 Duplicate Account + Cheque
# ------------------------------------------------------------

duplicates = df[
    df.duplicated(
        subset=["AccountNo","ChequeNo"],
        keep=False
    )
]

for _, row in duplicates.iterrows():

    validation_results.append({

        "RuleID":"BR003",

        "Rule":"Duplicate Cheque",

        "ChequeNo":row["ChequeNo"],

        "AccountNo":row["AccountNo"],

        "Status":"FAILED"

    })

# ------------------------------------------------------------
# BR-004 Confidence Validation
# ------------------------------------------------------------

low_confidence = df[
    df["ConfidenceScore"] < 80
]

for _, row in low_confidence.iterrows():

    validation_results.append({

        "RuleID":"BR004",

        "Rule":"Low Confidence",

        "ChequeNo":row["ChequeNo"],

        "AccountNo":row["AccountNo"],

        "Status":"MANUAL REVIEW"

    })

# ------------------------------------------------------------
# BR-005 Date Validation
# ------------------------------------------------------------

df["ChequeDate"] = pd.to_datetime(df["ChequeDate"])

invalid_dates = df[
    (df["ChequeDate"] < "2000-01-01") |
    (df["ChequeDate"] > "2017-12-31")
]

for _, row in invalid_dates.iterrows():

    validation_results.append({

        "RuleID":"BR005",

        "Rule":"Invalid Date",

        "ChequeNo":row["ChequeNo"],

        "AccountNo":row["AccountNo"],

        "Status":"FAILED"

    })

# ------------------------------------------------------------
# Generate Validation Report
# ------------------------------------------------------------

validation_df = pd.DataFrame(validation_results)

validation_df.to_csv(

    "Validation_Report.csv",

    index=False

)

print()

print("Validation Report Generated")

print()

print(validation_df.head())

# ------------------------------------------------------------
# Summary
# ------------------------------------------------------------

print()

print("=" * 70)

print("VALIDATION SUMMARY")

print("=" * 70)

print()

print(f"Total Records : {len(df)}")

print(f"Validation Issues : {len(validation_df)}")

print()

print(validation_df["Rule"].value_counts())

print()

print("=" * 70)

print("Validation Completed Successfully")

print("=" * 70)
