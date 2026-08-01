/*==========================================================
  Project      : Integrated Satellite Tracking &
                 Mission Management System (ISTMS)
  File         : 06_DATABASE_INSTALL.sql
==========================================================*/

PROMPT ==========================================
PROMPT ISTMS DATABASE INSTALLATION STARTED
PROMPT ==========================================

@01_Setup/03_GRANTS_AND_ROLES.sql
@01_Setup/04_SESSION_SETTINGS.sql
@01_Setup/05_DATABASE_VERIFICATION.sql

PROMPT
PROMPT ==========================================
PROMPT INSTALL MASTER TABLE MODULES
PROMPT ==========================================

-- Master Table scripts will be added here.
-- Example:
-- @02_Master_Tables/001_APP_USER_TABLE.sql
-- @02_Master_Tables/002_APP_USER_SEQUENCE.sql
-- ...
-- @02_Master_Tables/134_REPORT_TEST.sql

PROMPT
PROMPT ==========================================
PROMPT DATABASE INSTALLATION COMPLETED
PROMPT ==========================================