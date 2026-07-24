/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : COMMAND_HISTORY
File          : 92_COMMAND_HISTORY_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Creates indexes to improve query performance
for command audit history retrieval.
=========================================================
*/

---------------------------------------------------------
-- Drop Indexes (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_CMD_HIST_COMMAND';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_CMD_HIST_CHANGED_AT';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_CMD_HIST_CHANGED_BY';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_CMD_HIST_NEW_STATUS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_CMD_HIST_CMD_TIME';
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

CREATE INDEX IDX_CMD_HIST_COMMAND
ON COMMAND_HISTORY (COMMAND_ID);

CREATE INDEX IDX_CMD_HIST_CHANGED_AT
ON COMMAND_HISTORY (CHANGED_AT);

CREATE INDEX IDX_CMD_HIST_CHANGED_BY
ON COMMAND_HISTORY (CHANGED_BY);

CREATE INDEX IDX_CMD_HIST_NEW_STATUS
ON COMMAND_HISTORY (NEW_STATUS_ID);

---------------------------------------------------------
-- Composite Index
---------------------------------------------------------

CREATE INDEX IDX_CMD_HIST_CMD_TIME
ON COMMAND_HISTORY
(
    COMMAND_ID,
    CHANGED_AT
);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT COMMAND_HISTORY indexes created successfully.
PROMPT ===========================================