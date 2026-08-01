/*==========================================================
  ISTMS Database
  File : 03_GRANTS_AND_ROLES.sql
==========================================================*/

-- Verify granted system privileges

SELECT PRIVILEGE
FROM USER_SYS_PRIVS
ORDER BY PRIVILEGE;

-- Verify granted roles

SELECT GRANTED_ROLE
FROM USER_ROLE_PRIVS
ORDER BY GRANTED_ROLE;