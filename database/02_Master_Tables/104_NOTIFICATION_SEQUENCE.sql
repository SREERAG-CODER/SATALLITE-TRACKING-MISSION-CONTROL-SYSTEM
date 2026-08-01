/*
=========================================================
Project       : Satellite Mission Control System
Module        : Notification
Object        : NOTIFICATION Sequence
File          : 104_NOTIFICATION_SEQUENCE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Generates unique identifiers for the NOTIFICATION
table.
=========================================================
*/

---------------------------------------------------------
-- Drop Sequence
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_NOTIFICATION';
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

CREATE SEQUENCE SEQ_NOTIFICATION
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE
CACHE 20;

PROMPT ===========================================
PROMPT NOTIFICATION sequence created successfully.
PROMPT ===========================================