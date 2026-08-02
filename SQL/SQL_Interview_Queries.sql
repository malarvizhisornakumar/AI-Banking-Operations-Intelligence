/*
===============================================================================
Project Name : AI Cheque Extraction Quality Analytics Platform
Description  : SQL Interview Queries
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
Q1. Display all cheque records with batch details.
==============================================================================*/

SELECT

V.ExtractionID,
V.AccountNo,
V.AccountName,
V.ChequeNo,
B.BoxBarcode,
B.RCBoxBarcode,
B.ShoeBoxBarcode

FROM Banking.VLM_Extraction V

INNER JOIN Banking.Cheque_Images I
ON V.ImageID = I.ImageID

INNER JOIN Banking.Batch_Information B
ON I.BatchID = B.BatchID;

GO

/*==============================================================================
Q2. Find Top 10 Highest Confidence Extractions
==============================================================================*/

SELECT TOP 10

ExtractionID,
AccountNo,
ChequeNo,
ConfidenceScore

FROM Banking.VLM_Extraction

ORDER BY ConfidenceScore DESC;

GO

/*==============================================================================
Q3. Find Lowest Confidence Extractions
==============================================================================*/

SELECT TOP 10

ExtractionID,
AccountNo,
ChequeNo,
ConfidenceScore

FROM Banking.VLM_Extraction

ORDER BY ConfidenceScore;

GO

/*==============================================================================
Q4. Count Total Cheques Processed Per Batch
==============================================================================*/

SELECT

BatchID,

COUNT(*) AS TotalCheques

FROM Banking.Cheque_Images

GROUP BY BatchID;

GO

/*==============================================================================
Q5. Rank Operators by Manual Corrections
==============================================================================*/

SELECT

CorrectedBy,

COUNT(*) AS TotalCorrections,

RANK() OVER
(
ORDER BY COUNT(*) DESC
)
AS OperatorRank

FROM Banking.Manual_Correction_Audit

GROUP BY CorrectedBy;

GO

/*==============================================================================
Q6. Running Total of Images Processed
==============================================================================*/

SELECT

BatchID,

TotalScannedImages,

SUM(TotalScannedImages)
OVER
(
ORDER BY BatchID
)
AS RunningTotal

FROM Banking.Batch_Information;

GO

/*==============================================================================
Q7. Average Confidence Per Batch
==============================================================================*/

SELECT

B.BatchID,

AVG(V.ConfidenceScore) AS AvgConfidence

FROM Banking.Batch_Information B

INNER JOIN Banking.Cheque_Images I
ON B.BatchID = I.BatchID

INNER JOIN Banking.VLM_Extraction V
ON I.ImageID = V.ImageID

GROUP BY B.BatchID;

GO

/*==============================================================================
Q8. CTE Example
==============================================================================*/

WITH LowConfidence AS
(
SELECT *

FROM Banking.VLM_Extraction

WHERE ConfidenceScore < 80
)

SELECT *

FROM LowConfidence;

GO

/*==============================================================================
Q9. ROW_NUMBER Example
==============================================================================*/

SELECT

ExtractionID,

AccountNo,

ChequeNo,

ROW_NUMBER()
OVER
(
ORDER BY ChequeDate
)
AS RowNum

FROM Banking.VLM_Extraction;

GO

/*==============================================================================
Q10. DENSE_RANK Example
==============================================================================*/

SELECT

ExtractionID,

ConfidenceScore,

DENSE_RANK()
OVER
(
ORDER BY ConfidenceScore DESC
)
AS ConfidenceRank

FROM Banking.VLM_Extraction;

GO

/*==============================================================================
Q11. Find Duplicate Records
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
Q12. Find Operators Correcting More Than 10 Records
==============================================================================*/

SELECT

CorrectedBy,

COUNT(*) AS TotalCorrections

FROM Banking.Manual_Correction_Audit

GROUP BY CorrectedBy

HAVING COUNT(*) > 10;

GO

/*==============================================================================
Q13. Latest Processing Batch
==============================================================================*/

SELECT TOP 1 *

FROM Banking.Processing_Log

ORDER BY ProcessStartTime DESC;

GO

/*==============================================================================
Q14. Find Batch with Highest Accuracy
==============================================================================*/

SELECT TOP 1

BatchID,

ExtractionAccuracy

FROM Banking.Processing_Log

ORDER BY ExtractionAccuracy DESC;

GO

/*==============================================================================
Q15. Batch Performance Classification
==============================================================================*/

SELECT

BatchID,

ExtractionAccuracy,

CASE

WHEN ExtractionAccuracy >= 99
THEN 'Excellent'

WHEN ExtractionAccuracy >= 95
THEN 'Good'

WHEN ExtractionAccuracy >= 90
THEN 'Average'

ELSE 'Poor'

END AS Performance

FROM Banking.Processing_Log;

GO

PRINT 'Interview Queries Executed Successfully';

GO
