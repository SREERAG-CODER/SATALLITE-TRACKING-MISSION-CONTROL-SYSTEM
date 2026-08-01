/*==========================================================
  Project      : Integrated Satellite Tracking &
                 Mission Management System (ISTMS)
  File         : 05_DATABASE_VERIFICATION.sql
  Module       : Database Setup
  Author       : Sreerag T C
==========================================================*/

PROMPT ==========================================
PROMPT DATABASE VERIFICATION
PROMPT ==========================================

-------------------------------------------------
-- Current User
-------------------------------------------------

PROMPT
PROMPT Current User

SHOW USER;

-------------------------------------------------
-- Current Schema
-------------------------------------------------

PROMPT
PROMPT Current Schema

SELECT SYS_CONTEXT('USERENV','CURRENT_SCHEMA') AS CURRENT_SCHEMA
FROM DUAL;

-------------------------------------------------
-- Oracle Version
-------------------------------------------------

PROMPT
PROMPT Oracle Version

SELECT BANNER
FROM V$VERSION;

-------------------------------------------------
-- Database Name
-------------------------------------------------

PROMPT
PROMPT Database Name

SELECT NAME
FROM V$DATABASE;

-------------------------------------------------
-- Tablespace
-------------------------------------------------

PROMPT
PROMPT Default Tablespace

SELECT DEFAULT_TABLESPACE
FROM USER_USERS;

-------------------------------------------------
-- Existing Tables
-------------------------------------------------

PROMPT
PROMPT Existing Tables

SELECT TABLE_NAME
FROM USER_TABLES
ORDER BY TABLE_NAME;

-------------------------------------------------
-- Existing Sequences
-------------------------------------------------

PROMPT
PROMPT Existing Sequences

SELECT SEQUENCE_NAME
FROM USER_SEQUENCES
ORDER BY SEQUENCE_NAME;

-------------------------------------------------
-- Existing Triggers
-------------------------------------------------

PROMPT
PROMPT Existing Triggers

SELECT TRIGGER_NAME
FROM USER_TRIGGERS
ORDER BY TRIGGER_NAME;

-------------------------------------------------
-- Existing Views
-------------------------------------------------

PROMPT
PROMPT Existing Views

SELECT VIEW_NAME
FROM USER_VIEWS
ORDER BY VIEW_NAME;

-------------------------------------------------
-- Existing Packages
-------------------------------------------------

PROMPT
PROMPT Existing Packages

SELECT OBJECT_NAME
FROM USER_OBJECTS
WHERE OBJECT_TYPE='PACKAGE'
ORDER BY OBJECT_NAME;

PROMPT ==========================================
PROMPT DATABASE VERIFICATION COMPLETED
PROMPT ==========================================