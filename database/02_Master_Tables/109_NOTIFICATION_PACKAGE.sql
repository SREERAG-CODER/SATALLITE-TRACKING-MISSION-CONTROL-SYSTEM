/*
=========================================================
Project       : Satellite Mission Control System
Module        : Notification
Object        : NOTIFICATION Package
File          : 109_NOTIFICATION_PACKAGE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Provides business operations for managing
notifications.
=========================================================
*/

---------------------------------------------------------
-- Package Specification
---------------------------------------------------------

CREATE OR REPLACE PACKAGE PKG_NOTIFICATION AS

    -----------------------------------------------------
    -- Send Notification
    -----------------------------------------------------

    PROCEDURE SEND_NOTIFICATION
    (
        P_USER_ID            IN NOTIFICATION.USER_ID%TYPE,
        P_TITLE              IN NOTIFICATION.TITLE%TYPE,
        P_MESSAGE            IN NOTIFICATION.MESSAGE%TYPE,
        P_TYPE               IN NOTIFICATION.NOTIFICATION_TYPE%TYPE,
        P_PRIORITY           IN NOTIFICATION.PRIORITY%TYPE
    );

    -----------------------------------------------------
    -- Mark Notification As Read
    -----------------------------------------------------

    PROCEDURE MARK_AS_READ
    (
        P_NOTIFICATION_ID IN NOTIFICATION.NOTIFICATION_ID%TYPE
    );

    -----------------------------------------------------
    -- Mark All Notifications As Read
    -----------------------------------------------------

    PROCEDURE MARK_ALL_AS_READ
    (
        P_USER_ID IN NOTIFICATION.USER_ID%TYPE
    );

    -----------------------------------------------------
    -- Delete Expired Notifications
    -----------------------------------------------------

    PROCEDURE DELETE_EXPIRED_NOTIFICATIONS;

END PKG_NOTIFICATION;
/
SHOW ERRORS;

---------------------------------------------------------
-- Package Body
---------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY PKG_NOTIFICATION AS

    -----------------------------------------------------
    -- Send Notification
    -----------------------------------------------------

    PROCEDURE SEND_NOTIFICATION
    (
        P_USER_ID,
        P_TITLE,
        P_MESSAGE,
        P_TYPE,
        P_PRIORITY
    )
    IS
    BEGIN

        INSERT INTO NOTIFICATION
        (
            USER_ID,
            TITLE,
            MESSAGE,
            NOTIFICATION_TYPE,
            PRIORITY
        )
        VALUES
        (
            P_USER_ID,
            P_TITLE,
            P_MESSAGE,
            P_TYPE,
            P_PRIORITY
        );

    END SEND_NOTIFICATION;

    -----------------------------------------------------
    -- Mark As Read
    -----------------------------------------------------

    PROCEDURE MARK_AS_READ
    (
        P_NOTIFICATION_ID
    )
    IS
    BEGIN

        UPDATE NOTIFICATION
        SET
            IS_READ='Y',
            READ_TIME=CURRENT_TIMESTAMP,
            UPDATED_AT=CURRENT_TIMESTAMP
        WHERE NOTIFICATION_ID=P_NOTIFICATION_ID;

    END MARK_AS_READ;

    -----------------------------------------------------
    -- Mark All As Read
    -----------------------------------------------------

    PROCEDURE MARK_ALL_AS_READ
    (
        P_USER_ID
    )
    IS
    BEGIN

        UPDATE NOTIFICATION
        SET
            IS_READ='Y',
            READ_TIME=CURRENT_TIMESTAMP,
            UPDATED_AT=CURRENT_TIMESTAMP
        WHERE USER_ID=P_USER_ID
          AND IS_READ='N';

    END MARK_ALL_AS_READ;

    -----------------------------------------------------
    -- Delete Expired Notifications
    -----------------------------------------------------

    PROCEDURE DELETE_EXPIRED_NOTIFICATIONS
    IS
    BEGIN

        DELETE
        FROM NOTIFICATION
        WHERE EXPIRY_TIME IS NOT NULL
          AND EXPIRY_TIME < CURRENT_TIMESTAMP;

    END DELETE_EXPIRED_NOTIFICATIONS;

END PKG_NOTIFICATION;
/
SHOW ERRORS;

PROMPT ===========================================
PROMPT Notification package created successfully.
PROMPT ===========================================