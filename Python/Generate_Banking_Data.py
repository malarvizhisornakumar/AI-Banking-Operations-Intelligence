"""
===============================================================================
Project : AI Cheque Extraction Quality Analytics Platform
File    : 01_Generate_Banking_Data.py
Author  : Malarvizhi S
===============================================================================
"""

import random
from faker import Faker
import pandas as pd

fake = Faker("en_IN")

TOTAL_RECORDS = 50000

records = []

for i in range(1, TOTAL_RECORDS + 1):

    account_type = random.choice(
        ["Customer", "Corporate", "Manager"]
    )

    if account_type == "Customer":
        account_no = str(random.randint(0,9999999999)).zfill(10)

    elif account_type == "Corporate":
        account_no = str(random.randint(0,99999999)).zfill(
            random.choice([6,7,8])
        )

    else:
        account_no = str(random.randint(0,9999999999999999)).zfill(16)

    cheque_no = str(random.randint(0,999999)).zfill(6)

    confidence = round(random.uniform(70,100),2)

    record = {

        "BoxBarcode":
        f"BOX{random.randint(1,100):03}",

        "RCBoxBarcode":
        f"RC{random.randint(1,500):03}",

        "ShoeBoxBarcode":
        f"SHOE{random.randint(1,2000):04}",

        "AccountNo":
        account_no,

        "AccountName":
        fake.name().upper(),

        "ChequeNo":
        cheque_no,

        "ChequeDate":
        fake.date_between(
            start_date="-20y",
            end_date="-8y"
        ),

        "ConfidenceScore":
        confidence

    }

    records.append(record)

df = pd.DataFrame(records)

print(df.head())

df.to_csv(
    "Generated_Banking_Data.csv",
    index=False
)

print()

print("Dataset Generated Successfully")

print(f"Total Records : {len(df)}")
