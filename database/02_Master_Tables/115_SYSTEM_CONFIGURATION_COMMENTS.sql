/*
=========================================================
Project       : Satellite Mission Control System
Module        : System Configuration
Object        : SYSTEM_CONFIGURATION Comments
File          : 115_SYSTEM_CONFIGURATION_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Adds documentation comments to the
SYSTEM_CONFIGURATION table and columns.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE SYSTEM_CONFIGURATION IS
'Stores configurable application settings used by the Mission Control System.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN SYSTEM_CONFIGURATION.CONFIG_ID IS
'Unique identifier for a configuration entry.';

COMMENT ON COLUMN SYSTEM_CONFIGURATION.CONFIG_KEY IS
'Unique key identifying the configuration parameter.';

COMMENT ON COLUMN SYSTEM_CONFIGURATION.CONFIG_VALUE IS
'Current value of the configuration parameter.';

COMMENT ON COLUMN SYSTEM_CONFIGURATION.CONFIG_VALUE_ENCRYPTED IS
'Indicates whether the configuration value is encrypted.';

COMMENT ON COLUMN SYSTEM_CONFIGURATION.CONFIG_CATEGORY IS
'Logical grouping of related configuration parameters.';

COMMENT ON COLUMN SYSTEM_CONFIGURATION.DESCRIPTION IS
'Human-readable description of the configuration parameter.';

COMMENT ON COLUMN SYSTEM_CONFIGURATION.DATA_TYPE IS
'Expected data type of the configuration value.';

COMMENT ON COLUMN SYSTEM_CONFIGURATION.IS_EDITABLE IS
'Indicates whether the value may be modified through the application.';

COMMENT ON COLUMN SYSTEM_CONFIGURATION.IS_ACTIVE IS
'Indicates whether the configuration is currently active.';

COMMENT ON COLUMN SYSTEM_CONFIGURATION.CREATED_AT IS
'Record creation timestamp.';

COMMENT ON COLUMN SYSTEM_CONFIGURATION.UPDATED_AT IS
'Last modification timestamp.';

COMMENT ON COLUMN SYSTEM_CONFIGURATION.UPDATED_BY IS
'User responsible for the last modification.';

PROMPT ===========================================
PROMPT SYSTEM_CONFIGURATION comments added successfully.
PROMPT ===========================================