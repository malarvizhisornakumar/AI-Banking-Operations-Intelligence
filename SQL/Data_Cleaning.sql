/*
===============================================================================
Project Name : AI Cheque Extraction Quality Analytics Platform
Description  : Data Cleaning & Standardization
===============================================================================
*/

USE AI_Cheque_Analytics_DB;
GO

/*==============================================================================
1. Remove Leading & Trailing Spaces
==============================================================================*/

UPDATE Banking.VLM_Extraction

SET

AccountNo = LTRIM(RTRIM(AccountNo)),
AccountName = LTRIM(RTRIM(AccountName)),
ChequeNo = LTRIM(RTRIM(ChequeNo));

GO

/*==============================================================================
2. Convert Account Name to Upper Case
==============================================================================*/

UPDATE Banking.VLM_Extraction

SET AccountName = UPPER(AccountName);

GO

/*==============================================================================
3. Replace Multiple Spaces with Single Space
==============================================================================*/

WHILE EXISTS
(
    SELECT 1
    FROM Banking.VLM_Extraction
    WHERE AccountName LIKE '%  %'
)

BEGIN

UPDATE Banking.VLM_Extraction

SET AccountName =
REPLACE(AccountName,'  ',' ');

END

GO

/*==============================================================================
4. Replace NULL Remarks
==============================================================================*/

UPDATE Banking.Cheque_Quality_Check

SET ValidationRemarks='No Remarks'

WHERE ValidationRemarks IS NULL;

GO

/*==============================================================================
5. Replace NULL Comments
==============================================================================*/

UPDATE Banking.Manual_Correction_Audit

SET Comments='No Comments'

WHERE Comments IS NULL;

GO

/*==============================================================================
6. Standardize Correction Method
==============================================================================*/

UPDATE Banking.Manual_Correction_Audit

SET CorrectionMethod='Manual Data Entry'

WHERE CorrectionMethod IN
(
'Manual',
'Typing',
'DataEntry'
);

GO

/*==============================================================================
7. Replace Blank Correction Reason
==============================================================================*/

UPDATE Banking.Manual_Correction_Audit

SET CorrectionReason='Manual Verification'

WHERE CorrectionReason IS NULL

OR LTRIM(RTRIM(CorrectionReason))='';

GO

/*==============================================================================
8. Remove Blank File Names
==============================================================================*/

SELECT *

FROM Banking.Cheque_Images

WHERE FileName IS NULL

OR LTRIM(RTRIM(FileName))='';

GO

/*==============================================================================
9. Check Invalid Image Paths
==============================================================================*/

SELECT *

FROM Banking.Cheque_Images

WHERE ImagePath IS NULL

OR LTRIM(RTRIM(ImagePath))='';

GO

/*==============================================================================
10. Verify Leading Zeros are Preserved
==============================================================================*/

SELECT

ExtractionID,

AccountNo,

ChequeNo

FROM Banking.VLM_Extraction

WHERE

LEFT(AccountNo,1)='0'

OR

LEFT(ChequeNo,1)='0';

GO

PRINT 'Data Cleaning Completed Successfully';

GO
