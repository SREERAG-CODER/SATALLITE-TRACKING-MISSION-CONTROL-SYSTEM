/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : COMMAND
File          : 72_COMMAND_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Stores commands issued to satellites,
including scheduling, execution lifecycle,
approval workflow, acknowledgements,
and execution results.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE COMMAND CASCADE CONSTRAINTS';
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

CREATE TABLE COMMAND
(
    COMMAND_ID                  NUMBER(10)       NOT NULL,

    COMMAND_CODE                VARCHAR2(30)     NOT NULL,

    MISSION_ID                  NUMBER(10)       NOT NULL,

    SATELLITE_ID                NUMBER(10)       NOT NULL,

    MISSION_GROUND_STATION_ID   NUMBER(10)       NOT NULL,

    COMMAND_NAME                VARCHAR2(100)    NOT NULL,

    COMMAND_TYPE                VARCHAR2(30)     NOT NULL,

    COMMAND_PAYLOAD             CLOB             NOT NULL,

    PRIORITY                    NUMBER(1)
                                DEFAULT 3
                                NOT NULL,

    STATUS                      VARCHAR2(20)
                                DEFAULT 'DRAFT'
                                NOT NULL,

    SCHEDULED_TIME              TIMESTAMP,

    TRANSMITTED_TIME            TIMESTAMP,

    ACKNOWLEDGED_TIME           TIMESTAMP,

    EXECUTED_TIME               TIMESTAMP,

    RETRY_COUNT                 NUMBER(2)
                                DEFAULT 0
                                NOT NULL,

    TIMEOUT_SECONDS             NUMBER(5)
                                DEFAULT 60
                                NOT NULL,

    IS_ACKNOWLEDGED             CHAR(1)
                                DEFAULT 'N'
                                NOT NULL,

    EXECUTION_RESULT            CLOB,

    APPROVED_BY                 NUMBER(10),

    CREATED_AT                  TIMESTAMP
                                DEFAULT CURRENT_TIMESTAMP
                                NOT NULL,

    UPDATED_AT                  TIMESTAMP,

    UPDATED_BY                  NUMBER(10)
);

---------------------------------------------------------
-- Primary Key
---------------------------------------------------------

ALTER TABLE COMMAND
ADD CONSTRAINT PK_COMMAND
PRIMARY KEY (COMMAND_ID);

---------------------------------------------------------
-- Unique Constraint
---------------------------------------------------------

ALTER TABLE COMMAND
ADD CONSTRAINT UQ_COMMAND_CODE
UNIQUE (COMMAND_CODE);

---------------------------------------------------------
-- Foreign Keys
---------------------------------------------------------

ALTER TABLE COMMAND
ADD CONSTRAINT FK_COMMAND_MISSION
FOREIGN KEY (MISSION_ID)
REFERENCES MISSION(MISSION_ID);

ALTER TABLE COMMAND
ADD CONSTRAINT FK_COMMAND_SATELLITE
FOREIGN KEY (SATELLITE_ID)
REFERENCES SATELLITE(SATELLITE_ID);

ALTER TABLE COMMAND
ADD CONSTRAINT FK_COMMAND_MISSION_GROUND_STATION
FOREIGN KEY (MISSION_GROUND_STATION_ID)
REFERENCES MISSION_GROUND_STATION(MISSION_GROUND_STATION_ID);

ALTER TABLE COMMAND
ADD CONSTRAINT FK_COMMAND_APPROVED_BY
FOREIGN KEY (APPROVED_BY)
REFERENCES APP_USER(USER_ID);

ALTER TABLE COMMAND
ADD CONSTRAINT FK_COMMAND_UPDATED_BY
FOREIGN KEY (UPDATED_BY)
REFERENCES APP_USER(USER_ID);

---------------------------------------------------------
-- Check Constraints
---------------------------------------------------------

ALTER TABLE COMMAND
ADD CONSTRAINT CHK_COMMAND_PRIORITY
CHECK
(
    PRIORITY BETWEEN 1 AND 5
);

ALTER TABLE COMMAND
ADD CONSTRAINT CHK_COMMAND_ACK
CHECK
(
    IS_ACKNOWLEDGED IN ('Y','N')
);

ALTER TABLE COMMAND
ADD CONSTRAINT CHK_COMMAND_STATUS
CHECK
(
    STATUS IN
    (
        'DRAFT',
        'VALIDATED',
        'APPROVED',
        'QUEUED',
        'TRANSMITTED',
        'ACKNOWLEDGED',
        'EXECUTING',
        'COMPLETED',
        'FAILED',
        'REJECTED',
        'CANCELLED',
        'TIMEOUT'
    )
);

ALTER TABLE COMMAND
ADD CONSTRAINT CHK_COMMAND_TYPE
CHECK
(
    COMMAND_TYPE IN
    (
        'SYSTEM',
        'PAYLOAD',
        'ATTITUDE',
        'ORBIT',
        'POWER',
        'THERMAL',
        'COMMUNICATION',
        'DIAGNOSTIC'
    )
);

ALTER TABLE COMMAND
ADD CONSTRAINT CHK_COMMAND_TIMEOUT
CHECK
(
    TIMEOUT_SECONDS > 0
);

ALTER TABLE COMMAND
ADD CONSTRAINT CHK_COMMAND_RETRY
CHECK
(
    RETRY_COUNT >= 0
);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT COMMAND table created successfully.
PROMPT ===========================================