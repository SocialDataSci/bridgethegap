USE bridgethegap;

-- many rows have CelebrationSchoolStatus to the string 'null', just convert those values to NULL
UPDATE MMS_Results SET CelebrationSchoolStatus = NULL WHERE CelebrationSchoolStatus = 'null';
