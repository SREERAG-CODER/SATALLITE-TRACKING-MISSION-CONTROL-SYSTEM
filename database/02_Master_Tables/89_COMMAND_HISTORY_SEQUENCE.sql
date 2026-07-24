/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : COMMAND_HISTORY
File          : 89_COMMAND_HISTORY_SEQUENCE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Creates a sequence to generate unique
Command History IDs.
=========================================================
*/

---------------------------------------------------------
-- Drop Sequence (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_COMMAND_HISTORY';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;
/

---------------------------------------------------------
-- Create Sequence
---------------------------------------------------------

CREATE SEQUENCE SEQ_COMMAND_HISTORY
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOMAXVALUE
NOCACHE
NOCYCLE;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT COMMAND_HISTORY sequence created successfully.
PROMPT ===========================================