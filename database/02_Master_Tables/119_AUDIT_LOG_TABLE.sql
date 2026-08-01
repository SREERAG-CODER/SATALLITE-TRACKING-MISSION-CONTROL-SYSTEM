/*
=========================================================
Project       : Satellite Mission Control System
Module        : Audit Log
Object        : AUDIT_LOG
File          : 119_AUDIT_LOG_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Stores security, operational and system audit
events for complete traceability throughout the
Mission Control application.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE AUDIT_LOG CASCADE CONSTRAINTS';
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

CREATE TABLE AUDIT_LOG
(
    AUDIT_ID                NUMBER(12)      NOT NULL,

    USER_ID                 NUMBER(10),

    EVENT_TYPE              VARCHAR2(50)    NOT NULL,

    MODULE_NAME             VARCHAR2(100)   NOT NULL,

    ACTION_NAME             VARCHAR2(100)   NOT NULL,

    OBJECT_NAME             VARCHAR2(100),

    OBJECT_ID               VARCHAR2(100),

    EVENT_DESCRIPTION       VARCHAR2(1000),

    CLIENT_IP               VARCHAR2(50),

    DEVICE_NAME             VARCHAR2(100),

    SESSION_ID              NUMBER(10),

    EVENT_TIME              TIMESTAMP
                            DEFAULT CURRENT_TIMESTAMP
                            NOT NULL,

    EVENT_STATUS            VARCHAR2(20)
                            DEFAULT 'SUCCESS'
                            NOT NULL,

    CREATED_AT              TIMESTAMP
                            DEFAULT CURRENT_TIMESTAMP
                            NOT NULL,

    UPDATED_AT              TIMESTAMP,

    UPDATED_BY              NUMBER(10),

    -----------------------------------------------------
    -- Constraints
    -----------------------------------------------------

    CONSTRAINT PK_AUDIT_LOG
        PRIMARY KEY (AUDIT_ID),

    CONSTRAINT FK_AUDIT_USER
        FOREIGN KEY (USER_ID)
        REFERENCES APP_USER(USER_ID),

    CONSTRAINT FK_AUDIT_SESSION
        FOREIGN KEY (SESSION_ID)
        REFERENCES USER_SESSION(SESSION_ID),

    CONSTRAINT FK_AUDIT_UPDATED_BY
        FOREIGN KEY (UPDATED_BY)
        REFERENCES APP_USER(USER_ID),

    CONSTRAINT CHK_AUDIT_STATUS
        CHECK
        (
            EVENT_STATUS IN
            (
                'SUCCESS',
                'FAILED',
                'WARNING',
                'INFO'
            )
        )
);

PROMPT ===========================================
PROMPT AUDIT_LOG table created successfully.
PROMPT ===========================================