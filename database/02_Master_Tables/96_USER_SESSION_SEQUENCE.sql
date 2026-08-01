/*
=========================================================
Project       : Satellite Mission Control System
Module        : Security
Object        : USER_SESSION Sequence
File          : 96_USER_SESSION_SEQUENCE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Generates unique identifiers for USER_SESSION
records.
=========================================================
*/

---------------------------------------------------------
-- Drop Sequence (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_USER_SESSION';
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

CREATE SEQUENCE SEQ_USER_SESSION
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE
CACHE 20;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT USER_SESSION sequence created successfully.
PROMPT ===========================================