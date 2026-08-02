/*
===============================================================================
Project Name    : AI Cheque Extraction Quality Analytics Platform
Database Name   : AI_Cheque_Analytics_DB
Version         : 1.0
Author          : Malarvizhi S
Description     : Index Creation Script
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
Batch Information Indexes
==============================================================================*/

CREATE NONCLUSTERED INDEX IX_Batch_BoxBarcode
ON Banking.Batch_Information(BoxBarcode);
GO

CREATE NONCLUSTERED INDEX IX_Batch_RCBoxBarcode
ON Banking.Batch_Information(RCBoxBarcode);
GO

CREATE NONCLUSTERED INDEX IX_Batch_ShoeBoxBarcode
ON Banking.Batch_Information(ShoeBoxBarcode);
GO

CREATE NONCLUSTERED INDEX IX_Batch_ScanDate
ON Banking.Batch_Information(ScanDate);
GO

/*==============================================================================
Cheque Images Indexes
==============================================================================*/

CREATE NONCLUSTERED INDEX IX_ChequeImages_BatchID
ON Banking.Cheque_Images(BatchID);
GO

CREATE NONCLUSTERED INDEX IX_ChequeImages_FileName
ON Banking.Cheque_Images(FileName);
GO

/*==============================================================================
VLM Extraction Indexes
==============================================================================*/

CREATE NONCLUSTERED INDEX IX_VLM_ImageID
ON Banking.VLM_Extraction(ImageID);
GO

CREATE NONCLUSTERED INDEX IX_VLM_AccountNo
ON Banking.VLM_Extraction(AccountNo);
GO

CREATE NONCLUSTERED INDEX IX_VLM_ChequeNo
ON Banking.VLM_Extraction(ChequeNo);
GO

CREATE NONCLUSTERED INDEX IX_VLM_ChequeDate
ON Banking.VLM_Extraction(ChequeDate);
GO

CREATE NONCLUSTERED INDEX IX_VLM_ConfidenceScore
ON Banking.VLM_Extraction(ConfidenceScore);
GO

/*==============================================================================
Composite Index for Duplicate Validation
==============================================================================*/

CREATE NONCLUSTERED INDEX IX_VLM_Account_Cheque
ON Banking.VLM_Extraction(AccountNo, ChequeNo);
GO

/*==============================================================================
Cheque Quality Check Indexes
==============================================================================*/

CREATE NONCLUSTERED INDEX IX_QC_ExtractionID
ON Banking.Cheque_Quality_Check(ExtractionID);
GO

CREATE NONCLUSTERED INDEX IX_QC_FinalStatus
ON Banking.Cheque_Quality_Check(FinalStatusID);
GO

/*==============================================================================
Manual Correction Audit Indexes
==============================================================================*/

CREATE NONCLUSTERED INDEX IX_Audit_ExtractionID
ON Banking.Manual_Correction_Audit(ExtractionID);
GO

CREATE NONCLUSTERED INDEX IX_Audit_CorrectedBy
ON Banking.Manual_Correction_Audit(CorrectedBy);
GO

CREATE NONCLUSTERED INDEX IX_Audit_CorrectedOn
ON Banking.Manual_Correction_Audit(CorrectedOn);
GO

/*==============================================================================
Processing Log Indexes
==============================================================================*/

CREATE NONCLUSTERED INDEX IX_Log_BatchID
ON Banking.Processing_Log(BatchID);
GO

CREATE NONCLUSTERED INDEX IX_Log_ProcessStart
ON Banking.Processing_Log(ProcessStartTime);
GO

PRINT 'Indexes Created Successfully';
GO
