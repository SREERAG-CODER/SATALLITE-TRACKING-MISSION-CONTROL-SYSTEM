/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SYSTEM_MODULE
File          : 19_SYSTEM_MODULE_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Adds descriptive comments to the SYSTEM_MODULE
table and its columns for better documentation
and maintainability.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE SYSTEM_MODULE IS
'Stores all application modules and sub-modules used for navigation, feature management, and Role-Based Access Control (RBAC).';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN SYSTEM_MODULE.MODULE_ID IS
'Unique identifier for each system module.';

COMMENT ON COLUMN SYSTEM_MODULE.PARENT_MODULE_ID IS
'References the parent module, enabling hierarchical module structures.';

COMMENT ON COLUMN SYSTEM_MODULE.MODULE_LEVEL IS
'Indicates the hierarchy level of the module. Root modules are Level 1.';

COMMENT ON COLUMN SYSTEM_MODULE.MODULE_TYPE IS
'Specifies the functional type of the module such as MANAGEMENT, MONITORING, DASHBOARD, AI, ADMINISTRATION, REPORT, VISUALIZATION, CONFIGURATION, or UTILITY.';

COMMENT ON COLUMN SYSTEM_MODULE.MODULE_CODE IS
'Short unique code representing the system module.';

COMMENT ON COLUMN SYSTEM_MODULE.MODULE_NAME IS
'Display name of the system module.';

COMMENT ON COLUMN SYSTEM_MODULE.MODULE_DESCRIPTION IS
'Detailed description of the system module and its purpose.';

COMMENT ON COLUMN SYSTEM_MODULE.ROUTE_PATH IS
'Application route or URL path associated with the module.';

COMMENT ON COLUMN SYSTEM_MODULE.ICON_NAME IS
'Frontend icon identifier used to represent the module in the user interface.';

COMMENT ON COLUMN SYSTEM_MODULE.DISPLAY_ORDER IS
'Determines the display order of modules in menus and navigation.';

COMMENT ON COLUMN SYSTEM_MODULE.IS_MENU IS
'Indicates whether the module should appear in the application navigation menu (Y/N).';

COMMENT ON COLUMN SYSTEM_MODULE.IS_ACTIVE IS
'Indicates whether the module is active (Y) or inactive (N).';

COMMENT ON COLUMN SYSTEM_MODULE.CREATED_AT IS
'Timestamp when the module record was created.';

COMMENT ON COLUMN SYSTEM_MODULE.UPDATED_AT IS
'Timestamp of the most recent update made to the module record.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SYSTEM_MODULE comments created successfully.
PROMPT ===========================================

---------------------------------------------------------
-- Verification
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'SYSTEM_MODULE';

SELECT COLUMN_NAME,
       COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'SYSTEM_MODULE'
ORDER BY COLUMN_NAME;