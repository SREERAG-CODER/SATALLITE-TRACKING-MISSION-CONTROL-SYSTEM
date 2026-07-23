/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : DEPARTMENT
File          : 01_DEPARTMENT_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
Last Modified : 23-JUL-2026
=========================================================
Description:
Stores all organizational departments.
=========================================================
*/

---------------------------------------------------------
-- Drop table (Development Only) : if the table already exists, it gets dropped; if it doesn't exist (ORA-00942), the script continues
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE DEPARTMENT CASCADE CONSTRAINTS';
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

CREATE TABLE DEPARTMENT
(
    DEPARTMENT_ID      NUMBER(10)          NOT NULL,
    DEPARTMENT_CODE    VARCHAR2(10)    NOT NULL,
    DEPARTMENT_NAME    VARCHAR2(100)   NOT NULL,
    DESCRIPTION        VARCHAR2(500),
    IS_ACTIVE          CHAR(1)         DEFAULT 'Y' NOT NULL,
    CREATED_AT         TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL,
    UPDATED_AT         TIMESTAMP
);

---------------------------------------------------------
-- Primary Key
---------------------------------------------------------

ALTER TABLE DEPARTMENT
ADD CONSTRAINT PK_DEPARTMENT
PRIMARY KEY (DEPARTMENT_ID);

---------------------------------------------------------
-- Unique Constraints
---------------------------------------------------------

ALTER TABLE DEPARTMENT
ADD CONSTRAINT UQ_DEPARTMENT_CODE
UNIQUE (DEPARTMENT_CODE);

ALTER TABLE DEPARTMENT
ADD CONSTRAINT UQ_DEPARTMENT_NAME
UNIQUE (DEPARTMENT_NAME);

---------------------------------------------------------
-- Check Constraints
---------------------------------------------------------

ALTER TABLE DEPARTMENT
ADD CONSTRAINT CHK_DEPARTMENT_ACTIVE
CHECK (IS_ACTIVE IN ('Y','N'));

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT DEPARTMENT table created successfully.
PROMPT ===========================================