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

## Cheque_Quality_Check


| Column | Data Type | Description |
|---------|-----------|-------------|
| ValidationID | INT | Unique validation record identifier |
| ExtractionID | INT | References the VLM Extraction record |
| ValidationStatus | VARCHAR(20) | Overall validation status (Passed, Failed, Manual Review) |
| LeadingZeroValidation | BIT | Indicates whether leading zeros are preserved (1 = Passed, 0 = Failed) |
| AccountLengthValidation | BIT | Indicates whether Account Number length matches business rules |
| MandatoryFieldValidation | BIT | Indicates whether mandatory fields are present |
| DuplicateChequeValidation | BIT | Validates uniqueness of Account Number + Cheque Number combination |
| DateValidation | BIT | Validates cheque date falls within the allowed business period (2000–2017) |
| ConfidenceValidation | BIT | Indicates whether VLM confidence score meets the minimum threshold |
| ValidationRemarks | VARCHAR(500) | Validation comments or failure reason |
| CorrectedFlag | BIT | Indicates whether the record has been manually corrected |
| CorrectedBy | VARCHAR(100) | Analyst who performed manual correction |
| CorrectedOn | DATETIME | Date and time of manual correction |
| FinalStatus | VARCHAR(20) | Final record status after validation (Validated, Corrected, Rejected) |

---

## Processing Log

| Column | Data Type | Description |
|---------|-----------|-------------|
| LogID | INT | Unique processing log identifier |
| BatchID | INT | References Batch Information |
| ProcessStartTime | DATETIME | Batch processing start time |
| ProcessEndTime | DATETIME | Batch processing completion time |
| ProcessingDurationSeconds | INT | Total processing duration in seconds |
| TotalScannedImages | INT | Total cheque images available in the Shoe Box |
| TotalExtractedRecords | INT | Total records extracted by the VLM |
| SuccessfulExtractions | INT | Number of successfully extracted cheque records |
| FailedExtractions | INT | Number of extraction failures before manual correction |
| ManualCorrections | INT | Number of records manually corrected |
| PendingValidation | INT | Number of records awaiting validation |
| ExtractionAccuracy | DECIMAL(5,2) | Percentage of successfully extracted records |
| ProcessingStatus | VARCHAR(20) | Completed, Processing, Failed |
| ModelName | VARCHAR(50) | Vision Language Model used (e.g., Qwen2.5-VL) |
| ModelVersion | VARCHAR(30) | Version of the extraction model |
| CreatedOn | DATETIME | Log creation timestamp |

---

## Manual Correction Audit

| Column | Data Type | Description |
|---------|-----------|-------------|
| AuditID | INT | Unique audit record identifier |
| ExtractionID | INT | References the VLM Extraction record |
| ImageID | INT | References the original cheque image |
| BatchID | INT | References Batch Information |
| FieldName | VARCHAR(100) | Name of the field that was corrected (Account Number, Account Name, Cheque Number, Cheque Date, etc.) |
| OldValue | VARCHAR(500) | Original value extracted by the Vision Language Model |
| NewValue | VARCHAR(500) | Corrected value entered after manual verification |
| CorrectionReason | VARCHAR(255) | Reason for correction (Low Confidence, OCR Failure, Handwriting Issue, Missing Value, Business Rule Validation Failure, etc.) |
| CorrectedBy | VARCHAR(100) | Name or Employee ID of the analyst who corrected the record |
| CorrectionMethod | VARCHAR(50) | Manual OCR / Manual Data Entry / Supervisor Correction |
| CorrectedOn | DATETIME | Date and time when the correction was completed |
| ReviewStatus | VARCHAR(20) | Pending Review, Approved, Rejected |
| ReviewedBy | VARCHAR(100) | Reviewer or Team Lead who verified the correction |
| ReviewedOn | DATETIME | Date and time of review |
| Comments | VARCHAR(500) | Additional remarks or observations |
