/*
===============================================================================
Project Name : AI Cheque Extraction Quality Analytics Platform
Description  : Dashboard Queries for Power BI
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
Dashboard 1 : Executive Summary
==============================================================================*/

SELECT

SUM(TotalScannedImages) AS TotalImages,

SUM(TotalExtractedRecords) AS TotalExtractions,

SUM(SuccessfulExtractions) AS SuccessfulExtractions,

SUM(FailedExtractions) AS FailedExtractions,

SUM(ManualCorrections) AS ManualCorrections,

AVG(ExtractionAccuracy) AS AverageAccuracy

FROM Banking.Processing_Log;

GO

/*==============================================================================
Dashboard 2 : Batch Processing Status
==============================================================================*/

SELECT

B.BatchID,

B.BoxBarcode,

B.RCBoxBarcode,

B.ShoeBoxBarcode,

P.TotalScannedImages,

P.SuccessfulExtractions,

P.FailedExtractions,

P.PendingValidation,

P.ExtractionAccuracy,

DS.StatusName AS ProcessingStatus

FROM Banking.Batch_Information B

INNER JOIN Banking.Processing_Log P

ON B.BatchID=P.BatchID

INNER JOIN Banking.Dim_Status DS

ON P.ProcessingStatusID=DS.StatusID;

GO

/*==============================================================================
Dashboard 3 : AI Performance
==============================================================================*/

SELECT

AccountNo,

ChequeNo,

ConfidenceScore,

DS.StatusName AS ExtractionStatus

FROM Banking.VLM_Extraction V

INNER JOIN Banking.Dim_Status DS

ON V.ExtractionStatusID=DS.StatusID;

GO

/*==============================================================================
Dashboard 4 : Low Confidence Records
==============================================================================*/

SELECT

ExtractionID,

AccountNo,

AccountName,

ChequeNo,

ChequeDate,

ConfidenceScore

FROM Banking.VLM_Extraction

WHERE ConfidenceScore < 80

ORDER BY ConfidenceScore;

GO

/*==============================================================================
Dashboard 5 : Data Quality Summary
==============================================================================*/

SELECT

COUNT(*) AS TotalValidated,

SUM(CASE WHEN FinalStatusID=2 THEN 1 ELSE 0 END) AS Passed,

SUM(CASE WHEN FinalStatusID=3 THEN 1 ELSE 0 END) AS Failed,

SUM(CASE WHEN CorrectedFlag=1 THEN 1 ELSE 0 END) AS Corrected

FROM Banking.Cheque_Quality_Check;

GO

/*==============================================================================
Dashboard 6 : Duplicate Cheques
==============================================================================*/

SELECT

AccountNo,

ChequeNo,

COUNT(*) AS DuplicateCount

FROM Banking.VLM_Extraction

GROUP BY

AccountNo,

ChequeNo

HAVING COUNT(*)>1;

GO

/*==============================================================================
Dashboard 7 : Manual Corrections
==============================================================================*/

SELECT

CorrectedBy,

COUNT(*) AS TotalCorrections

FROM Banking.Manual_Correction_Audit

GROUP BY CorrectedBy

ORDER BY TotalCorrections DESC;

GO

/*==============================================================================
Dashboard 8 : Daily Processing Trend
==============================================================================*/

SELECT

CAST(ProcessStartTime AS DATE) AS ProcessingDate,

SUM(TotalScannedImages) AS TotalImages,

SUM(SuccessfulExtractions) AS Successful,

SUM(FailedExtractions) AS Failed

FROM Banking.Processing_Log

GROUP BY

CAST(ProcessStartTime AS DATE)

ORDER BY ProcessingDate;

GO

/*==============================================================================
Dashboard 9 : Batch Productivity
==============================================================================*/

SELECT

BatchID,

ProcessingDurationSeconds,

TotalScannedImages,

ExtractionAccuracy

FROM Banking.Processing_Log

ORDER BY ExtractionAccuracy DESC;

GO

/*==============================================================================
Dashboard 10 : Operator Productivity
==============================================================================*/

SELECT

CorrectedBy,

COUNT(*) AS CorrectionsCompleted,

MIN(CorrectedOn) AS FirstCorrection,

MAX(CorrectedOn) AS LastCorrection

FROM Banking.Manual_Correction_Audit

GROUP BY CorrectedBy

ORDER BY CorrectionsCompleted DESC;

GO

PRINT 'Dashboard Queries Created Successfully';

GO
