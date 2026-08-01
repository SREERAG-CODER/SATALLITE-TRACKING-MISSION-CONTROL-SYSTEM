/*
=========================================================
Project       : Satellite Mission Control System
Module        : System Configuration
Object        : SYSTEM_CONFIGURATION Test
File          : 118_SYSTEM_CONFIGURATION_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Tests SYSTEM_CONFIGURATION module.
=========================================================
*/

---------------------------------------------------------
-- Display Current Configuration
---------------------------------------------------------

PROMPT
PROMPT ===== CURRENT CONFIGURATION =====

SELECT
    CONFIG_KEY,
    CONFIG_VALUE,
    CONFIG_CATEGORY,
    IS_ACTIVE
FROM SYSTEM_CONFIGURATION
ORDER BY CONFIG_CATEGORY, CONFIG_KEY;

---------------------------------------------------------
-- Test Function
---------------------------------------------------------

PROMPT
PROMPT ===== SESSION TIMEOUT =====

SELECT PKG_SYSTEM_CONFIGURATION.GET_CONFIG_VALUE
(
    'SESSION_TIMEOUT'
)
AS SESSION_TIMEOUT
FROM DUAL;

---------------------------------------------------------
-- Test Update
---------------------------------------------------------

BEGIN

    PKG_SYSTEM_CONFIGURATION.UPDATE_CONFIG_VALUE
    (
        'SESSION_TIMEOUT',
        '45'
    );

END;
/

---------------------------------------------------------
-- Enable Maintenance Mode
---------------------------------------------------------

BEGIN
    PKG_SYSTEM_CONFIGURATION.ENABLE_MAINTENANCE_MODE;
END;
/

---------------------------------------------------------
-- Disable Maintenance Mode
---------------------------------------------------------

BEGIN
    PKG_SYSTEM_CONFIGURATION.DISABLE_MAINTENANCE_MODE;
END;
/

---------------------------------------------------------
-- Verify Package
---------------------------------------------------------

PROMPT
PROMPT ===== PACKAGE STATUS =====

SELECT
    OBJECT_NAME,
    STATUS
FROM USER_OBJECTS
WHERE OBJECT_NAME='PKG_SYSTEM_CONFIGURATION';

---------------------------------------------------------
-- Verify Triggers
---------------------------------------------------------

PROMPT
PROMPT ===== TRIGGERS =====

SELECT
    TRIGGER_NAME,
    STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME='SYSTEM_CONFIGURATION';

---------------------------------------------------------
-- Verify Indexes
---------------------------------------------------------

PROMPT
PROMPT ===== INDEXES =====

SELECT
    INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME='SYSTEM_CONFIGURATION';

---------------------------------------------------------
-- Final Verification
---------------------------------------------------------

PROMPT
PROMPT ===== FINAL CONFIGURATION =====

SELECT
    CONFIG_KEY,
    CONFIG_VALUE
FROM SYSTEM_CONFIGURATION
ORDER BY CONFIG_KEY;

PROMPT ===========================================
PROMPT SYSTEM_CONFIGURATION module tested successfully.
PROMPT ===========================================