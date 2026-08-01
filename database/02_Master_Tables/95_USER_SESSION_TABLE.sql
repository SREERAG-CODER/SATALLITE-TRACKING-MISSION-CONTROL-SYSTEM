/*
=========================================================
Project       : Satellite Mission Control System
Module        : Security
Object        : USER_SESSION
File          : 95_USER_SESSION_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Stores authenticated user sessions created after
successful login. Maintains login, logout and
session activity information for auditing and
security monitoring.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE USER_SESSION CASCADE CONSTRAINTS';
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

CREATE TABLE USER_SESSION
(
    SESSION_ID              NUMBER(10)      NOT NULL,

    USER_ID                 NUMBER(10)      NOT NULL,

    SESSION_TOKEN           VARCHAR2(512)   NOT NULL,

    LOGIN_TIME              TIMESTAMP
                            DEFAULT CURRENT_TIMESTAMP
                            NOT NULL,

    LAST_ACTIVITY_TIME      TIMESTAMP
                            DEFAULT CURRENT_TIMESTAMP
                            NOT NULL,

    LOGOUT_TIME             TIMESTAMP,

    CLIENT_IP               VARCHAR2(50),

    DEVICE_NAME             VARCHAR2(100),

    OPERATING_SYSTEM        VARCHAR2(100),

    CLIENT_APPLICATION      VARCHAR2(100),

    SESSION_STATUS          VARCHAR2(20)
                            DEFAULT 'ACTIVE'
                            NOT NULL,

    CREATED_AT              TIMESTAMP
                            DEFAULT CURRENT_TIMESTAMP
                            NOT NULL,

    UPDATED_AT              TIMESTAMP,

    UPDATED_BY              NUMBER(10),

    -----------------------------------------------------
    -- Primary Key
    -----------------------------------------------------

    CONSTRAINT PK_USER_SESSION
        PRIMARY KEY (SESSION_ID),

    -----------------------------------------------------
    -- Foreign Keys
    -----------------------------------------------------

    CONSTRAINT FK_USER_SESSION_USER
        FOREIGN KEY (USER_ID)
        REFERENCES APP_USER (USER_ID),

    CONSTRAINT FK_USER_SESSION_UPDATED_BY
        FOREIGN KEY (UPDATED_BY)
        REFERENCES APP_USER (USER_ID),

    -----------------------------------------------------
    -- Check Constraints
    -----------------------------------------------------

    CONSTRAINT CHK_SESSION_STATUS
        CHECK
        (
            SESSION_STATUS IN
            (
                'ACTIVE',
                'EXPIRED',
                'LOGGED_OUT',
                'LOCKED'
            )
        )
);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT USER_SESSION table created successfully.
PROMPT ===========================================