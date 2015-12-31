# How to add an update
The files in this directory will be processed in sorted order. Each file contains SQL
statements used to modify/clean the data or create new tables or views.

For example, assume the MMS_Results table inside the bridgethegap database, the column
CelebrationSchoolStatus contains the string 'null' where the field itself should be null.

We'd add the following to the file changes-bridgethegap.sql:

UPDATE MMS_Results SET CelebrationSchoolStatus = NULL WHERE CelebrationSchoolStatus = 'null';

