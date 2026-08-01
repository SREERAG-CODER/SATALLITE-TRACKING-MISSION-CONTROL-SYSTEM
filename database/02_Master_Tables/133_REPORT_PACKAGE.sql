/*
=========================================================
Project       : Satellite Mission Control System
Module        : Report Management
Object        : REPORT Package
File          : 133_REPORT_PACKAGE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Provides business operations for report metadata
management.
=========================================================
*/

---------------------------------------------------------
-- Package Specification
---------------------------------------------------------

CREATE OR REPLACE PACKAGE PKG_REPORT_MANAGER AS

    -----------------------------------------------------
    -- Register New Report
    -----------------------------------------------------

    PROCEDURE REGISTER_REPORT
    (
        P_REPORT_NAME          IN REPORT.REPORT_NAME%TYPE,
        P_REPORT_TYPE          IN REPORT.REPORT_TYPE%TYPE,
        P_REPORT_FORMAT        IN REPORT.REPORT_FORMAT%TYPE,
        P_GENERATED_BY         IN REPORT.GENERATED_BY%TYPE,
        P_REPORT_FILE_NAME     IN REPORT.REPORT_FILE_NAME%TYPE,
        P_REPORT_STORAGE_PATH  IN REPORT.REPORT_STORAGE_PATH%TYPE,
        P_FILE_SIZE_BYTES      IN REPORT.FILE_SIZE_BYTES%TYPE,
        P_REPORT_HASH          IN REPORT.REPORT_HASH%TYPE,
        P_REFERENCE_TYPE       IN REPORT.REFERENCE_TYPE%TYPE,
        P_REFERENCE_ID         IN REPORT.REFERENCE_ID%TYPE
    );

    -----------------------------------------------------
    -- Increment Access Count
    -----------------------------------------------------

    PROCEDURE OPEN_REPORT
    (
        P_REPORT_ID IN REPORT.REPORT_ID%TYPE
    );

    -----------------------------------------------------
    -- Archive Report
    -----------------------------------------------------

    PROCEDURE ARCHIVE_REPORT
    (
        P_REPORT_ID IN REPORT.REPORT_ID%TYPE
    );

    -----------------------------------------------------
    -- Soft Delete
    -----------------------------------------------------

    PROCEDURE DELETE_REPORT
    (
        P_REPORT_ID IN REPORT.REPORT_ID%TYPE
    );

    -----------------------------------------------------
    -- Report Count
    -----------------------------------------------------

    FUNCTION GET_REPORT_COUNT
    RETURN NUMBER;

END PKG_REPORT_MANAGER;
/
SHOW ERRORS;

---------------------------------------------------------
-- Package Body
---------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY PKG_REPORT_MANAGER AS

    PROCEDURE REGISTER_REPORT
    (
        P_REPORT_NAME,
        P_REPORT_TYPE,
        P_REPORT_FORMAT,
        P_GENERATED_BY,
        P_REPORT_FILE_NAME,
        P_REPORT_STORAGE_PATH,
        P_FILE_SIZE_BYTES,
        P_REPORT_HASH,
        P_REFERENCE_TYPE,
        P_REFERENCE_ID
    )
    IS
    BEGIN

        INSERT INTO REPORT
        (
            REPORT_NAME,
            REPORT_TYPE,
            REPORT_FORMAT,
            GENERATED_BY,
            REPORT_FILE_NAME,
            REPORT_STORAGE_PATH,
            FILE_SIZE_BYTES,
            REPORT_HASH,
            REFERENCE_TYPE,
            REFERENCE_ID
        )
        VALUES
        (
            P_REPORT_NAME,
            P_REPORT_TYPE,
            P_REPORT_FORMAT,
            P_GENERATED_BY,
            P_REPORT_FILE_NAME,
            P_REPORT_STORAGE_PATH,
            P_FILE_SIZE_BYTES,
            P_REPORT_HASH,
            P_REFERENCE_TYPE,
            P_REFERENCE_ID
        );

    END REGISTER_REPORT;

    -----------------------------------------------------

    PROCEDURE OPEN_REPORT
    (
        P_REPORT_ID
    )
    IS
    BEGIN

        UPDATE REPORT
        SET
            DOWNLOAD_COUNT = DOWNLOAD_COUNT + 1,
            LAST_ACCESSED_AT = CURRENT_TIMESTAMP
        WHERE REPORT_ID = P_REPORT_ID;

    END OPEN_REPORT;

    -----------------------------------------------------

    PROCEDURE ARCHIVE_REPORT
    (
        P_REPORT_ID
    )
    IS
    BEGIN

        UPDATE REPORT
        SET REPORT_STATUS='ARCHIVED'
        WHERE REPORT_ID=P_REPORT_ID;

    END ARCHIVE_REPORT;

    -----------------------------------------------------

    PROCEDURE DELETE_REPORT
    (
        P_REPORT_ID
    )
    IS
    BEGIN

        UPDATE REPORT
        SET REPORT_STATUS='DELETED'
        WHERE REPORT_ID=P_REPORT_ID;

    END DELETE_REPORT;

    -----------------------------------------------------

    FUNCTION GET_REPORT_COUNT
    RETURN NUMBER
    IS
        V_COUNT NUMBER;
    BEGIN

        SELECT COUNT(*)
        INTO V_COUNT
        FROM REPORT;

        RETURN V_COUNT;

    END GET_REPORT_COUNT;

END PKG_REPORT_MANAGER;
/
SHOW ERRORS;

PROMPT ===========================================
PROMPT REPORT package created successfully.
PROMPT ===========================================