/*
===============================================================================
Project Name : AI Cheque Extraction Quality Analytics Platform
Description  : Duplicate Detection Queries
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
1. Duplicate Account Number + Cheque Number
Business Rule: Same Account Number cannot have the same Cheque Number twice.
==============================================================================*/

SELECT

AccountNo,

ChequeNo,

COUNT(*) AS DuplicateCount

FROM Banking.VLM_Extraction

GROUP BY

AccountNo,
ChequeNo

HAVING COUNT(*) > 1;

GO

/*==============================================================================
2. Duplicate Cheque Number Across Different Accounts
==============================================================================*/

SELECT

ChequeNo,

COUNT(DISTINCT AccountNo) AS AccountCount

FROM Banking.VLM_Extraction

GROUP BY

ChequeNo

HAVING COUNT(DISTINCT AccountNo) > 1;

GO

/*==============================================================================
3. Duplicate Image Records
==============================================================================*/

SELECT

ImageID,

COUNT(*) AS DuplicateImages

FROM Banking.VLM_Extraction

GROUP BY ImageID

HAVING COUNT(*) > 1;

GO

/*==============================================================================
4. Duplicate File Names
==============================================================================*/

SELECT

FileName,

COUNT(*) AS DuplicateFiles

FROM Banking.Cheque_Images

GROUP BY FileName

HAVING COUNT(*) > 1;

GO

/*==============================================================================
5. Duplicate Batch Hierarchy
==============================================================================*/

SELECT

BoxBarcode,

RCBoxBarcode,

ShoeBoxBarcode,

COUNT(*) AS DuplicateBatch

FROM Banking.Batch_Information

GROUP BY

BoxBarcode,
RCBoxBarcode,
ShoeBoxBarcode

HAVING COUNT(*) > 1;

GO

/*==============================================================================
6. Duplicate Manual Corrections
==============================================================================*/

SELECT

ExtractionID,

FieldName,

COUNT(*) AS DuplicateCorrections

FROM Banking.Manual_Correction_Audit

GROUP BY

ExtractionID,
FieldName

HAVING COUNT(*) > 1;

GO

/*==============================================================================
7. Records with Same Account Name but Different Account Number
==============================================================================*/

SELECT

AccountName,

COUNT(DISTINCT AccountNo) AS TotalAccounts

FROM Banking.VLM_Extraction

GROUP BY

AccountName

HAVING COUNT(DISTINCT AccountNo) > 1;

GO

/*==============================================================================
8. Duplicate Confidence Scores (Review Only)
==============================================================================*/

SELECT

ConfidenceScore,

COUNT(*) AS TotalRecords

FROM Banking.VLM_Extraction

GROUP BY

ConfidenceScore

HAVING COUNT(*) > 1;

GO

/*==============================================================================
9. Duplicate Dates within Same Account
==============================================================================*/

SELECT

AccountNo,

ChequeDate,

COUNT(*) AS TotalCheques

FROM Banking.VLM_Extraction

GROUP BY

AccountNo,
ChequeDate

HAVING COUNT(*) > 1;

GO

/*==============================================================================
10. Reconciliation Report
Compare Scanned Images vs AI Extractions
==============================================================================*/

SELECT

B.BatchID,

B.TotalScannedImages,

COUNT(DISTINCT I.ImageID) AS ImagesLoaded,

COUNT(DISTINCT V.ExtractionID) AS AIExtractions,

B.TotalScannedImages
- COUNT(DISTINCT V.ExtractionID) AS Difference

FROM Banking.Batch_Information B

LEFT JOIN Banking.Cheque_Images I
ON B.BatchID = I.BatchID

LEFT JOIN Banking.VLM_Extraction V
ON I.ImageID = V.ImageID

GROUP BY

B.BatchID,

B.TotalScannedImages;

GO

PRINT 'Duplicate Detection Completed Successfully';

GO
