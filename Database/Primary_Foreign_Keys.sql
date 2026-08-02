/*
===============================================================================
Project Name    : AI Cheque Extraction Quality Analytics Platform
Database Name   : AI_Cheque_Analytics_DB
Version         : 1.0
Author          : Malarvizhi S
Description     : Primary & Foreign Key Relationships
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
Batch_Information -> Dim_Status
==============================================================================*/

ALTER TABLE Banking.Batch_Information
ADD CONSTRAINT FK_Batch_Status
FOREIGN KEY (StatusID)
REFERENCES Banking.Dim_Status(StatusID);
GO

/*==============================================================================
Cheque_Images -> Batch_Information
==============================================================================*/

ALTER TABLE Banking.Cheque_Images
ADD CONSTRAINT FK_Image_Batch
FOREIGN KEY (BatchID)
REFERENCES Banking.Batch_Information(BatchID);
GO

/*==============================================================================
Cheque_Images -> Dim_Status
==============================================================================*/

ALTER TABLE Banking.Cheque_Images
ADD CONSTRAINT FK_Image_Status
FOREIGN KEY (ImageStatusID)
REFERENCES Banking.Dim_Status(StatusID);
GO

/*==============================================================================
VLM_Extraction -> Cheque_Images
==============================================================================*/

ALTER TABLE Banking.VLM_Extraction
ADD CONSTRAINT FK_Extraction_Image
FOREIGN KEY (ImageID)
REFERENCES Banking.Cheque_Images(ImageID);
GO

/*==============================================================================
VLM_Extraction -> Dim_Status
==============================================================================*/

ALTER TABLE Banking.VLM_Extraction
ADD CONSTRAINT FK_Extraction_Status
FOREIGN KEY (ExtractionStatusID)
REFERENCES Banking.Dim_Status(StatusID);
GO

/*==============================================================================
Cheque_Quality_Check -> VLM_Extraction
==============================================================================*/

ALTER TABLE Banking.Cheque_Quality_Check
ADD CONSTRAINT FK_Quality_Extraction
FOREIGN KEY (ExtractionID)
REFERENCES Banking.VLM_Extraction(ExtractionID);
GO

/*==============================================================================
Cheque_Quality_Check -> Dim_Status (Validation Status)
==============================================================================*/

ALTER TABLE Banking.Cheque_Quality_Check
ADD CONSTRAINT FK_Quality_Validation_Status
FOREIGN KEY (ValidationStatusID)
REFERENCES Banking.Dim_Status(StatusID);
GO

/*==============================================================================
Cheque_Quality_Check -> Dim_Status (Final Status)
==============================================================================*/

ALTER TABLE Banking.Cheque_Quality_Check
ADD CONSTRAINT FK_Quality_Final_Status
FOREIGN KEY (FinalStatusID)
REFERENCES Banking.Dim_Status(StatusID);
GO

/*==============================================================================
Manual_Correction_Audit -> VLM_Extraction
==============================================================================*/

ALTER TABLE Banking.Manual_Correction_Audit
ADD CONSTRAINT FK_Audit_Extraction
FOREIGN KEY (ExtractionID)
REFERENCES Banking.VLM_Extraction(ExtractionID);
GO

/*==============================================================================
Manual_Correction_Audit -> Cheque_Images
==============================================================================*/

ALTER TABLE Banking.Manual_Correction_Audit
ADD CONSTRAINT FK_Audit_Image
FOREIGN KEY (ImageID)
REFERENCES Banking.Cheque_Images(ImageID);
GO

/*==============================================================================
Manual_Correction_Audit -> Batch_Information
==============================================================================*/

ALTER TABLE Banking.Manual_Correction_Audit
ADD CONSTRAINT FK_Audit_Batch
FOREIGN KEY (BatchID)
REFERENCES Banking.Batch_Information(BatchID);
GO

/*==============================================================================
Manual_Correction_Audit -> Dim_Error_Type
==============================================================================*/

ALTER TABLE Banking.Manual_Correction_Audit
ADD CONSTRAINT FK_Audit_Error_Type
FOREIGN KEY (ErrorTypeID)
REFERENCES Banking.Dim_Error_Type(ErrorTypeID);
GO

/*==============================================================================
Manual_Correction_Audit -> Dim_Status
==============================================================================*/

ALTER TABLE Banking.Manual_Correction_Audit
ADD CONSTRAINT FK_Audit_Review_Status
FOREIGN KEY (ReviewStatusID)
REFERENCES Banking.Dim_Status(StatusID);
GO

/*==============================================================================
Processing_Log -> Batch_Information
==============================================================================*/

ALTER TABLE Banking.Processing_Log
ADD CONSTRAINT FK_Log_Batch
FOREIGN KEY (BatchID)
REFERENCES Banking.Batch_Information(BatchID);
GO

/*==============================================================================
Processing_Log -> Dim_Status
==============================================================================*/

ALTER TABLE Banking.Processing_Log
ADD CONSTRAINT FK_Log_Status
FOREIGN KEY (ProcessingStatusID)
REFERENCES Banking.Dim_Status(StatusID);
GO

PRINT 'All Foreign Key Constraints Created Successfully';
GO
