/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SATELLITE
File          : 38_SATELLITE_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Stores master information about satellites managed
by the Satellite Mission Control System.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SATELLITE CASCADE CONSTRAINTS';
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

CREATE TABLE SATELLITE
(
    SATELLITE_ID           NUMBER(10)      NOT NULL,

    SATELLITE_CODE         VARCHAR2(20)    NOT NULL,
    SATELLITE_NAME         VARCHAR2(100)   NOT NULL,

    NORAD_ID               NUMBER(10),

    SATELLITE_TYPE         VARCHAR2(30)    NOT NULL,

    STATUS                 VARCHAR2(20)
                           DEFAULT 'PLANNED'
                           NOT NULL,

    OPERATOR               VARCHAR2(100),

    MANUFACTURER           VARCHAR2(100),

    COUNTRY                VARCHAR2(100),

    LAUNCH_VEHICLE         VARCHAR2(100),

    ORBIT_TYPE             VARCHAR2(30),

    MASS_KG                NUMBER(10,2),

    POWER_W                NUMBER(10,2),

    LAUNCH_DATE            DATE,

    EXPECTED_LIFE_YEARS    NUMBER(3),

    DESCRIPTION            VARCHAR2(500),

    IS_ACTIVE              CHAR(1)
                           DEFAULT 'Y'
                           NOT NULL,

    CREATED_AT             TIMESTAMP
                           DEFAULT CURRENT_TIMESTAMP
                           NOT NULL,

    UPDATED_AT             TIMESTAMP
);

---------------------------------------------------------
-- Primary Key
---------------------------------------------------------

ALTER TABLE SATELLITE
ADD CONSTRAINT PK_SATELLITE
PRIMARY KEY (SATELLITE_ID);

---------------------------------------------------------
-- Unique Constraints
---------------------------------------------------------

ALTER TABLE SATELLITE
ADD CONSTRAINT UQ_SATELLITE_CODE
UNIQUE (SATELLITE_CODE);

ALTER TABLE SATELLITE
ADD CONSTRAINT UQ_SATELLITE_NAME
UNIQUE (SATELLITE_NAME);

ALTER TABLE SATELLITE
ADD CONSTRAINT UQ_SATELLITE_NORAD
UNIQUE (NORAD_ID);

---------------------------------------------------------
-- Check Constraints
---------------------------------------------------------

ALTER TABLE SATELLITE
ADD CONSTRAINT CHK_SATELLITE_ACTIVE
CHECK (IS_ACTIVE IN ('Y','N'));

ALTER TABLE SATELLITE
ADD CONSTRAINT CHK_SATELLITE_STATUS
CHECK
(
    STATUS IN
    (
        'PLANNED',
        'ACTIVE',
        'STANDBY',
        'MAINTENANCE',
        'RETIRED',
        'FAILED'
    )
);

ALTER TABLE SATELLITE
ADD CONSTRAINT CHK_SATELLITE_TYPE
CHECK
(
    SATELLITE_TYPE IN
    (
        'COMMUNICATION',
        'EARTH_OBSERVATION',
        'NAVIGATION',
        'SCIENTIFIC',
        'WEATHER',
        'MILITARY'
    )
);

ALTER TABLE SATELLITE
ADD CONSTRAINT CHK_ORBIT_TYPE
CHECK
(
    ORBIT_TYPE IN
    (
        'LEO',
        'MEO',
        'GEO',
        'HEO',
        'POLAR',
        'SUN_SYNCHRONOUS'
    )
);

ALTER TABLE SATELLITE
ADD CONSTRAINT CHK_MASS
CHECK
(
    MASS_KG IS NULL
    OR MASS_KG > 0
);

ALTER TABLE SATELLITE
ADD CONSTRAINT CHK_POWER
CHECK
(
    POWER_W IS NULL
    OR POWER_W > 0
);

ALTER TABLE SATELLITE
ADD CONSTRAINT CHK_LIFE
CHECK
(
    EXPECTED_LIFE_YEARS IS NULL
    OR EXPECTED_LIFE_YEARS >= 0
);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SATELLITE table created successfully.
PROMPT ===========================================