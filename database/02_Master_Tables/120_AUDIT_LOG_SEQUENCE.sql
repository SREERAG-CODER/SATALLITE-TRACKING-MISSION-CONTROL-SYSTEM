/*
=========================================================
Project       : Satellite Mission Control System
Module        : Audit Log
Object        : AUDIT_LOG Sequence
File          : 120_AUDIT_LOG_SEQUENCE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Generates unique identifiers for AUDIT_LOG.
=========================================================
*/

---------------------------------------------------------
-- Drop Sequence
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_AUDIT_LOG';
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

CREATE SEQUENCE SEQ_AUDIT_LOG
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE
CACHE 50;

PROMPT ===========================================
PROMPT AUDIT_LOG sequence created successfully.
PROMPT ===========================================