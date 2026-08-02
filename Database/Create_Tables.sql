/*
===============================================================================
Project Name    : AI Cheque Extraction Quality Analytics Platform
Database Name   : AI_Cheque_Analytics_DB
Version         : 1.0
Author          : Malarvizhi S
Description     : Create Database Tables
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
Create Schema
==============================================================================*/

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Banking')
BEGIN
    EXEC('CREATE SCHEMA Banking');
END
GO

/*==============================================================================
Table : Dim_Status
==============================================================================*/

CREATE TABLE Banking.Dim_Status
(
    StatusID INT IDENTITY(1,1) PRIMARY KEY,
    StatusName VARCHAR(50) NOT NULL UNIQUE,
    StatusDescription VARCHAR(255)
);
GO

/*==============================================================================
Table : Dim_Error_Type
==============================================================================*/

CREATE TABLE Banking.Dim_Error_Type
(
    ErrorTypeID INT IDENTITY(1,1) PRIMARY KEY,
    ErrorName VARCHAR(100) NOT NULL UNIQUE,
    ErrorDescription VARCHAR(500)
);
GO

/*==============================================================================
Table : Batch_Information
==============================================================================*/

CREATE TABLE Banking.Batch_Information
(
    BatchID INT IDENTITY(1,1) PRIMARY KEY,

    BoxBarcode VARCHAR(50) NOT NULL,

    RCBoxBarcode VARCHAR(50) NOT NULL,

    ShoeBoxBarcode VARCHAR(50) NOT NULL,

    TotalScannedImages INT NOT NULL,

    ScanDate DATE NOT NULL,

    StatusID INT NOT NULL
);
GO

/*==============================================================================
Table : Cheque_Images
==============================================================================*/

CREATE TABLE Banking.Cheque_Images
(
    ImageID INT IDENTITY(1,1) PRIMARY KEY,

    BatchID INT NOT NULL,

    FileName VARCHAR(255) NOT NULL,

    ImagePath VARCHAR(500) NOT NULL,

    ImageStatusID INT NOT NULL
);
GO

/*==============================================================================
Table : VLM_Extraction
==============================================================================*/

CREATE TABLE Banking.VLM_Extraction
(
    ExtractionID INT IDENTITY(1,1) PRIMARY KEY,

    ImageID INT NOT NULL,

    AccountNo VARCHAR(30) NOT NULL,

    AccountName VARCHAR(255) NOT NULL,

    ChequeNo VARCHAR(30) NOT NULL,

    ChequeDate DATE NOT NULL,

    ConfidenceScore DECIMAL(5,2) NOT NULL,

    ExtractionStatusID INT NOT NULL,

    ExtractionTime DATETIME DEFAULT GETDATE()
);
GO

/*==============================================================================
Table : Cheque_Quality_Check
==============================================================================*/

CREATE TABLE Banking.Cheque_Quality_Check
(
    ValidationID INT IDENTITY(1,1) PRIMARY KEY,

    ExtractionID INT NOT NULL,

    ValidationStatusID INT NOT NULL,

    LeadingZeroValidation BIT NOT NULL,

    AccountLengthValidation BIT NOT NULL,

    MandatoryFieldValidation BIT NOT NULL,

    DuplicateChequeValidation BIT NOT NULL,

    DateValidation BIT NOT NULL,

    ConfidenceValidation BIT NOT NULL,

    ValidationRemarks VARCHAR(500),

    CorrectedFlag BIT NOT NULL DEFAULT 0,

    CorrectedBy VARCHAR(100),

    CorrectedOn DATETIME,

    FinalStatusID INT NOT NULL
);
GO

/*==============================================================================
Table : Manual_Correction_Audit
==============================================================================*/

CREATE TABLE Banking.Manual_Correction_Audit
(
    AuditID INT IDENTITY(1,1) PRIMARY KEY,

    ExtractionID INT NOT NULL,

    ImageID INT NOT NULL,

    BatchID INT NOT NULL,

    FieldName VARCHAR(100) NOT NULL,

    OldValue VARCHAR(500),

    NewValue VARCHAR(500) NOT NULL,

    ErrorTypeID INT,

    CorrectionReason VARCHAR(255),

    CorrectedBy VARCHAR(100) NOT NULL,

    CorrectionMethod VARCHAR(50) NOT NULL,

    CorrectedOn DATETIME DEFAULT GETDATE(),

    ReviewStatusID INT NOT NULL,

    ReviewedBy VARCHAR(100),

    ReviewedOn DATETIME,

    Comments VARCHAR(500)
);
GO

/*==============================================================================
Table : Processing_Log
==============================================================================*/

CREATE TABLE Banking.Processing_Log
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,

    BatchID INT NOT NULL,

    ProcessStartTime DATETIME NOT NULL,

    ProcessEndTime DATETIME NOT NULL,

    ProcessingDurationSeconds INT NOT NULL,

    TotalScannedImages INT NOT NULL,

    TotalExtractedRecords INT NOT NULL,

    SuccessfulExtractions INT NOT NULL,

    FailedExtractions INT NOT NULL,

    ManualCorrections INT NOT NULL,

    PendingValidation INT NOT NULL,

    ExtractionAccuracy DECIMAL(5,2) NOT NULL,

    ProcessingStatusID INT NOT NULL,

    ModelName VARCHAR(50),

    ModelVersion VARCHAR(30),

    CreatedOn DATETIME DEFAULT GETDATE()
);
GO

PRINT 'All Banking Tables Created Successfully';
GO
