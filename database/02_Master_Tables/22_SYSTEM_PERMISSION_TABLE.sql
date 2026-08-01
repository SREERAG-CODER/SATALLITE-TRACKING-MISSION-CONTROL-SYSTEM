/*
=========================================================
Project       : Satellite Mission Control System
Module        : Security & Access Control
Object        : SYSTEM_PERMISSION
File          : 22_SYSTEM_PERMISSION_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 26-JUL-2026
=========================================================
Description:
Stores all permissions available in ISTMS.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SYSTEM_PERMISSION CASCADE CONSTRAINTS';
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

CREATE TABLE SYSTEM_PERMISSION
(
    PERMISSION_ID           NUMBER(10)      NOT NULL,
    MODULE_ID               NUMBER(10)      NOT NULL,
    PERMISSION_CATEGORY     VARCHAR2(50)    NOT NULL,
    PERMISSION_CODE         VARCHAR2(50)    NOT NULL,
    PERMISSION_NAME         VARCHAR2(100)   NOT NULL,
    PERMISSION_DESCRIPTION  VARCHAR2(500),
    IS_ACTIVE               CHAR(1)         DEFAULT 'Y' NOT NULL,
    CREATED_AT              TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL,
    UPDATED_AT              TIMESTAMP
);

---------------------------------------------------------
-- Primary Key
---------------------------------------------------------

ALTER TABLE SYSTEM_PERMISSION
ADD CONSTRAINT PK_SYSTEM_PERMISSION
PRIMARY KEY (PERMISSION_ID);

---------------------------------------------------------
-- Foreign Key
---------------------------------------------------------

ALTER TABLE SYSTEM_PERMISSION
ADD CONSTRAINT FK_SYS_PERMISSION_MODULE
FOREIGN KEY (MODULE_ID)
REFERENCES SYSTEM_MODULE(MODULE_ID);

---------------------------------------------------------
-- Unique Constraints
---------------------------------------------------------

ALTER TABLE SYSTEM_PERMISSION
ADD CONSTRAINT UQ_SYSTEM_PERMISSION_CODE
UNIQUE (PERMISSION_CODE);

---------------------------------------------------------
-- Check Constraints
---------------------------------------------------------

ALTER TABLE SYSTEM_PERMISSION
ADD CONSTRAINT CHK_SYSTEM_PERMISSION_ACTIVE
CHECK (IS_ACTIVE IN ('Y','N'));

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SYSTEM_PERMISSION table created successfully.
PROMPT ===========================================