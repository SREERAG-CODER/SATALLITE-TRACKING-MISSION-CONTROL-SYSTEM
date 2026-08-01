/*
=========================================================
Project       : Satellite Mission Control System
Module        : System Configuration
Object        : SYSTEM_CONFIGURATION Package
File          : 117_SYSTEM_CONFIGURATION_PACKAGE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Provides business operations for managing
system configuration values.
=========================================================
*/

---------------------------------------------------------
-- Package Specification
---------------------------------------------------------

CREATE OR REPLACE PACKAGE PKG_SYSTEM_CONFIGURATION AS

    -----------------------------------------------------
    -- Returns configuration value
    -----------------------------------------------------

    FUNCTION GET_CONFIG_VALUE
    (
        P_CONFIG_KEY IN SYSTEM_CONFIGURATION.CONFIG_KEY%TYPE
    )
    RETURN VARCHAR2;

    -----------------------------------------------------
    -- Updates configuration value
    -----------------------------------------------------

    PROCEDURE UPDATE_CONFIG_VALUE
    (
        P_CONFIG_KEY   IN SYSTEM_CONFIGURATION.CONFIG_KEY%TYPE,
        P_CONFIG_VALUE IN SYSTEM_CONFIGURATION.CONFIG_VALUE%TYPE
    );

    -----------------------------------------------------
    -- Enable Maintenance Mode
    -----------------------------------------------------

    PROCEDURE ENABLE_MAINTENANCE_MODE;

    -----------------------------------------------------
    -- Disable Maintenance Mode
    -----------------------------------------------------

    PROCEDURE DISABLE_MAINTENANCE_MODE;

END PKG_SYSTEM_CONFIGURATION;
/
SHOW ERRORS;

---------------------------------------------------------
-- Package Body
---------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY PKG_SYSTEM_CONFIGURATION AS

    -----------------------------------------------------
    -- Get Configuration Value
    -----------------------------------------------------

    FUNCTION GET_CONFIG_VALUE
    (
        P_CONFIG_KEY IN SYSTEM_CONFIGURATION.CONFIG_KEY%TYPE
    )
    RETURN VARCHAR2
    IS

        V_VALUE SYSTEM_CONFIGURATION.CONFIG_VALUE%TYPE;

    BEGIN

        SELECT CONFIG_VALUE
        INTO V_VALUE
        FROM SYSTEM_CONFIGURATION
        WHERE CONFIG_KEY = P_CONFIG_KEY
          AND IS_ACTIVE='Y';

        RETURN V_VALUE;

    EXCEPTION

        WHEN NO_DATA_FOUND THEN
            RETURN NULL;

    END GET_CONFIG_VALUE;

    -----------------------------------------------------
    -- Update Configuration
    -----------------------------------------------------

    PROCEDURE UPDATE_CONFIG_VALUE
    (
        P_CONFIG_KEY,
        P_CONFIG_VALUE
    )
    IS
    BEGIN

        UPDATE SYSTEM_CONFIGURATION
        SET
            CONFIG_VALUE = P_CONFIG_VALUE,
            UPDATED_AT = CURRENT_TIMESTAMP
        WHERE CONFIG_KEY = P_CONFIG_KEY;

    END UPDATE_CONFIG_VALUE;

    -----------------------------------------------------
    -- Enable Maintenance Mode
    -----------------------------------------------------

    PROCEDURE ENABLE_MAINTENANCE_MODE
    IS
    BEGIN

        UPDATE SYSTEM_CONFIGURATION
        SET CONFIG_VALUE='TRUE'
        WHERE CONFIG_KEY='MAINTENANCE_MODE';

    END ENABLE_MAINTENANCE_MODE;

    -----------------------------------------------------
    -- Disable Maintenance Mode
    -----------------------------------------------------

    PROCEDURE DISABLE_MAINTENANCE_MODE
    IS
    BEGIN

        UPDATE SYSTEM_CONFIGURATION
        SET CONFIG_VALUE='FALSE'
        WHERE CONFIG_KEY='MAINTENANCE_MODE';

    END DISABLE_MAINTENANCE_MODE;

END PKG_SYSTEM_CONFIGURATION;
/
SHOW ERRORS;

PROMPT ===========================================
PROMPT SYSTEM_CONFIGURATION package created successfully.
PROMPT ===========================================