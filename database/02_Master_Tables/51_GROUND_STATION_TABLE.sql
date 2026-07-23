/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Management
Object        : GROUND_STATION
File          : 51_GROUND_STATION_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Stores information about ground stations used
for satellite communication and mission support.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE GROUND_STATION CASCADE CONSTRAINTS';
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

CREATE TABLE GROUND_STATION
(
    GROUND_STATION_ID      NUMBER(10)       NOT NULL,

    STATION_CODE           VARCHAR2(20)     NOT NULL,

    STATION_NAME           VARCHAR2(150)    NOT NULL,

    AGENCY                 VARCHAR2(100)    NOT NULL,

    COUNTRY                VARCHAR2(100)    NOT NULL,

    CITY                   VARCHAR2(100),

    LATITUDE               NUMBER(9,6),

    LONGITUDE              NUMBER(9,6),

    ELEVATION_M            NUMBER(8,2),

    TIME_ZONE              VARCHAR2(50),

    FREQUENCY_BAND         VARCHAR2(50),

    ANTENNA_COUNT          NUMBER(3),

    STATUS                 VARCHAR2(20)
                            DEFAULT 'ACTIVE'
                            NOT NULL,

    DESCRIPTION            VARCHAR2(500),

    IS_ACTIVE              CHAR(1)
                            DEFAULT 'Y'
                            NOT NULL,

    CREATED_AT             TIMESTAMP
                            DEFAULT CURRENT_TIMESTAMP
                            NOT NULL,

    UPDATED_AT             TIMESTAMP,

    UPDATED_BY             NUMBER(10)
);

---------------------------------------------------------
-- Primary Key
---------------------------------------------------------

ALTER TABLE GROUND_STATION
ADD CONSTRAINT PK_GROUND_STATION
PRIMARY KEY (GROUND_STATION_ID);

---------------------------------------------------------
-- Unique Constraints
---------------------------------------------------------

ALTER TABLE GROUND_STATION
ADD CONSTRAINT UQ_GROUND_STATION_CODE
UNIQUE (STATION_CODE);

ALTER TABLE GROUND_STATION
ADD CONSTRAINT UQ_GROUND_STATION_NAME
UNIQUE (STATION_NAME);

---------------------------------------------------------
-- Foreign Key
---------------------------------------------------------

ALTER TABLE GROUND_STATION
ADD CONSTRAINT FK_GROUND_STATION_UPDATED_BY
FOREIGN KEY (UPDATED_BY)
REFERENCES APP_USER(USER_ID);

---------------------------------------------------------
-- Check Constraints
---------------------------------------------------------

ALTER TABLE GROUND_STATION
ADD CONSTRAINT CHK_GROUND_STATION_ACTIVE
CHECK (IS_ACTIVE IN ('Y','N'));

ALTER TABLE GROUND_STATION
ADD CONSTRAINT CHK_GROUND_STATION_STATUS
CHECK
(
    STATUS IN
    (
        'ACTIVE',
        'MAINTENANCE',
        'OFFLINE',
        'RETIRED'
    )
);

ALTER TABLE GROUND_STATION
ADD CONSTRAINT CHK_GROUND_STATION_LAT
CHECK
(
    LATITUDE BETWEEN -90 AND 90
);

ALTER TABLE GROUND_STATION
ADD CONSTRAINT CHK_GROUND_STATION_LONG
CHECK
(
    LONGITUDE BETWEEN -180 AND 180
);

ALTER TABLE GROUND_STATION
ADD CONSTRAINT CHK_GROUND_STATION_ANTENNA
CHECK
(
    ANTENNA_COUNT IS NULL
    OR ANTENNA_COUNT >= 0
);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT GROUND_STATION table created successfully.
PROMPT ===========================================