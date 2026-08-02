/*
===============================================================================
Project Name    : AI Cheque Extraction Quality Analytics Platform
Database Name   : AI_Cheque_Analytics_DB
Version         : 1.0
Author          : Malarvizhi S
Description     : Stored Procedures
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
1. Get Executive Dashboard KPI
==============================================================================*/

CREATE PROCEDURE Banking.usp_GetExecutiveKPI
AS
BEGIN

SET NOCOUNT ON;

SELECT *

FROM Banking.vw_Executive_KPI;

END
GO

/*==============================================================================
2. Get Batch Summary
==============================================================================*/

CREATE PROCEDURE Banking.usp_GetBatchSummary
(
    @BatchID INT
)
AS
BEGIN

SET NOCOUNT ON;

SELECT *

FROM Banking.vw_Batch_Processing_Summary

WHERE BatchID=@BatchID;

END
GO

/*==============================================================================
3. Search Account Number
==============================================================================*/

CREATE PROCEDURE Banking.usp_SearchAccount
(
    @AccountNo VARCHAR(30)
)
AS
BEGIN

SET NOCOUNT ON;

SELECT *

FROM Banking.vw_AI_Extraction_Report

WHERE AccountNo=@AccountNo;

END
GO

/*==============================================================================
4. Search Cheque Number
==============================================================================*/

CREATE PROCEDURE Banking.usp_SearchCheque
(
    @ChequeNo VARCHAR(30)
)
AS
BEGIN

SET NOCOUNT ON;

SELECT *

FROM Banking.vw_AI_Extraction_Report

WHERE ChequeNo=@ChequeNo;

END
GO

/*==============================================================================
5. Get Low Confidence Records
==============================================================================*/

CREATE PROCEDURE Banking.usp_GetLowConfidence
AS
BEGIN

SET NOCOUNT ON;

SELECT *

FROM Banking.vw_Low_Confidence

ORDER BY ConfidenceScore;

END
GO

/*==============================================================================
6. Get Duplicate Cheques
==============================================================================*/

CREATE PROCEDURE Banking.usp_GetDuplicateCheques
AS
BEGIN

SET NOCOUNT ON;

SELECT *

FROM Banking.vw_Duplicate_Cheques;

END
GO

/*==============================================================================
7. Get Manual Corrections
==============================================================================*/

CREATE PROCEDURE Banking.usp_GetManualCorrections
AS
BEGIN

SET NOCOUNT ON;

SELECT *

FROM Banking.vw_Manual_Corrections

ORDER BY CorrectedOn DESC;

END
GO

/*==============================================================================
8. Get Daily Processing Summary
==============================================================================*/

CREATE PROCEDURE Banking.usp_GetDailyProcessing
AS
BEGIN

SET NOCOUNT ON;

SELECT *

FROM Banking.vw_Daily_Processing

ORDER BY ProcessingDate DESC;

END
GO

/*==============================================================================
9. Get Operator Productivity
==============================================================================*/

CREATE PROCEDURE Banking.usp_GetOperatorProductivity
AS
BEGIN

SET NOCOUNT ON;

SELECT *

FROM Banking.vw_Operator_Productivity

ORDER BY TotalCorrections DESC;

END
GO

/*==============================================================================
10. Validate Duplicate Cheque
==============================================================================*/

CREATE PROCEDURE Banking.usp_ValidateDuplicateCheque
(
    @AccountNo VARCHAR(30),
    @ChequeNo VARCHAR(30)
)
AS
BEGIN

SET NOCOUNT ON;

SELECT COUNT(*) AS DuplicateCount

FROM Banking.VLM_Extraction

WHERE AccountNo=@AccountNo

AND ChequeNo=@ChequeNo;

END
GO

/*==============================================================================
11. Get Processing Log
==============================================================================*/

CREATE PROCEDURE Banking.usp_GetProcessingLog
(
    @BatchID INT
)
AS
BEGIN

SET NOCOUNT ON;

SELECT *

FROM Banking.Processing_Log

WHERE BatchID=@BatchID;

END
GO

/*==============================================================================
12. Get Validation Summary
==============================================================================*/

CREATE PROCEDURE Banking.usp_GetValidationSummary
AS
BEGIN

SET NOCOUNT ON;

SELECT *

FROM Banking.vw_Batch_Validation;

END
GO

PRINT 'Stored Procedures Created Successfully';
GO
