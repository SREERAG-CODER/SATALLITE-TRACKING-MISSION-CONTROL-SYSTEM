/*
=========================================================
Project       : Satellite Mission Control System
Module        : System Configuration
Object        : SYSTEM_CONFIGURATION
File          : 111_SYSTEM_CONFIGURATION_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Stores configurable application settings used by
the Mission Control System. Supports runtime
configuration without requiring application
redeployment.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SYSTEM_CONFIGURATION CASCADE CONSTRAINTS';
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

CREATE TABLE SYSTEM_CONFIGURATION
(
    CONFIG_ID               NUMBER(10)      NOT NULL,

    CONFIG_KEY              VARCHAR2(100)   NOT NULL,

    CONFIG_VALUE            VARCHAR2(4000)  NOT NULL,

    CONFIG_CATEGORY         VARCHAR2(50)    NOT NULL,

    DESCRIPTION             VARCHAR2(500),

    DATA_TYPE               VARCHAR2(20)
                             DEFAULT 'STRING'
                             NOT NULL,

    IS_EDITABLE             CHAR(1)
                             DEFAULT 'Y'
                             NOT NULL,

    IS_ACTIVE               CHAR(1)
                             DEFAULT 'Y'
                             NOT NULL,

    CREATED_AT              TIMESTAMP
                             DEFAULT CURRENT_TIMESTAMP
                             NOT NULL,

    UPDATED_AT              TIMESTAMP,

    UPDATED_BY              NUMBER(10),

    -----------------------------------------------------
    -- Constraints
    -----------------------------------------------------

    CONSTRAINT PK_SYSTEM_CONFIGURATION
        PRIMARY KEY (CONFIG_ID),

    CONSTRAINT UK_SYSTEM_CONFIGURATION_KEY
        UNIQUE (CONFIG_KEY),

    CONSTRAINT FK_SYSTEM_CONFIGURATION_UPDATED_BY
        FOREIGN KEY (UPDATED_BY)
        REFERENCES APP_USER(USER_ID),

    CONSTRAINT CHK_SYSTEM_CONFIGURATION_EDITABLE
        CHECK (IS_EDITABLE IN ('Y','N')),

    CONSTRAINT CHK_SYSTEM_CONFIGURATION_ACTIVE
        CHECK (IS_ACTIVE IN ('Y','N')),

    CONSTRAINT CHK_SYSTEM_CONFIGURATION_TYPE
        CHECK
        (
            DATA_TYPE IN
            (
                'STRING',
                'NUMBER',
                'BOOLEAN',
                'DATE'
            )
        )
);

PROMPT ===========================================
PROMPT SYSTEM_CONFIGURATION table created successfully.
PROMPT ===========================================