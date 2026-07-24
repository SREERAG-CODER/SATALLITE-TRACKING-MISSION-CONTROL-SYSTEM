/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_GROUND_STATION
File          : 64_MISSION_GROUND_STATION_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Stores the relationship between missions and
ground stations, including operational role,
assignment period, and status.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE MISSION_GROUND_STATION CASCADE CONSTRAINTS';
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

CREATE TABLE MISSION_GROUND_STATION
(
    MISSION_GROUND_STATION_ID    NUMBER(10)      NOT NULL,

    MISSION_ID                   NUMBER(10)      NOT NULL,

    GROUND_STATION_ID            NUMBER(10)      NOT NULL,

    STATION_ROLE                 VARCHAR2(20)    NOT NULL,

    OPERATION_TYPE               VARCHAR2(30)    NOT NULL,

    ASSIGNMENT_START_DATE        DATE
                                 DEFAULT SYSDATE
                                 NOT NULL,

    ASSIGNMENT_END_DATE          DATE,

    STATUS                       VARCHAR2(20)
                                 DEFAULT 'ACTIVE'
                                 NOT NULL,

    REMARKS                      VARCHAR2(500),

    CREATED_AT                   TIMESTAMP
                                 DEFAULT CURRENT_TIMESTAMP
                                 NOT NULL,

    UPDATED_AT                   TIMESTAMP,

    UPDATED_BY                   NUMBER(10)
);

---------------------------------------------------------
-- Primary Key
---------------------------------------------------------

ALTER TABLE MISSION_GROUND_STATION
ADD CONSTRAINT PK_MISSION_GROUND_STATION
PRIMARY KEY (MISSION_GROUND_STATION_ID);

---------------------------------------------------------
-- Foreign Keys
---------------------------------------------------------

ALTER TABLE MISSION_GROUND_STATION
ADD CONSTRAINT FK_MGS_MISSION
FOREIGN KEY (MISSION_ID)
REFERENCES MISSION (MISSION_ID);

ALTER TABLE MISSION_GROUND_STATION
ADD CONSTRAINT FK_MGS_GROUND_STATION
FOREIGN KEY (GROUND_STATION_ID)
REFERENCES GROUND_STATION (GROUND_STATION_ID);

ALTER TABLE MISSION_GROUND_STATION
ADD CONSTRAINT FK_MGS_UPDATED_BY
FOREIGN KEY (UPDATED_BY)
REFERENCES APP_USER (USER_ID);

---------------------------------------------------------
-- Unique Constraint
---------------------------------------------------------

ALTER TABLE MISSION_GROUND_STATION
ADD CONSTRAINT UQ_MGS_MISSION_STATION
UNIQUE (MISSION_ID, GROUND_STATION_ID);

---------------------------------------------------------
-- Check Constraints
---------------------------------------------------------

ALTER TABLE MISSION_GROUND_STATION
ADD CONSTRAINT CHK_MGS_STATION_ROLE
CHECK
(
    STATION_ROLE IN
    (
        'PRIMARY',
        'BACKUP',
        'TRACKING',
        'RELAY'
    )
);

ALTER TABLE MISSION_GROUND_STATION
ADD CONSTRAINT CHK_MGS_OPERATION_TYPE
CHECK
(
    OPERATION_TYPE IN
    (
        'TELEMETRY',
        'COMMAND',
        'TRACKING',
        'LAUNCH_SUPPORT',
        'DEEP_SPACE'
    )
);

ALTER TABLE MISSION_GROUND_STATION
ADD CONSTRAINT CHK_MGS_STATUS
CHECK
(
    STATUS IN
    (
        'ACTIVE',
        'COMPLETED',
        'SUSPENDED'
    )
);

ALTER TABLE MISSION_GROUND_STATION
ADD CONSTRAINT CHK_MGS_DATES
CHECK
(
    ASSIGNMENT_END_DATE IS NULL
    OR ASSIGNMENT_END_DATE >= ASSIGNMENT_START_DATE
);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION_GROUND_STATION table created successfully.
PROMPT ===========================================