04_DEPARTMENT_INDEX.sql
/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : DEPARTMENT
File          : 04_DEPARTMENT_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Creates additional indexes to improve query
performance on the DEPARTMENT table.
=========================================================
*/

---------------------------------------------------------
-- Drop Index (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_DEPARTMENT_ACTIVE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

---------------------------------------------------------
-- Create Index
---------------------------------------------------------

CREATE INDEX IDX_DEPARTMENT_ACTIVE
ON DEPARTMENT(IS_ACTIVE);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT DEPARTMENT indexes created successfully.
PROMPT ===========================================