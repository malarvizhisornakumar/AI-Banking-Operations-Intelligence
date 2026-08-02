/*
===============================================================================
Project Name    : AI Cheque Extraction Quality Analytics Platform
Database Name   : AI_Cheque_Analytics_DB
Version         : 1.0
Author          : Malarvizhi S
Description     : Sample Data Script
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
Insert Status Master
==============================================================================*/

INSERT INTO Banking.Dim_Status
(StatusName, StatusDescription)

VALUES
('Processing','Batch is currently processing'),
('Completed','Processing completed successfully'),
('Failed','Processing failed'),
('Pending Validation','Awaiting manual validation'),
('Corrected','Record corrected manually'),
('Approved','Correction approved');
GO

/*==============================================================================
Insert Error Types
==============================================================================*/

INSERT INTO Banking.Dim_Error_Type
(ErrorName, ErrorDescription)

VALUES
('Duplicate Cheque','Duplicate Account Number and Cheque Number'),
('Invalid Date','Cheque Date outside valid business period'),
('Missing Account Number','Account Number is blank'),
('Missing Account Name','Account Name is blank'),
('Low Confidence','AI confidence below threshold'),
('Invalid Account Length','Account Number length is invalid');
GO

/*==============================================================================
Insert Batch Information
==============================================================================*/

INSERT INTO Banking.Batch_Information
(
BoxBarcode,
RCBoxBarcode,
ShoeBoxBarcode,
TotalScannedImages,
ScanDate,
StatusID
)

VALUES

('BOX001','RC001','SHOE001',2500,'2016-06-10',2),

('BOX001','RC001','SHOE002',2300,'2016-06-10',2),

('BOX001','RC001','SHOE003',2400,'2016-06-10',1);

GO

/*==============================================================================
Insert Cheque Images
==============================================================================*/

INSERT INTO Banking.Cheque_Images
(
BatchID,
FileName,
ImagePath,
ImageStatusID
)

VALUES

(1,'CHK000001.tif','D:\ChequeData\BOX001\RC001\SHOE001\CHK000001.tif',2),

(1,'CHK000002.tif','D:\ChequeData\BOX001\RC001\SHOE001\CHK000002.tif',2),

(2,'CHK000003.tif','D:\ChequeData\BOX001\RC001\SHOE002\CHK000003.tif',2);

GO

/*==============================================================================
Insert VLM Extraction
==============================================================================*/

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

(1,'0012345678','RAMESH KUMAR','000123','2016-06-01',99.30,2),

(2,'0098765432','PRIYA SHARMA','000124','2015-12-25',96.80,2),

(3,'123456','ABC INDUSTRIES','000125','2014-04-18',78.40,4);

GO

/*==============================================================================
Insert Quality Check
==============================================================================*/

INSERT INTO Banking.Cheque_Quality_Check
(
ExtractionID,
ValidationStatusID,
LeadingZeroValidation,
AccountLengthValidation,
MandatoryFieldValidation,
DuplicateChequeValidation,
DateValidation,
ConfidenceValidation,
ValidationRemarks,
CorrectedFlag,
FinalStatusID
)

VALUES

(1,2,1,1,1,1,1,1,'Validated Successfully',0,2),

(2,2,1,1,1,1,1,1,'Validated Successfully',0,2),

(3,4,1,1,1,1,1,0,'Low Confidence',1,5);

GO

/*==============================================================================
Insert Manual Correction Audit
==============================================================================*/

INSERT INTO Banking.Manual_Correction_Audit
(
ExtractionID,
ImageID,
BatchID,
FieldName,
OldValue,
NewValue,
ErrorTypeID,
CorrectionReason,
CorrectedBy,
CorrectionMethod,
ReviewStatusID,
ReviewedBy,
ReviewedOn,
Comments
)

VALUES

(
3,
3,
2,
'AccountName',
'ABC INDUSTRES',
'ABC INDUSTRIES',
5,
'Handwriting correction',
'Analyst01',
'Manual Data Entry',
6,
'TeamLead01',
GETDATE(),
'Corrected successfully'
);

GO

/*==============================================================================
Insert Processing Log
==============================================================================*/

INSERT INTO Banking.Processing_Log
(
BatchID,
ProcessStartTime,
ProcessEndTime,
ProcessingDurationSeconds,
TotalScannedImages,
TotalExtractedRecords,
SuccessfulExtractions,
FailedExtractions,
ManualCorrections,
PendingValidation,
ExtractionAccuracy,
ProcessingStatusID,
ModelName,
ModelVersion
)

VALUES

(
1,
'2016-06-10 09:00:00',
'2016-06-10 09:42:00',
2520,
2500,
2500,
2488,
12,
8,
4,
99.52,
2,
'Qwen2.5-VL',
'2.5'
),

(
2,
'2016-06-10 10:00:00',
'2016-06-10 10:38:00',
2280,
2300,
2300,
2291,
9,
5,
2,
99.61,
2,
'Qwen2.5-VL',
'2.5'
);

GO

PRINT 'Sample Data Inserted Successfully';

GO
