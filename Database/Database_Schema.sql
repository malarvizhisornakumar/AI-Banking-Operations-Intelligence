/*
===============================================================================
Project Name    : AI Cheque Extraction Quality Analytics Platform
Database Name   : AI_Cheque_Analytics_DB
Version         : 1.0
Author          : Malarvizhi S
Description     : Database Creation Script
===============================================================================
*/

--=============================================================================
-- Create Database
--=============================================================================

IF DB_ID('AI_Cheque_Analytics_DB') IS NULL
BEGIN
    CREATE DATABASE AI_Cheque_Analytics_DB;
END
GO

USE AI_Cheque_Analytics_DB;
GO

PRINT 'Database Created Successfully';
GO
