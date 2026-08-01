/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : APP_ROLE
File          : 08_APP_ROLE_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Stores all application roles used for Role-Based
Access Control (RBAC). Each role belongs to a
department and defines the permissions and
responsibilities assigned to users.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE APP_ROLE CASCADE CONSTRAINTS';
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

CREATE TABLE APP_ROLE
(
    APP_ROLE_ID             NUMBER(10)      NOT NULL,
    DEPARTMENT_ID           NUMBER(10)      NOT NULL,
    APP_ROLE_CODE           VARCHAR2(30)    NOT NULL,
    APP_ROLE_NAME           VARCHAR2(100)   NOT NULL,
    APP_ROLE_DESCRIPTION    VARCHAR2(500),
    IS_ACTIVE               CHAR(1)         DEFAULT 'Y' NOT NULL,
    CREATED_AT              TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL,
    UPDATED_AT              TIMESTAMP
);

---------------------------------------------------------
-- Primary Key
---------------------------------------------------------

ALTER TABLE APP_ROLE
ADD CONSTRAINT PK_APP_ROLE
PRIMARY KEY (APP_ROLE_ID);

---------------------------------------------------------
-- Foreign Key
---------------------------------------------------------

ALTER TABLE APP_ROLE
ADD CONSTRAINT FK_APP_ROLE_DEPARTMENT
FOREIGN KEY (DEPARTMENT_ID)
REFERENCES DEPARTMENT(DEPARTMENT_ID);

---------------------------------------------------------
-- Unique Constraints
---------------------------------------------------------

ALTER TABLE APP_ROLE
ADD CONSTRAINT UQ_APP_ROLE_CODE
UNIQUE (APP_ROLE_CODE);

---------------------------------------------------------
-- Prevent duplicate role names within the same department
---------------------------------------------------------

ALTER TABLE APP_ROLE
ADD CONSTRAINT UQ_APP_ROLE_DEPARTMENT_ROLE
UNIQUE (DEPARTMENT_ID, APP_ROLE_NAME);

---------------------------------------------------------
-- Check Constraint
---------------------------------------------------------

ALTER TABLE APP_ROLE
ADD CONSTRAINT CHK_APP_ROLE_ACTIVE
CHECK (IS_ACTIVE IN ('Y','N'));

---------------------------------------------------------
-- Foreign Key Index
---------------------------------------------------------

CREATE INDEX IDX_APP_ROLE_DEPARTMENT
ON APP_ROLE(DEPARTMENT_ID);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT APP_ROLE table created successfully.
PROMPT ===========================================