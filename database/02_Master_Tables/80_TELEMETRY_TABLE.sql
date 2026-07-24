/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : TELEMETRY
File          : 80_TELEMETRY_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Stores telemetry received from satellites,
including parameter values, quality,
timestamps, and optional command correlation.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE TELEMETRY CASCADE CONSTRAINTS';
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

CREATE TABLE TELEMETRY
(
    TELEMETRY_ID            NUMBER(10)      NOT NULL,

    MISSION_ID              NUMBER(10)      NOT NULL,

    SATELLITE_ID            NUMBER(10)      NOT NULL,

    COMMAND_ID              NUMBER(10),

    PARAMETER_NAME          VARCHAR2(100)   NOT NULL,

    PARAMETER_VALUE         NUMBER(18,6)    NOT NULL,

    UNIT                    VARCHAR2(20)    NOT NULL,

    QUALITY_FLAG            VARCHAR2(20)
                            DEFAULT 'GOOD'
                            NOT NULL,

    SOURCE                  VARCHAR2(30)
                            DEFAULT 'SATELLITE'
                            NOT NULL,

    RECORDED_AT             TIMESTAMP
                            DEFAULT CURRENT_TIMESTAMP
                            NOT NULL,

    CREATED_AT              TIMESTAMP
                            DEFAULT CURRENT_TIMESTAMP
                            NOT NULL,

    UPDATED_AT              TIMESTAMP,

    UPDATED_BY              NUMBER(10)
);