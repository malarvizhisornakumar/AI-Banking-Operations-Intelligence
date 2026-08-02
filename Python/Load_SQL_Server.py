"""
===============================================================================
Project : AI Cheque Extraction Quality Analytics Platform
File    : 06_Load_SQL_Server.py
Author  : Malarvizhi S
Description : Load Validated Data into SQL Server
===============================================================================
Before Running Install the required packages:
pip install pyodbc pandas
"""

import pandas as pd
import pyodbc
from datetime import datetime

print("=" * 70)
print("SQL SERVER DATA LOADER")
print("=" * 70)

# ------------------------------------------------------------
# Configuration
# ------------------------------------------------------------

SERVER = r"localhost\\SQLEXPRESS"      # Change to your SQL Server
DATABASE = "AI_Cheque_Analytics_DB"

CONNECTION_STRING = (
    f"DRIVER={{ODBC Driver 17 for SQL Server}};"
    f"SERVER={SERVER};"
    f"DATABASE={DATABASE};"
    "Trusted_Connection=yes;"
)

# ------------------------------------------------------------
# Connect
# ------------------------------------------------------------

try:

    conn = pyodbc.connect(CONNECTION_STRING)

    cursor = conn.cursor()

    print("Connected Successfully")

except Exception as e:

    print("Connection Failed")

    print(e)

    exit()

# ------------------------------------------------------------
# Load CSV
# ------------------------------------------------------------

df = pd.read_csv("Validated_Banking_Data.csv")

print(f"Records Loaded : {len(df)}")

# ------------------------------------------------------------
# Insert into SQL Server
# ------------------------------------------------------------

success = 0

failed = 0

for _, row in df.iterrows():

    try:

        cursor.execute("""

        INSERT INTO Banking.VLM_Extraction
        (

            ImageID,

            AccountNo,

            AccountName,

            ChequeNo,

            ChequeDate,

            ConfidenceScore,

            ExtractionStatusID

        )

        VALUES

        (

            ?,

            ?,

            ?,

            ?,

            ?,

            ?,

            ?

        )

        """,

        1,

        row["AccountNo"],

        row["AccountName"],

        row["ChequeNo"],

        row["ChequeDate"],

        float(row["ConfidenceScore"]),

        2

        )

        success += 1

    except Exception:

        failed += 1

conn.commit()

cursor.close()

conn.close()

# ------------------------------------------------------------
# Summary
# ------------------------------------------------------------

print()

print("=" * 70)

print("LOAD SUMMARY")

print("=" * 70)

print()

print(f"Successful Inserts : {success}")

print(f"Failed Inserts     : {failed}")

print()

print("Load Completed Successfully")

print("=" * 70)
