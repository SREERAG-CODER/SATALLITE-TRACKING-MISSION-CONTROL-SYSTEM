/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SYSTEM_MODULE
File          : 18_SYSTEM_MODULE_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Creates additional indexes to improve query
performance on the SYSTEM_MODULE table.
=========================================================
*/

---------------------------------------------------------
-- Drop Indexes (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_SYSTEM_MODULE_PARENT';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_SYSTEM_MODULE_ACTIVE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_SYSTEM_MODULE_DISPLAY';
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

CREATE INDEX IDX_SYSTEM_MODULE_PARENT
ON SYSTEM_MODULE(PARENT_MODULE_ID);

CREATE INDEX IDX_SYSTEM_MODULE_ACTIVE
ON SYSTEM_MODULE(IS_ACTIVE);

CREATE INDEX IDX_SYSTEM_MODULE_DISPLAY
ON SYSTEM_MODULE(DISPLAY_ORDER);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SYSTEM_MODULE indexes created successfully.
PROMPT ===========================================