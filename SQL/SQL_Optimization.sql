/*
===============================================================================
Project Name : AI Cheque Extraction Quality Analytics Platform
Description  : SQL Optimization & Performance Tuning
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
1. View Existing Indexes
==============================================================================*/

SELECT

OBJECT_NAME(I.object_id) AS TableName,

I.name AS IndexName,

I.type_desc AS IndexType

FROM sys.indexes I

WHERE OBJECTPROPERTY(I.object_id,'IsUserTable') = 1

ORDER BY TableName;

GO

/*==============================================================================
2. Query Using Indexed Column (Good Practice)
==============================================================================*/

SELECT *

FROM Banking.VLM_Extraction

WHERE AccountNo = '0012345678';

GO

/*==============================================================================
3. Non-SARGable Query (Avoid)
==============================================================================*/

-- Avoid using functions on indexed columns

SELECT *

FROM Banking.VLM_Extraction

WHERE YEAR(ChequeDate) = 2016;

GO

/*==============================================================================
4. SARGable Query (Recommended)
==============================================================================*/

SELECT *

FROM Banking.VLM_Extraction

WHERE ChequeDate >= '2016-01-01'

AND ChequeDate < '2017-01-01';

GO

/*==============================================================================
5. Avoid SELECT *
==============================================================================*/

-- Recommended

SELECT

AccountNo,

AccountName,

ChequeNo

FROM Banking.VLM_Extraction;

GO

/*==============================================================================
6. Find Missing Index Suggestions
==============================================================================*/

SELECT *

FROM sys.dm_db_missing_index_details;

GO

/*==============================================================================
7. IO Statistics
==============================================================================*/

SET STATISTICS IO ON;

SELECT

AccountNo,

ChequeNo

FROM Banking.VLM_Extraction

WHERE AccountNo='0012345678';

SET STATISTICS IO OFF;

GO

/*==============================================================================
8. Execution Time
==============================================================================*/

SET STATISTICS TIME ON;

SELECT

AccountNo,

ChequeNo

FROM Banking.VLM_Extraction

WHERE ConfidenceScore > 95;

SET STATISTICS TIME OFF;

GO

/*==============================================================================
9. Execution Plan
==============================================================================*/

-- Enable Actual Execution Plan in SSMS (Ctrl + M)
-- Then execute the following query.

SELECT

AccountNo,

ChequeNo,

ConfidenceScore

FROM Banking.VLM_Extraction

WHERE ConfidenceScore > 90;

GO

/*==============================================================================
10. TOP Instead of Full Scan
==============================================================================*/

SELECT TOP (100)

AccountNo,

ChequeNo,

ConfidenceScore

FROM Banking.VLM_Extraction

ORDER BY ConfidenceScore DESC;

GO

/*==============================================================================
11. EXISTS Instead of IN
==============================================================================*/

SELECT

B.BatchID

FROM Banking.Batch_Information B

WHERE EXISTS
(
    SELECT 1
    FROM Banking.Cheque_Images I
    WHERE I.BatchID = B.BatchID
);

GO

/*==============================================================================
12. Use COUNT_BIG for Very Large Tables
==============================================================================*/

SELECT

COUNT_BIG(*) AS TotalRecords

FROM Banking.VLM_Extraction;

GO

/*==============================================================================
13. Avoid Duplicate Sorting
==============================================================================*/

-- Preferred when only uniqueness is required

SELECT DISTINCT

AccountNo

FROM Banking.VLM_Extraction;

GO

/*==============================================================================
14. Review Fragmentation (Enterprise Maintenance)
==============================================================================*/

SELECT

OBJECT_NAME(object_id) AS TableName,

avg_fragmentation_in_percent

FROM sys.dm_db_index_physical_stats
(
    DB_ID(),
    NULL,
    NULL,
    NULL,
    'LIMITED'
);

GO

/*==============================================================================
15. Optimization Checklist
==============================================================================*/

PRINT 'Optimization Checklist';

PRINT '1. Use indexes on search columns';
PRINT '2. Avoid SELECT *';
PRINT '3. Use SARGable WHERE clauses';
PRINT '4. Filter data as early as possible';
PRINT '5. Avoid unnecessary cursors';
PRINT '6. Use proper JOIN conditions';
PRINT '7. Review execution plans';
PRINT '8. Monitor IO and CPU statistics';
PRINT '9. Rebuild/Reorganize fragmented indexes';
PRINT '10. Keep statistics updated';

GO

PRINT 'SQL Optimization Script Completed Successfully';

GO
