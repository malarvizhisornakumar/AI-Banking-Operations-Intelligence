/*
===============================================================================
Project Name    : AI Cheque Extraction Quality Analytics Platform
Database Name   : AI_Cheque_Analytics_DB
Version         : 1.0
Author          : Malarvizhi S
Description     : Reporting Views
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
1. Executive KPI View
==============================================================================*/

CREATE VIEW Banking.vw_Executive_KPI
AS

SELECT

COUNT(V.ExtractionID) AS TotalExtractedRecords,

SUM(P.TotalScannedImages) AS TotalScannedImages,

SUM(P.SuccessfulExtractions) AS SuccessfulExtractions,

SUM(P.FailedExtractions) AS FailedExtractions,

SUM(P.ManualCorrections) AS ManualCorrections,

AVG(P.ExtractionAccuracy) AS AverageExtractionAccuracy

FROM Banking.VLM_Extraction V

INNER JOIN Banking.Cheque_Images I
ON V.ImageID = I.ImageID

INNER JOIN Banking.Batch_Information B
ON I.BatchID = B.BatchID

INNER JOIN Banking.Processing_Log P
ON B.BatchID = P.BatchID;

GO

/*==============================================================================
2. Batch Processing Summary
==============================================================================*/

CREATE VIEW Banking.vw_Batch_Processing_Summary
AS

SELECT

B.BatchID,

B.BoxBarcode,

B.RCBoxBarcode,

B.ShoeBoxBarcode,

B.TotalScannedImages,

P.SuccessfulExtractions,

P.FailedExtractions,

P.ManualCorrections,

P.PendingValidation,

P.ExtractionAccuracy,

P.ProcessStartTime,

P.ProcessEndTime,

P.ProcessingDurationSeconds

FROM Banking.Batch_Information B

INNER JOIN Banking.Processing_Log P

ON B.BatchID=P.BatchID;

GO

/*==============================================================================
3. AI Extraction Report
==============================================================================*/

CREATE VIEW Banking.vw_AI_Extraction_Report
AS

SELECT

V.ExtractionID,

I.FileName,

V.AccountNo,

V.AccountName,

V.ChequeNo,

V.ChequeDate,

V.ConfidenceScore,

S.StatusName AS ExtractionStatus

FROM Banking.VLM_Extraction V

INNER JOIN Banking.Cheque_Images I

ON V.ImageID=I.ImageID

INNER JOIN Banking.Dim_Status S

ON V.ExtractionStatusID=S.StatusID;

GO

/*==============================================================================
4. Data Quality Report
==============================================================================*/

CREATE VIEW Banking.vw_Data_Quality_Report
AS

SELECT

Q.ValidationID,

V.AccountNo,

V.AccountName,

V.ChequeNo,

V.ChequeDate,

Q.LeadingZeroValidation,

Q.AccountLengthValidation,

Q.MandatoryFieldValidation,

Q.DuplicateChequeValidation,

Q.DateValidation,

Q.ConfidenceValidation,

Q.FinalStatusID

FROM Banking.Cheque_Quality_Check Q

INNER JOIN Banking.VLM_Extraction V

ON Q.ExtractionID=V.ExtractionID;

GO

/*==============================================================================
5. Manual Correction Report
==============================================================================*/

CREATE VIEW Banking.vw_Manual_Corrections
AS

SELECT

M.AuditID,

B.BoxBarcode,

B.RCBoxBarcode,

B.ShoeBoxBarcode,

M.FieldName,

M.OldValue,

M.NewValue,

M.CorrectionReason,

M.CorrectedBy,

M.CorrectedOn,

S.StatusName AS ReviewStatus

FROM Banking.Manual_Correction_Audit M

INNER JOIN Banking.Batch_Information B

ON M.BatchID=B.BatchID

INNER JOIN Banking.Dim_Status S

ON M.ReviewStatusID=S.StatusID;

GO

/*==============================================================================
6. Duplicate Cheque Report
==============================================================================*/

CREATE VIEW Banking.vw_Duplicate_Cheques
AS

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
7. Low Confidence Report
==============================================================================*/

CREATE VIEW Banking.vw_Low_Confidence
AS

SELECT

ExtractionID,

AccountNo,

AccountName,

ChequeNo,

ChequeDate,

ConfidenceScore

FROM Banking.VLM_Extraction

WHERE ConfidenceScore < 80;

GO

/*==============================================================================
8. Daily Processing Summary
==============================================================================*/

CREATE VIEW Banking.vw_Daily_Processing
AS

SELECT

CAST(ProcessStartTime AS DATE) AS ProcessingDate,

COUNT(BatchID) AS TotalBatches,

SUM(TotalScannedImages) AS TotalImages,

SUM(SuccessfulExtractions) AS SuccessfulExtractions,

SUM(FailedExtractions) AS FailedExtractions,

AVG(ExtractionAccuracy) AS AverageAccuracy

FROM Banking.Processing_Log

GROUP BY

CAST(ProcessStartTime AS DATE);

GO

/*==============================================================================
9. Operator Productivity
==============================================================================*/

CREATE VIEW Banking.vw_Operator_Productivity
AS

SELECT

CorrectedBy,

COUNT(*) AS TotalCorrections,

MIN(CorrectedOn) AS FirstCorrection,

MAX(CorrectedOn) AS LastCorrection

FROM Banking.Manual_Correction_Audit

GROUP BY

CorrectedBy;

GO

/*==============================================================================
10. Batch Validation Summary
==============================================================================*/

CREATE VIEW Banking.vw_Batch_Validation
AS

SELECT

B.BatchID,

COUNT(Q.ValidationID) AS TotalValidated,

SUM(CASE WHEN Q.FinalStatusID = 2 THEN 1 ELSE 0 END) AS Passed,

SUM(CASE WHEN Q.FinalStatusID = 3 THEN 1 ELSE 0 END) AS Failed,

SUM(CASE WHEN Q.CorrectedFlag = 1 THEN 1 ELSE 0 END) AS Corrected

FROM Banking.Batch_Information B

INNER JOIN Banking.Cheque_Images I

ON B.BatchID=I.BatchID

INNER JOIN Banking.VLM_Extraction V

ON I.ImageID=V.ImageID

INNER JOIN Banking.Cheque_Quality_Check Q

ON V.ExtractionID=Q.ExtractionID

GROUP BY

B.BatchID;

GO

PRINT 'All Reporting Views Created Successfully';

GO
