/*
=========================================================
Project       : Satellite Mission Control System
Module        : Report Management
Object        : REPORT Sequence
File          : 128_REPORT_SEQUENCE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Generates unique identifiers for REPORT.
=========================================================
*/

---------------------------------------------------------
-- Drop Sequence
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_REPORT';
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

CREATE SEQUENCE SEQ_REPORT
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE
CACHE 20;

PROMPT ===========================================
PROMPT REPORT sequence created successfully.
PROMPT ===========================================