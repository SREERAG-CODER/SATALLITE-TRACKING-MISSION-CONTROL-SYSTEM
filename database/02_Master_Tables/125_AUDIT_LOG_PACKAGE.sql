/*
=========================================================
Project       : Satellite Mission Control System
Module        : Audit Log
Object        : AUDIT_LOG Package
File          : 125_AUDIT_LOG_PACKAGE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Provides business operations for recording audit
events. Audit records are append-only.
=========================================================
*/

---------------------------------------------------------
-- Package Specification
---------------------------------------------------------

CREATE OR REPLACE PACKAGE PKG_AUDIT_LOG AS

    -----------------------------------------------------
    -- Write Audit Record
    -----------------------------------------------------

    PROCEDURE WRITE_AUDIT
    (
        P_USER_ID             IN AUDIT_LOG.USER_ID%TYPE,
        P_EVENT_TYPE          IN AUDIT_LOG.EVENT_TYPE%TYPE,
        P_MODULE_NAME         IN AUDIT_LOG.MODULE_NAME%TYPE,
        P_ACTION_NAME         IN AUDIT_LOG.ACTION_NAME%TYPE,
        P_OBJECT_NAME         IN AUDIT_LOG.OBJECT_NAME%TYPE,
        P_OBJECT_ID           IN AUDIT_LOG.OBJECT_ID%TYPE,
        P_EVENT_DESCRIPTION   IN AUDIT_LOG.EVENT_DESCRIPTION%TYPE,
        P_OLD_VALUE           IN AUDIT_LOG.OLD_VALUE%TYPE,
        P_NEW_VALUE           IN AUDIT_LOG.NEW_VALUE%TYPE,
        P_CLIENT_IP           IN AUDIT_LOG.CLIENT_IP%TYPE,
        P_DEVICE_NAME         IN AUDIT_LOG.DEVICE_NAME%TYPE,
        P_SESSION_ID          IN AUDIT_LOG.SESSION_ID%TYPE,
        P_CORRELATION_ID      IN AUDIT_LOG.CORRELATION_ID%TYPE,
        P_EVENT_STATUS        IN AUDIT_LOG.EVENT_STATUS%TYPE
    );

    -----------------------------------------------------
    -- Returns number of audit records
    -----------------------------------------------------

    FUNCTION GET_AUDIT_COUNT
    RETURN NUMBER;

END PKG_AUDIT_LOG;
/
SHOW ERRORS;

---------------------------------------------------------
-- Package Body
---------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY PKG_AUDIT_LOG AS

    -----------------------------------------------------
    -- Write Audit Record
    -----------------------------------------------------

    PROCEDURE WRITE_AUDIT
    (
        P_USER_ID,
        P_EVENT_TYPE,
        P_MODULE_NAME,
        P_ACTION_NAME,
        P_OBJECT_NAME,
        P_OBJECT_ID,
        P_EVENT_DESCRIPTION,
        P_OLD_VALUE,
        P_NEW_VALUE,
        P_CLIENT_IP,
        P_DEVICE_NAME,
        P_SESSION_ID,
        P_CORRELATION_ID,
        P_EVENT_STATUS
    )
    IS
    BEGIN

        INSERT INTO AUDIT_LOG
        (
            USER_ID,
            EVENT_TYPE,
            MODULE_NAME,
            ACTION_NAME,
            OBJECT_NAME,
            OBJECT_ID,
            EVENT_DESCRIPTION,
            OLD_VALUE,
            NEW_VALUE,
            CLIENT_IP,
            DEVICE_NAME,
            SESSION_ID,
            CORRELATION_ID,
            EVENT_STATUS
        )
        VALUES
        (
            P_USER_ID,
            P_EVENT_TYPE,
            P_MODULE_NAME,
            P_ACTION_NAME,
            P_OBJECT_NAME,
            P_OBJECT_ID,
            P_EVENT_DESCRIPTION,
            P_OLD_VALUE,
            P_NEW_VALUE,
            P_CLIENT_IP,
            P_DEVICE_NAME,
            P_SESSION_ID,
            P_CORRELATION_ID,
            P_EVENT_STATUS
        );

    END WRITE_AUDIT;

    -----------------------------------------------------
    -- Audit Count
    -----------------------------------------------------

    FUNCTION GET_AUDIT_COUNT
    RETURN NUMBER
    IS

        V_COUNT NUMBER;

    BEGIN

        SELECT COUNT(*)
        INTO V_COUNT
        FROM AUDIT_LOG;

        RETURN V_COUNT;

    END GET_AUDIT_COUNT;

END PKG_AUDIT_LOG;
/
SHOW ERRORS;

PROMPT ===========================================
PROMPT AUDIT_LOG package created successfully.
PROMPT ===========================================