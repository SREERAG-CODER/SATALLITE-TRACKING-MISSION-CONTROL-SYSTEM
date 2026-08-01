/*
=========================================================
Project       : Satellite Mission Control System
Module        : Security
Object        : USER_SESSION Package
File          : 101_USER_SESSION_PACKAGE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Provides utility procedures for maintaining
USER_SESSION records.
=========================================================
*/

---------------------------------------------------------
-- Package Specification
---------------------------------------------------------

CREATE OR REPLACE PACKAGE PKG_USER_SESSION AS

    -----------------------------------------------------
    -- Terminates an active session
    -----------------------------------------------------
    PROCEDURE LOGOUT_SESSION
    (
        P_SESSION_ID IN USER_SESSION.SESSION_ID%TYPE
    );

    -----------------------------------------------------
    -- Updates session activity timestamp
    -----------------------------------------------------
    PROCEDURE UPDATE_ACTIVITY
    (
        P_SESSION_ID IN USER_SESSION.SESSION_ID%TYPE
    );

END PKG_USER_SESSION;
/
SHOW ERRORS;

---------------------------------------------------------
-- Package Body
---------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY PKG_USER_SESSION AS

    -----------------------------------------------------
    -- Logout Session
    -----------------------------------------------------

    PROCEDURE LOGOUT_SESSION
    (
        P_SESSION_ID IN USER_SESSION.SESSION_ID%TYPE
    )
    IS
    BEGIN

        UPDATE USER_SESSION
        SET
            SESSION_STATUS = 'LOGGED_OUT',
            LOGOUT_TIME = CURRENT_TIMESTAMP,
            UPDATED_AT = CURRENT_TIMESTAMP
        WHERE SESSION_ID = P_SESSION_ID;

    END LOGOUT_SESSION;

    -----------------------------------------------------
    -- Update Activity
    -----------------------------------------------------

    PROCEDURE UPDATE_ACTIVITY
    (
        P_SESSION_ID IN USER_SESSION.SESSION_ID%TYPE
    )
    IS
    BEGIN

        UPDATE USER_SESSION
        SET
            LAST_ACTIVITY_TIME = CURRENT_TIMESTAMP,
            UPDATED_AT = CURRENT_TIMESTAMP
        WHERE SESSION_ID = P_SESSION_ID;

    END UPDATE_ACTIVITY;

END PKG_USER_SESSION;
/
SHOW ERRORS;

PROMPT ===========================================
PROMPT USER_SESSION package created successfully.
PROMPT ===========================================