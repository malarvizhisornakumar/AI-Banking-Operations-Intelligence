# Data Dictionary

## Batch Information

| Column | Data Type | Description |
|---------|-----------|-------------|
| BatchID | INT | Unique identifier for each Shoe Box batch |
| BoxBarcode | VARCHAR(50) | Physical Box barcode |
| RCBoxBarcode | VARCHAR(50) | RC Box barcode |
| ShoeBoxBarcode | VARCHAR(50) | Shoe Box barcode |
| TotalScannedImages | INT | Total cheque images scanned in the Shoe Box |
| ScanDate | DATE | Date when scanning was completed |
| Status | VARCHAR(20) | Batch status (Completed, Processing, Failed) |

---

## Cheque Images

| Column | Data Type | Description |
|---------|-----------|-------------|
| ImageID | INT | Unique image identifier |
| BatchID | INT | References Batch Information |
| FileName | VARCHAR(255) | Cheque image file name |
| ImagePath | VARCHAR(500) | Complete folder path |
| ImageStatus | VARCHAR(20) | Processing status |

---

## VLM Extraction

| Column | Data Type | Description |
|---------|-----------|-------------|
| ExtractionID | INT | Unique extraction record |
| ImageID | INT | References Cheque Images |
| AccountNo | VARCHAR(30) | Extracted account number (leading zeros preserved) |
| AccountName | VARCHAR(255) | Handwritten account name |
| ChequeNo | VARCHAR(30) | Extracted cheque number (leading zeros preserved) |
| ChequeDate | VARCHAR(50) | Original extracted date before normalization |
| ConfidenceScore | DECIMAL(5,2) | VLM confidence score |
| ExtractionStatus | VARCHAR(20) | Success / Failed |

---

## Validation Result

| Column | Data Type | Description |
|---------|-----------|-------------|
| ValidationID | INT | Validation record |
| ExtractionID | INT | References VLM Extraction |
| ValidationStatus | VARCHAR(20) | Passed / Failed |
| ErrorType | VARCHAR(100) | Validation failure reason |
| Comments | VARCHAR(255) | Analyst comments |
