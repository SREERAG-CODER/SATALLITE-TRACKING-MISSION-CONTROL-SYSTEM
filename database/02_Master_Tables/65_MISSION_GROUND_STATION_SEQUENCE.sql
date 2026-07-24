/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_GROUND_STATION
File          : 65_MISSION_GROUND_STATION_SEQUENCE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Creates a sequence to generate unique
Mission-Ground Station relationship IDs.
=========================================================
*/

---------------------------------------------------------
-- Drop Sequence (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_MISSION_GROUND_STATION';
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

CREATE SEQUENCE SEQ_MISSION_GROUND_STATION
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
PROMPT MISSION_GROUND_STATION sequence created successfully.
PROMPT ===========================================