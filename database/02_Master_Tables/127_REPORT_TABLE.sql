/*
=========================================================
Project       : Satellite Mission Control System
Module        : Report Management
Object        : REPORT
File          : 127_REPORT_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 2.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Stores metadata of generated reports.

Actual report files are stored externally on the
application server or dedicated storage.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE REPORT CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

---------------------------------------------------------
-- Create Table
---------------------------------------------------------

CREATE TABLE REPORT
(
    -----------------------------------------------------
    -- Primary Key
    -----------------------------------------------------

    REPORT_ID                   NUMBER(10)      NOT NULL,

    -----------------------------------------------------
    -- Report Information
    -----------------------------------------------------

    REPORT_NAME                 VARCHAR2(150)   NOT NULL,

    REPORT_TYPE                 VARCHAR2(50)    NOT NULL,

    REPORT_FORMAT               VARCHAR2(20)    NOT NULL,

    GENERATED_BY                NUMBER(10)      NOT NULL,

    GENERATED_TIME              TIMESTAMP
                                DEFAULT CURRENT_TIMESTAMP
                                NOT NULL,

    -----------------------------------------------------
    -- File Information
    -----------------------------------------------------

    REPORT_FILE_NAME            VARCHAR2(255)   NOT NULL,

    REPORT_STORAGE_PATH         VARCHAR2(500)   NOT NULL,

    FILE_SIZE_BYTES             NUMBER(20),

    REPORT_HASH                 VARCHAR2(64),

    IS_DIGITALLY_SIGNED         CHAR(1)
                                DEFAULT 'N'
                                NOT NULL,

    -----------------------------------------------------
    -- Usage Statistics
    -----------------------------------------------------

    DOWNLOAD_COUNT              NUMBER(10)
                                DEFAULT 0
                                NOT NULL,

    LAST_ACCESSED_AT            TIMESTAMP,

    -----------------------------------------------------
    -- Report Association
    -----------------------------------------------------

    REFERENCE_TYPE              VARCHAR2(50),

    REFERENCE_ID                NUMBER(10),

    -----------------------------------------------------
    -- Status
    -----------------------------------------------------

    REPORT_STATUS               VARCHAR2(20)
                                DEFAULT 'GENERATED'
                                NOT NULL,

    -----------------------------------------------------
    -- Audit Columns
    -----------------------------------------------------

    CREATED_AT                  TIMESTAMP
                                DEFAULT CURRENT_TIMESTAMP
                                NOT NULL,

    UPDATED_AT                  TIMESTAMP,

    UPDATED_BY                  NUMBER(10),

    -----------------------------------------------------
    -- Constraints
    -----------------------------------------------------

    CONSTRAINT PK_REPORT
        PRIMARY KEY (REPORT_ID),

    CONSTRAINT FK_REPORT_GENERATED_BY
        FOREIGN KEY (GENERATED_BY)
        REFERENCES APP_USER(USER_ID),

    CONSTRAINT FK_REPORT_UPDATED_BY
        FOREIGN KEY (UPDATED_BY)
        REFERENCES APP_USER(USER_ID),

    CONSTRAINT CHK_REPORT_FORMAT
        CHECK
        (
            REPORT_FORMAT IN
            (
                'PDF',
                'EXCEL',
                'CSV'
            )
        ),

    CONSTRAINT CHK_REPORT_STATUS
        CHECK
        (
            REPORT_STATUS IN
            (
                'GENERATED',
                'FAILED',
                'ARCHIVED'
            )
        ),

    CONSTRAINT CHK_REPORT_SIGNED
        CHECK
        (
            IS_DIGITALLY_SIGNED IN
            (
                'Y',
                'N'
            )
        ),

    CONSTRAINT CHK_REPORT_DOWNLOAD_COUNT
        CHECK
        (
            DOWNLOAD_COUNT >= 0
        ),

    CONSTRAINT CHK_REPORT_FILE_SIZE
        CHECK
        (
            FILE_SIZE_BYTES IS NULL
            OR FILE_SIZE_BYTES >= 0
        )
);

PROMPT ===========================================
PROMPT REPORT table created successfully.
PROMPT ===========================================