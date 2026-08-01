/*
=========================================================
Project       : Satellite Mission Control System
Module        : System Configuration
Object        : SYSTEM_CONFIGURATION Sequence
File          : 112_SYSTEM_CONFIGURATION_SEQUENCE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Generates unique identifiers for
SYSTEM_CONFIGURATION records.
=========================================================
*/

---------------------------------------------------------
-- Drop Sequence
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_SYSTEM_CONFIGURATION';
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

CREATE SEQUENCE SEQ_SYSTEM_CONFIGURATION
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE
CACHE 20;

PROMPT ===========================================
PROMPT SYSTEM_CONFIGURATION sequence created successfully.
PROMPT ===========================================