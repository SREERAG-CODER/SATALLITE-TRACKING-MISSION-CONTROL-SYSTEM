/*==========================================================
  Project      : Integrated Satellite Tracking &
                 Mission Management System (ISTMS)

  File Name    : 00_RUN_DATABASE.sql

  Description  : Master Installation Script

  Author       : Sreerag T C
==========================================================*/

SET SERVEROUTPUT ON;
SET DEFINE OFF;
SET VERIFY OFF;
SET FEEDBACK ON;
SET ECHO OFF;

WHENEVER SQLERROR EXIT FAILURE ROLLBACK;

PROMPT
PROMPT =====================================================
PROMPT       ISTMS DATABASE INSTALLATION STARTED
PROMPT =====================================================
PROMPT

------------------------------------------------------------
-- SETUP
------------------------------------------------------------

PROMPT Executing Setup...

@01_Setup/01_CREATE_USER.sql
@01_Setup/02_CREATE_SCHEMA.sql
@01_Setup/03_GRANTS_AND_ROLES.sql
@01_Setup/04_SESSION_SETTINGS.sql
@01_Setup/05_DATABASE_VERIFICATION.sql

PROMPT Setup Completed.
PROMPT

------------------------------------------------------------
-- MASTER TABLES
------------------------------------------------------------

PROMPT Creating Master Tables...

@02_Master_Tables/01_DEPARTMENT_TABLE.sql
@02_Master_Tables/08_APP_ROLE_TABLE.sql
@02_Master_Tables/15_SYSTEM_MODULE_TABLE.sql
@02_Master_Tables/22_SYSTEM_PERMISSION_TABLE.sql
@02_Master_Tables/29_ROLE_PERMISSION.sql
@02_Master_Tables/30_APP_USER_TABLE.sql
@02_Master_Tables/37_USER_APP_ROLE.sql
@02_Master_Tables/38_SATELLITE_TABLE.sql
@02_Master_Tables/45_MISSION_TABLE.sql
@02_Master_Tables/51_GROUND_STATION_TABLE.sql
@02_Master_Tables/58_MISSION_SATELLITE_TABLE.sql
@02_Master_Tables/64_MISSION_GROUND_STATION_TABLE.sql
@02_Master_Tables/72_COMMAND_TABLE.sql
@02_Master_Tables/80_TELEMETRY_TABLE.sql
@02_Master_Tables/88_COMMAND_HISTORY_TABLE.sql
@02_Master_Tables/95_USER_SESSION_TABLE.sql
@02_Master_Tables/103_NOTIFICATION_TABLE.sql
@02_Master_Tables/111_SYSTEM_CONFIGURATION_TABLE.sql
@02_Master_Tables/119_AUDIT_LOG_TABLE.sql
@02_Master_Tables/127_REPORT_TABLE.sql

PROMPT Master Tables Created Successfully.
PROMPT

------------------------------------------------------------
-- SEQUENCES
------------------------------------------------------------

PROMPT Creating Sequences...

@03_Sequences/001_USER_SEQUENCES.sql
@03_Sequences/002_MISSION_SEQUENCES.sql
@03_Sequences/003_SATELLITE_SEQUENCES.sql

PROMPT Sequences Created.
PROMPT

------------------------------------------------------------
-- TRIGGERS
------------------------------------------------------------

PROMPT Creating Triggers...

@04_Triggers/001_USER_TRIGGERS.sql

PROMPT Triggers Created.
PROMPT

------------------------------------------------------------
-- INDEXES
------------------------------------------------------------

PROMPT Creating Indexes...

@05_Indexes/001_USER_INDEXES.sql

PROMPT Indexes Created.
PROMPT

------------------------------------------------------------
-- COMMENTS
------------------------------------------------------------

PROMPT Applying Comments...

@06_Comments/001_USER_COMMENTS.sql

PROMPT Comments Applied.
PROMPT

------------------------------------------------------------
-- SAMPLE DATA
------------------------------------------------------------

PROMPT Loading Sample Data...

@07_Sample_Data/001_DEPARTMENT_DATA.sql
@07_Sample_Data/002_ROLE_DATA.sql
@07_Sample_Data/003_PERMISSION_DATA.sql

PROMPT Sample Data Loaded.
PROMPT

------------------------------------------------------------
-- PACKAGES
------------------------------------------------------------

PROMPT Compiling Packages...

@08_Packages/001_AUTH_PACKAGE.sql

PROMPT Packages Compiled.
PROMPT

------------------------------------------------------------
-- TESTS
------------------------------------------------------------

PROMPT Running Tests...

@09_Test/001_DATABASE_TEST.sql

PROMPT Tests Completed.
PROMPT

COMMIT;

PROMPT
PROMPT =====================================================
PROMPT      ISTMS DATABASE INSTALLED SUCCESSFULLY
PROMPT =====================================================

EXIT SUCCESS;