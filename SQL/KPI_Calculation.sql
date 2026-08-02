/*
===============================================================================
Project Name : AI Cheque Extraction Quality Analytics Platform
Description  : KPI Calculation Queries
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
1. Total Scanned Images
==============================================================================*/

SELECT
SUM(TotalScannedImages) AS TotalScannedImages
FROM Banking.Batch_Information;

GO

/*==============================================================================
2. Total AI Extractions
==============================================================================*/

SELECT
COUNT(*) AS TotalExtractions
FROM Banking.VLM_Extraction;

GO

/*==============================================================================
3. AI Extraction Success Rate
==============================================================================*/

SELECT

CAST(
(
SUM(SuccessfulExtractions) * 100.0
/
SUM(TotalExtractedRecords)
)
AS DECIMAL(5,2)
)
AS SuccessRate

FROM Banking.Processing_Log;

GO

/*==============================================================================
4. AI Extraction Failure Rate
==============================================================================*/

SELECT

CAST(
(
SUM(FailedExtractions) * 100.0
/
SUM(TotalExtractedRecords)
)
AS DECIMAL(5,2)
)
AS FailureRate

FROM Banking.Processing_Log;

GO

/*==============================================================================
5. Manual Correction Rate
==============================================================================*/

SELECT

CAST(
(
SUM(ManualCorrections) * 100.0
/
SUM(TotalExtractedRecords)
)
AS DECIMAL(5,2)
)
AS ManualCorrectionRate

FROM Banking.Processing_Log;

GO

/*==============================================================================
6. Pending Validation Rate
==============================================================================*/

SELECT

CAST(
(
SUM(PendingValidation) * 100.0
/
SUM(TotalExtractedRecords)
)
AS DECIMAL(5,2)
)
AS PendingValidationRate

FROM Banking.Processing_Log;

GO

/*==============================================================================
7. Average AI Confidence Score
==============================================================================*/

SELECT

AVG(ConfidenceScore) AS AverageConfidence

FROM Banking.VLM_Extraction;

GO

/*==============================================================================
8. Average Processing Time
==============================================================================*/

SELECT

AVG(ProcessingDurationSeconds) AS AverageProcessingTimeSeconds

FROM Banking.Processing_Log;

GO

/*==============================================================================
9. Total Manual Corrections
==============================================================================*/

SELECT

COUNT(*) AS TotalCorrections

FROM Banking.Manual_Correction_Audit;

GO

/*==============================================================================
10. Duplicate Cheques
==============================================================================*/

SELECT

COUNT(*) AS DuplicateGroups

FROM
(
SELECT

AccountNo,

ChequeNo

FROM Banking.VLM_Extraction

GROUP BY

AccountNo,

ChequeNo

HAVING COUNT(*)>1

) D;

GO

/*==============================================================================
11. Low Confidence Records
==============================================================================*/

SELECT

COUNT(*) AS LowConfidenceRecords

FROM Banking.VLM_Extraction

WHERE ConfidenceScore<80;

GO

/*==============================================================================
12. Images Processed Per Operator
==============================================================================*/

SELECT

CorrectedBy,

COUNT(*) AS ImagesProcessed

FROM Banking.Manual_Correction_Audit

GROUP BY CorrectedBy

ORDER BY ImagesProcessed DESC;

GO

/*==============================================================================
13. Daily Processing Summary
==============================================================================*/

SELECT

CAST(ProcessStartTime AS DATE) AS ProcessingDate,

SUM(TotalScannedImages) AS Images,

SUM(SuccessfulExtractions) AS Successful,

SUM(FailedExtractions) AS Failed,

SUM(ManualCorrections) AS ManualCorrections

FROM Banking.Processing_Log

GROUP BY

CAST(ProcessStartTime AS DATE)

ORDER BY ProcessingDate;

GO

/*==============================================================================
14. Batch Completion Rate
==============================================================================*/

SELECT

CAST(
(
COUNT(
CASE
WHEN ProcessingStatusID = 2 THEN 1
END
)
*100.0
/
COUNT(*)
)
AS DECIMAL(5,2)
)
AS BatchCompletionRate

FROM Banking.Processing_Log;

GO

/*==============================================================================
15. Executive KPI Summary
==============================================================================*/

SELECT

SUM(TotalScannedImages) AS TotalImages,

SUM(TotalExtractedRecords) AS TotalExtracted,

SUM(SuccessfulExtractions) AS Successful,

SUM(FailedExtractions) AS Failed,

SUM(ManualCorrections) AS ManualCorrections,

AVG(ExtractionAccuracy) AS AverageAccuracy,

AVG(ProcessingDurationSeconds) AS AvgProcessingTime

FROM Banking.Processing_Log;

GO

PRINT 'KPI Calculation Completed Successfully';

GO
