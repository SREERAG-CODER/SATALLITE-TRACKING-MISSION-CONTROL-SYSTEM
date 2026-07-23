/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SYSTEM_PERMISSION
File          : 25_SYSTEM_PERMISSION_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Creates additional indexes to improve query
performance on the SYSTEM_PERMISSION table.
=========================================================
*/

---------------------------------------------------------
-- Drop Indexes (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_SYSTEM_PERMISSION_MODULE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_SYSTEM_PERMISSION_CATEGORY';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_SYSTEM_PERMISSION_ACTIVE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

---------------------------------------------------------
-- Create Indexes
---------------------------------------------------------

CREATE INDEX IDX_SYSTEM_PERMISSION_MODULE
ON SYSTEM_PERMISSION(MODULE_ID);

CREATE INDEX IDX_SYSTEM_PERMISSION_CATEGORY
ON SYSTEM_PERMISSION(PERMISSION_CATEGORY);

CREATE INDEX IDX_SYSTEM_PERMISSION_ACTIVE
ON SYSTEM_PERMISSION(IS_ACTIVE);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SYSTEM_PERMISSION indexes created successfully.
PROMPT ===========================================