/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SYSTEM_MODULE
File          : 15_SYSTEM_MODULE_TABLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Stores all application modules and sub-modules.
Modules define the application's navigation
structure, Role-Based Access Control (RBAC),
feature management and menu hierarchy.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SYSTEM_MODULE CASCADE CONSTRAINTS';
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

CREATE TABLE SYSTEM_MODULE
(
    MODULE_ID               NUMBER(10)      NOT NULL,
    PARENT_MODULE_ID        NUMBER(10),
    MODULE_LEVEL            NUMBER(2)       DEFAULT 1 NOT NULL,
    MODULE_TYPE             VARCHAR2(30)    NOT NULL,
    MODULE_CODE             VARCHAR2(30)    NOT NULL,
    MODULE_NAME             VARCHAR2(100)   NOT NULL,
    MODULE_DESCRIPTION      VARCHAR2(500),
    ROUTE_PATH              VARCHAR2(200),
    ICON_NAME               VARCHAR2(50),
    DISPLAY_ORDER           NUMBER(5)       DEFAULT 1 NOT NULL,
    IS_MENU                 CHAR(1)         DEFAULT 'Y' NOT NULL,
    IS_ACTIVE               CHAR(1)         DEFAULT 'Y' NOT NULL,
    CREATED_AT              TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL,
    UPDATED_AT              TIMESTAMP
);

---------------------------------------------------------
-- Primary Key
---------------------------------------------------------

ALTER TABLE SYSTEM_MODULE
ADD CONSTRAINT PK_SYSTEM_MODULE
PRIMARY KEY (MODULE_ID);

---------------------------------------------------------
-- Self Referencing Foreign Key
---------------------------------------------------------

ALTER TABLE SYSTEM_MODULE
ADD CONSTRAINT FK_SYSTEM_MODULE_PARENT
FOREIGN KEY (PARENT_MODULE_ID)
REFERENCES SYSTEM_MODULE (MODULE_ID);

---------------------------------------------------------
-- Unique Constraints
---------------------------------------------------------

ALTER TABLE SYSTEM_MODULE
ADD CONSTRAINT UQ_SYSTEM_MODULE_CODE
UNIQUE (MODULE_CODE);

ALTER TABLE SYSTEM_MODULE
ADD CONSTRAINT UQ_SYSTEM_MODULE_ROUTE
UNIQUE (ROUTE_PATH);

---------------------------------------------------------
-- Check Constraints
---------------------------------------------------------

ALTER TABLE SYSTEM_MODULE
ADD CONSTRAINT CHK_SYSTEM_MODULE_LEVEL
CHECK (MODULE_LEVEL >= 1);

ALTER TABLE SYSTEM_MODULE
ADD CONSTRAINT CHK_SYSTEM_MODULE_TYPE
CHECK
(
    MODULE_TYPE IN
    (
        'MANAGEMENT',
        'MONITORING',
        'DASHBOARD',
        'AI',
        'ADMINISTRATION',
        'REPORT',
        'VISUALIZATION',
        'CONFIGURATION',
        'UTILITY'
    )
);

ALTER TABLE SYSTEM_MODULE
ADD CONSTRAINT CHK_SYSTEM_MODULE_MENU
CHECK (IS_MENU IN ('Y','N'));

ALTER TABLE SYSTEM_MODULE
ADD CONSTRAINT CHK_SYSTEM_MODULE_ACTIVE
CHECK (IS_ACTIVE IN ('Y','N'));

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SYSTEM_MODULE table created successfully.
PROMPT ===========================================