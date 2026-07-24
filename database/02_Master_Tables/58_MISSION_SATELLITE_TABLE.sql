/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_SATELLITE
File          : 58_MISSION_SATELLITE_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Stores the relationship between missions and
satellites. A mission can involve multiple
satellites and a satellite can participate
in multiple missions.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE MISSION_SATELLITE CASCADE CONSTRAINTS';
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

CREATE TABLE MISSION_SATELLITE
(
    MISSION_SATELLITE_ID    NUMBER(10)      NOT NULL,

    MISSION_ID              NUMBER(10)      NOT NULL,

    SATELLITE_ID            NUMBER(10)      NOT NULL,

    ROLE_IN_MISSION         VARCHAR2(30)    NOT NULL,

    JOIN_DATE               DATE            DEFAULT SYSDATE NOT NULL,

    LEAVE_DATE              DATE,

    STATUS                  VARCHAR2(20)
                            DEFAULT 'ACTIVE'
                            NOT NULL,

    REMARKS                 VARCHAR2(500),

    CREATED_AT              TIMESTAMP
                            DEFAULT CURRENT_TIMESTAMP
                            NOT NULL,

    UPDATED_AT              TIMESTAMP,

    UPDATED_BY              NUMBER(10)
);

---------------------------------------------------------
-- Primary Key
---------------------------------------------------------

ALTER TABLE MISSION_SATELLITE
ADD CONSTRAINT PK_MISSION_SATELLITE
PRIMARY KEY (MISSION_SATELLITE_ID);

---------------------------------------------------------
-- Foreign Keys
---------------------------------------------------------

ALTER TABLE MISSION_SATELLITE
ADD CONSTRAINT FK_MS_MISSION
FOREIGN KEY (MISSION_ID)
REFERENCES MISSION(MISSION_ID);

ALTER TABLE MISSION_SATELLITE
ADD CONSTRAINT FK_MS_SATELLITE
FOREIGN KEY (SATELLITE_ID)
REFERENCES SATELLITE(SATELLITE_ID);

ALTER TABLE MISSION_SATELLITE
ADD CONSTRAINT FK_MS_UPDATED_BY
FOREIGN KEY (UPDATED_BY)
REFERENCES APP_USER(USER_ID);

---------------------------------------------------------
-- Unique Constraint
---------------------------------------------------------

ALTER TABLE MISSION_SATELLITE
ADD CONSTRAINT UQ_MS_MISSION_SATELLITE
UNIQUE (MISSION_ID, SATELLITE_ID);

---------------------------------------------------------
-- Check Constraints
---------------------------------------------------------

ALTER TABLE MISSION_SATELLITE
ADD CONSTRAINT CHK_MS_STATUS
CHECK
(
    STATUS IN
    (
        'ACTIVE',
        'COMPLETED',
        'REMOVED'
    )
);

ALTER TABLE MISSION_SATELLITE
ADD CONSTRAINT CHK_MS_ROLE
CHECK
(
    ROLE_IN_MISSION IN
    (
        'PRIMARY',
        'SECONDARY',
        'COMMUNICATION',
        'OBSERVATION',
        'NAVIGATION',
        'WEATHER',
        'SCIENTIFIC',
        'SUPPORT'
    )
);

ALTER TABLE MISSION_SATELLITE
ADD CONSTRAINT CHK_MS_DATES
CHECK
(
    LEAVE_DATE IS NULL
    OR LEAVE_DATE >= JOIN_DATE
);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION_SATELLITE table created successfully.
PROMPT ===========================================