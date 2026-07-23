/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : APP_USER
File          : 30_APP_USER_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Stores all application users who can access the
Satellite Mission Control System. Each user belongs
to one department and can be assigned one or more
application roles.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE APP_USER CASCADE CONSTRAINTS';
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

CREATE TABLE APP_USER
(
    USER_ID                 NUMBER(10)      NOT NULL,
    DEPARTMENT_ID           NUMBER(10)      NOT NULL,

    EMPLOYEE_ID             VARCHAR2(20)    NOT NULL,
    USERNAME                VARCHAR2(50)    NOT NULL,
    EMAIL                   VARCHAR2(100)   NOT NULL,

    PASSWORD_HASH           VARCHAR2(255)   NOT NULL,

    FIRST_NAME              VARCHAR2(50)    NOT NULL,
    LAST_NAME               VARCHAR2(50)    NOT NULL,

    PHONE_NUMBER            VARCHAR2(20),
    PROFILE_IMAGE_URL       VARCHAR2(500),

    LAST_LOGIN              TIMESTAMP,

    IS_ACTIVE               CHAR(1)         DEFAULT 'Y' NOT NULL,

    CREATED_AT              TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL,
    UPDATED_AT              TIMESTAMP
);

---------------------------------------------------------
-- Primary Key
---------------------------------------------------------

ALTER TABLE APP_USER
ADD CONSTRAINT PK_APP_USER
PRIMARY KEY (USER_ID);

---------------------------------------------------------
-- Foreign Key
---------------------------------------------------------

ALTER TABLE APP_USER
ADD CONSTRAINT FK_APP_USER_DEPARTMENT
FOREIGN KEY (DEPARTMENT_ID)
REFERENCES DEPARTMENT (DEPARTMENT_ID);

---------------------------------------------------------
-- Unique Constraints
---------------------------------------------------------

ALTER TABLE APP_USER
ADD CONSTRAINT UQ_APP_USER_EMPLOYEE_ID
UNIQUE (EMPLOYEE_ID);

ALTER TABLE APP_USER
ADD CONSTRAINT UQ_APP_USER_USERNAME
UNIQUE (USERNAME);

ALTER TABLE APP_USER
ADD CONSTRAINT UQ_APP_USER_EMAIL
UNIQUE (EMAIL);

---------------------------------------------------------
-- Check Constraints
---------------------------------------------------------

ALTER TABLE APP_USER
ADD CONSTRAINT CHK_APP_USER_ACTIVE
CHECK (IS_ACTIVE IN ('Y','N'));

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT APP_USER table created successfully.
PROMPT ===========================================