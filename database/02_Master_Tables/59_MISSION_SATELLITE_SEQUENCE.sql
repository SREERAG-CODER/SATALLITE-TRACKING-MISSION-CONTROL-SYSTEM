/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_SATELLITE
File          : 59_MISSION_SATELLITE_SEQUENCE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Creates a sequence to generate unique
Mission-Satellite relationship IDs.
=========================================================
*/

---------------------------------------------------------
-- Drop Sequence (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_MISSION_SATELLITE';
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

CREATE SEQUENCE SEQ_MISSION_SATELLITE
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
PROMPT MISSION_SATELLITE sequence created successfully.
PROMPT ===========================================