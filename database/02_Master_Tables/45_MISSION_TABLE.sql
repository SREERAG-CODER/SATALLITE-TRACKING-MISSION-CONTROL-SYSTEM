/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Management
Object        : MISSION
File          : 45_MISSION_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Stores information about satellite missions managed
by the Satellite Mission Control System.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE MISSION CASCADE CONSTRAINTS';
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

CREATE TABLE MISSION
(
    MISSION_ID                 NUMBER(10)      NOT NULL,

    MISSION_CODE               VARCHAR2(20)    NOT NULL,

    MISSION_NAME               VARCHAR2(150)   NOT NULL,

    MISSION_TYPE               VARCHAR2(30)    NOT NULL,

    STATUS                     VARCHAR2(30)
                               DEFAULT 'PLANNED'
                               NOT NULL,

    AGENCY                     VARCHAR2(100)   NOT NULL,

    MISSION_DIRECTOR           VARCHAR2(100),

    OBJECTIVE                  VARCHAR2(500),

    TARGET                     VARCHAR2(100),

    LAUNCH_SITE                VARCHAR2(100),

    PLANNED_LAUNCH_DATE        DATE,

    ACTUAL_LAUNCH_DATE         DATE,

    MISSION_END_DATE           DATE,

    MISSION_DURATION_DAYS      NUMBER(6),

    BUDGET_USD                 NUMBER(18,2),

    DESCRIPTION                VARCHAR2(1000),

    IS_ACTIVE                  CHAR(1)
                               DEFAULT 'Y'
                               NOT NULL,

    CREATED_AT                 TIMESTAMP
                               DEFAULT CURRENT_TIMESTAMP
                               NOT NULL,

    UPDATED_AT                 TIMESTAMP,

    UPDATED_BY                 NUMBER(10)
);

---------------------------------------------------------
-- Primary Key
---------------------------------------------------------

ALTER TABLE MISSION
ADD CONSTRAINT PK_MISSION
PRIMARY KEY (MISSION_ID);

---------------------------------------------------------
-- Unique Constraints
---------------------------------------------------------

ALTER TABLE MISSION
ADD CONSTRAINT UQ_MISSION_CODE
UNIQUE (MISSION_CODE);

ALTER TABLE MISSION
ADD CONSTRAINT UQ_MISSION_NAME
UNIQUE (MISSION_NAME);

---------------------------------------------------------
-- Foreign Key
---------------------------------------------------------

ALTER TABLE MISSION
ADD CONSTRAINT FK_MISSION_UPDATED_BY
FOREIGN KEY (UPDATED_BY)
REFERENCES APP_USER(USER_ID);

---------------------------------------------------------
-- Check Constraints
---------------------------------------------------------

ALTER TABLE MISSION
ADD CONSTRAINT CHK_MISSION_ACTIVE
CHECK (IS_ACTIVE IN ('Y','N'));

ALTER TABLE MISSION
ADD CONSTRAINT CHK_MISSION_TYPE
CHECK
(
    MISSION_TYPE IN
    (
        'LUNAR',
        'MARS',
        'SOLAR',
        'EARTH_OBSERVATION',
        'COMMUNICATION',
        'NAVIGATION',
        'HUMAN_SPACEFLIGHT',
        'SPACE_SCIENCE',
        'TECHNOLOGY_DEMONSTRATION'
    )
);

ALTER TABLE MISSION
ADD CONSTRAINT CHK_MISSION_STATUS
CHECK
(
    STATUS IN
    (
        'PLANNED',
        'APPROVED',
        'INTEGRATION',
        'READY_FOR_LAUNCH',
        'LAUNCHED',
        'IN_ORBIT',
        'ACTIVE',
        'COMPLETED',
        'EXTENDED',
        'ABORTED',
        'FAILED'
    )
);

ALTER TABLE MISSION
ADD CONSTRAINT CHK_MISSION_DURATION
CHECK
(
    MISSION_DURATION_DAYS IS NULL
    OR MISSION_DURATION_DAYS >= 0
);

ALTER TABLE MISSION
ADD CONSTRAINT CHK_MISSION_BUDGET
CHECK
(
    BUDGET_USD IS NULL
    OR BUDGET_USD >= 0
);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION table created successfully.
PROMPT ===========================================