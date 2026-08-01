/*==========================================================
  ISTMS Database
  File : 02_TABLESPACES.sql
==========================================================*/

-- Oracle XE uses the default USERS tablespace.
-- No custom tablespace is required.

SELECT TABLESPACE_NAME
FROM USER_TABLESPACES;