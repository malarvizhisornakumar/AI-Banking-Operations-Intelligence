/*
===============================================================================
Project Name : AI Cheque Extraction Quality Analytics Platform
Description  : SQL View Testing & Validation
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
TEST 1 : Verify Executive KPI View
==============================================================================*/

PRINT 'TEST 1 : Executive KPI View';

SELECT *
FROM Banking.vw_Executive_KPI;

GO

/*==============================================================================
TEST 2 : Verify Batch Processing Summary View
==============================================================================*/

PRINT 'TEST 2 : Batch Processing Summary';

SELECT *
FROM Banking.vw_Batch_Processing_Summary;

GO

/*==============================================================================
TEST 3 : Verify AI Extraction Report View
==============================================================================*/

PRINT 'TEST 3 : AI Extraction Report';

SELECT *
FROM Banking.vw_AI_Extraction_Report;

GO

/*==============================================================================
TEST 4 : Verify Data Quality Report View
==============================================================================*/

PRINT 'TEST 4 : Data Quality Report';

SELECT *
FROM Banking.vw_Data_Quality_Report;

GO

/*==============================================================================
TEST 5 : Verify Manual Corrections View
==============================================================================*/

PRINT 'TEST 5 : Manual Corrections';

SELECT *
FROM Banking.vw_Manual_Corrections;

GO

/*==============================================================================
TEST 6 : Verify Duplicate Cheques View
==============================================================================*/

PRINT 'TEST 6 : Duplicate Cheques';

SELECT *
FROM Banking.vw_Duplicate_Cheques;

GO

/*==============================================================================
TEST 7 : Verify Low Confidence View
==============================================================================*/

PRINT 'TEST 7 : Low Confidence';

SELECT *
FROM Banking.vw_Low_Confidence;

GO

/*==============================================================================
TEST 8 : Verify Daily Processing View
==============================================================================*/

PRINT 'TEST 8 : Daily Processing';

SELECT *
FROM Banking.vw_Daily_Processing;

GO

/*==============================================================================
TEST 9 : Verify Operator Productivity View
==============================================================================*/

PRINT 'TEST 9 : Operator Productivity';

SELECT *
FROM Banking.vw_Operator_Productivity;

GO

/*==============================================================================
TEST 10 : Verify Batch Validation View
==============================================================================*/

PRINT 'TEST 10 : Batch Validation';

SELECT *
FROM Banking.vw_Batch_Validation;

GO

/*==============================================================================
TEST 11 : Row Count Validation
==============================================================================*/

PRINT 'TEST 11 : Row Count Validation';

SELECT 'vw_AI_Extraction_Report' AS ViewName,
COUNT(*) AS TotalRows
FROM Banking.vw_AI_Extraction_Report

UNION ALL

SELECT 'vw_Data_Quality_Report',
COUNT(*)
FROM Banking.vw_Data_Quality_Report

UNION ALL

SELECT 'vw_Manual_Corrections',
COUNT(*)
FROM Banking.vw_Manual_Corrections

UNION ALL

SELECT 'vw_Daily_Processing',
COUNT(*)
FROM Banking.vw_Daily_Processing;

GO

/*==============================================================================
TEST 12 : Null Validation
==============================================================================*/

PRINT 'TEST 12 : Null Validation';

SELECT *
FROM Banking.vw_AI_Extraction_Report
WHERE
AccountNo IS NULL
OR AccountName IS NULL
OR ChequeNo IS NULL;

GO

/*==============================================================================
TEST 13 : Duplicate Validation
==============================================================================*/

PRINT 'TEST 13 : Duplicate Validation';

SELECT
AccountNo,
ChequeNo,
COUNT(*) AS DuplicateCount
FROM Banking.vw_AI_Extraction_Report
GROUP BY
AccountNo,
ChequeNo
HAVING COUNT(*) > 1;

GO

/*==============================================================================
TEST 14 : Low Confidence Validation
==============================================================================*/

PRINT 'TEST 14 : Low Confidence Validation';

SELECT *
FROM Banking.vw_Low_Confidence
WHERE ConfidenceScore >= 80;

GO

/*==============================================================================
TEST 15 : KPI Accuracy Validation
==============================================================================*/

PRINT 'TEST 15 : KPI Accuracy';

SELECT

SUM(TotalScannedImages) AS TotalImages,

SUM(SuccessfulExtractions) AS Successful,

SUM(FailedExtractions) AS Failed,

AVG(ExtractionAccuracy) AS AverageAccuracy

FROM Banking.Processing_Log;

GO

/*==============================================================================
TEST 16 : Referential Integrity Check
==============================================================================*/

PRINT 'TEST 16 : Referential Integrity';

SELECT
V.ImageID
FROM Banking.VLM_Extraction V
LEFT JOIN Banking.Cheque_Images I
ON V.ImageID = I.ImageID
WHERE I.ImageID IS NULL;

GO

/*==============================================================================
TEST 17 : Batch Reconciliation
==============================================================================*/

PRINT 'TEST 17 : Batch Reconciliation';

SELECT

B.BatchID,

B.TotalScannedImages,

COUNT(I.ImageID) AS ImagesLoaded,

COUNT(V.ExtractionID) AS AIExtractions

FROM Banking.Batch_Information B

LEFT JOIN Banking.Cheque_Images I
ON B.BatchID = I.BatchID

LEFT JOIN Banking.VLM_Extraction V
ON I.ImageID = V.ImageID

GROUP BY

B.BatchID,
B.TotalScannedImages;

GO

PRINT 'All View Tests Executed Successfully';

GO
