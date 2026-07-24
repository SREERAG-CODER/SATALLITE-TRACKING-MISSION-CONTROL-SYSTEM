/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : COMMAND_HISTORY
File          : 88_COMMAND_HISTORY_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Stores the complete audit trail of command
status transitions throughout the command
lifecycle.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE COMMAND_HISTORY CASCADE CONSTRAINTS';
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

CREATE TABLE COMMAND_HISTORY
(
    COMMAND_HISTORY_ID      NUMBER(10)      NOT NULL,

    COMMAND_ID              NUMBER(10)      NOT NULL,

    OLD_STATUS_ID           NUMBER(10),

    NEW_STATUS_ID           NUMBER(10)      NOT NULL,

    CHANGED_AT              TIMESTAMP
                            DEFAULT CURRENT_TIMESTAMP
                            NOT NULL,

    CHANGED_BY              NUMBER(10),

    CHANGE_REASON           VARCHAR2(200),

    REMARKS                 VARCHAR2(500),

    CREATED_AT              TIMESTAMP
                            DEFAULT CURRENT_TIMESTAMP
                            NOT NULL,

    UPDATED_AT              TIMESTAMP,

    UPDATED_BY              NUMBER(10),

    -----------------------------------------------------
    -- Primary Key
    -----------------------------------------------------

    CONSTRAINT PK_COMMAND_HISTORY
        PRIMARY KEY (COMMAND_HISTORY_ID),

    -----------------------------------------------------
    -- Foreign Keys
    -----------------------------------------------------

    CONSTRAINT FK_CMD_HISTORY_COMMAND
        FOREIGN KEY (COMMAND_ID)
        REFERENCES COMMAND (COMMAND_ID),

    CONSTRAINT FK_CMD_HISTORY_OLD_STATUS
        FOREIGN KEY (OLD_STATUS_ID)
        REFERENCES SYSTEM_STATUS (STATUS_ID),

    CONSTRAINT FK_CMD_HISTORY_NEW_STATUS
        FOREIGN KEY (NEW_STATUS_ID)
        REFERENCES SYSTEM_STATUS (STATUS_ID),

    CONSTRAINT FK_CMD_HISTORY_CHANGED_BY
        FOREIGN KEY (CHANGED_BY)
        REFERENCES APP_USER (USER_ID),

    CONSTRAINT FK_CMD_HISTORY_UPDATED_BY
        FOREIGN KEY (UPDATED_BY)
        REFERENCES APP_USER (USER_ID)
);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT COMMAND_HISTORY table created successfully.
PROMPT ===========================================