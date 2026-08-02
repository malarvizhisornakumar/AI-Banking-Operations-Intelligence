/*
===============================================================================
Project Name : AI Cheque Extraction Quality Analytics Platform
Description  : Business Rule Validation Queries
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
BR-001 : Leading Zero Validation
==============================================================================*/

SELECT
ExtractionID,
AccountNo,
ChequeNo
FROM Banking.VLM_Extraction
WHERE LEFT(AccountNo,1) <> '0'
AND LEN(AccountNo)=10;

GO

/*==============================================================================
BR-002 : Account Number Length Validation
Customer : 10
Corporate : 6-8
Manager : 16
==============================================================================*/

SELECT
ExtractionID,
AccountNo,
LEN(AccountNo) AS AccountLength
FROM Banking.VLM_Extraction
WHERE LEN(AccountNo)
NOT IN (6,7,8,10,16);

GO

/*==============================================================================
BR-003 : Mandatory Fields Validation
==============================================================================*/

SELECT
ExtractionID,
AccountNo,
AccountName,
ChequeNo,
ChequeDate
FROM Banking.VLM_Extraction
WHERE

AccountNo IS NULL
OR AccountName IS NULL
OR ChequeNo IS NULL
OR ChequeDate IS NULL;

GO

/*==============================================================================
BR-004 : Duplicate Account + Cheque Validation
==============================================================================*/

SELECT

AccountNo,

ChequeNo,

COUNT(*) DuplicateCount

FROM Banking.VLM_Extraction

GROUP BY

AccountNo,
ChequeNo

HAVING COUNT(*)>1;

GO

/*==============================================================================
BR-005 : Historical Date Validation
==============================================================================*/

SELECT *

FROM Banking.VLM_Extraction

WHERE

ChequeDate<'2000-01-01'

OR

ChequeDate>'2017-12-31';

GO

/*==============================================================================
BR-006 : Confidence Score Validation
==============================================================================*/

SELECT

ExtractionID,

ConfidenceScore

FROM Banking.VLM_Extraction

WHERE ConfidenceScore<80;

GO

/*==============================================================================
BR-007 : Folder Hierarchy Validation
==============================================================================*/

SELECT

BatchID,

BoxBarcode,

RCBoxBarcode,

ShoeBoxBarcode

FROM Banking.Batch_Information

WHERE

BoxBarcode IS NULL

OR RCBoxBarcode IS NULL

OR ShoeBoxBarcode IS NULL;

GO

/*==============================================================================
BR-008 : Batch Image Count Validation
==============================================================================*/

SELECT

B.BatchID,

B.TotalScannedImages,

COUNT(I.ImageID) ImagesStored

FROM Banking.Batch_Information B

LEFT JOIN Banking.Cheque_Images I

ON B.BatchID=I.BatchID

GROUP BY

B.BatchID,

B.TotalScannedImages

HAVING

B.TotalScannedImages<>COUNT(I.ImageID);

GO

/*==============================================================================
BR-009 : One Image = One Extraction
==============================================================================*/

SELECT

ImageID,

COUNT(*) ExtractionCount

FROM Banking.VLM_Extraction

GROUP BY ImageID

HAVING COUNT(*)>1;

GO

/*==============================================================================
BR-010 : Manual Correction Pending Review
==============================================================================*/

SELECT

AuditID,

CorrectedBy,

ReviewStatusID

FROM Banking.Manual_Correction_Audit

WHERE ReviewStatusID<>6;

GO

/*==============================================================================
BR-011 : Processing Completion Validation
==============================================================================*/

SELECT

BatchID,

ProcessingStatusID,

PendingValidation

FROM Banking.Processing_Log

WHERE

ProcessingStatusID=2

AND PendingValidation>0;

GO

/*==============================================================================
BR-012 : Extraction Accuracy Check
==============================================================================*/

SELECT

BatchID,

ExtractionAccuracy

FROM Banking.Processing_Log

WHERE ExtractionAccuracy<95;

GO

PRINT 'Business Rule Validation Completed Successfully';

GO
