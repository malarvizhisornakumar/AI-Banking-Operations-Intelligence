/*
===============================================================================
Project Name : AI Cheque Extraction Quality Analytics Platform
Description  : Data Validation Queries
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
1. Missing Account Number
==============================================================================*/

SELECT *

FROM Banking.VLM_Extraction

WHERE AccountNo IS NULL

OR LTRIM(RTRIM(AccountNo))='';

GO

/*==============================================================================
2. Missing Account Name
==============================================================================*/

SELECT *

FROM Banking.VLM_Extraction

WHERE AccountName IS NULL

OR LTRIM(RTRIM(AccountName))='';

GO

/*==============================================================================
3. Missing Cheque Number
==============================================================================*/

SELECT *

FROM Banking.VLM_Extraction

WHERE ChequeNo IS NULL

OR LTRIM(RTRIM(ChequeNo))='';

GO

/*==============================================================================
4. Invalid Customer Account Length
==============================================================================*/

SELECT *

FROM Banking.VLM_Extraction

WHERE LEN(AccountNo) NOT IN (6,7,8,10,16);

GO

/*==============================================================================
5. Invalid Cheque Date
==============================================================================*/

SELECT *

FROM Banking.VLM_Extraction

WHERE ChequeDate < '2000-01-01'

OR ChequeDate > '2017-12-31';

GO

/*==============================================================================
6. Confidence Score below Threshold
==============================================================================*/

SELECT *

FROM Banking.VLM_Extraction

WHERE ConfidenceScore < 80;

GO

/*==============================================================================
7. Duplicate Account + Cheque
==============================================================================*/

SELECT

AccountNo,

ChequeNo,

COUNT(*) DuplicateCount

FROM Banking.VLM_Extraction

GROUP BY

AccountNo,

ChequeNo

HAVING COUNT(*)>1;

GO

/*==============================================================================
8. Images without Extraction
==============================================================================*/

SELECT

I.*

FROM Banking.Cheque_Images I

LEFT JOIN Banking.VLM_Extraction V

ON I.ImageID=V.ImageID

WHERE V.ImageID IS NULL;

GO

/*==============================================================================
9. Validation Pending
==============================================================================*/

SELECT *

FROM Banking.Cheque_Quality_Check

WHERE ValidationStatusID=4;

GO

/*==============================================================================
10. Manual Corrections Pending Review
==============================================================================*/

SELECT *

FROM Banking.Manual_Correction_Audit

WHERE ReviewStatusID<>6;

GO
