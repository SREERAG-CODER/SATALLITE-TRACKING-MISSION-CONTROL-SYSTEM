/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : APP_ROLE
File          : 13_APP_ROLE_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Inserts sample application roles into the APP_ROLE
table.
=========================================================
*/

---------------------------------------------------------
-- Insert Sample Data
---------------------------------------------------------

INSERT INTO APP_ROLE
(DEPARTMENT_ID, APP_ROLE_CODE, APP_ROLE_NAME, APP_ROLE_DESCRIPTION)
VALUES
(1, 'SYS_ADMIN', 'System Administrator',
 'Manages the entire Satellite Mission Control System.');

INSERT INTO APP_ROLE
(DEPARTMENT_ID, APP_ROLE_CODE, APP_ROLE_NAME, APP_ROLE_DESCRIPTION)
VALUES
(1, 'DEPT_HEAD', 'Department Head',
 'Heads and manages the Administration department.');

INSERT INTO APP_ROLE
(DEPARTMENT_ID, APP_ROLE_CODE, APP_ROLE_NAME, APP_ROLE_DESCRIPTION)
VALUES
(2, 'SAT_ENGINEER', 'Engineer',
 'Operates and monitors satellites.');

INSERT INTO APP_ROLE
(DEPARTMENT_ID, APP_ROLE_CODE, APP_ROLE_NAME, APP_ROLE_DESCRIPTION)
VALUES
(3, 'MISSION_DIR', 'Mission Director',
 'Supervises mission execution.');

INSERT INTO APP_ROLE
(DEPARTMENT_ID, APP_ROLE_CODE, APP_ROLE_NAME, APP_ROLE_DESCRIPTION)
VALUES
(3, 'MISSION_COORD', 'Mission Coordinator',
 'Coordinates mission activities.');

INSERT INTO APP_ROLE
(DEPARTMENT_ID, APP_ROLE_CODE, APP_ROLE_NAME, APP_ROLE_DESCRIPTION)
VALUES
(4, 'GROUND_OP', 'Operator',
 'Operates ground station equipment.');

INSERT INTO APP_ROLE
(DEPARTMENT_ID, APP_ROLE_CODE, APP_ROLE_NAME, APP_ROLE_DESCRIPTION)
VALUES
(5, 'TELE_ENGINEER', 'Engineer',
 'Analyzes telemetry data.');

INSERT INTO APP_ROLE
(DEPARTMENT_ID, APP_ROLE_CODE, APP_ROLE_NAME, APP_ROLE_DESCRIPTION)
VALUES
(6, 'ORBIT_ENGINEER', 'Engineer',
 'Calculates and monitors satellite orbits.');

INSERT INTO APP_ROLE
(DEPARTMENT_ID, APP_ROLE_CODE, APP_ROLE_NAME, APP_ROLE_DESCRIPTION)
VALUES
(7, 'COMM_ENGINEER', 'Engineer',
 'Maintains satellite communication systems.');

INSERT INTO APP_ROLE
(DEPARTMENT_ID, APP_ROLE_CODE, APP_ROLE_NAME, APP_ROLE_DESCRIPTION)
VALUES
(8, 'SPACE_WEATHER', 'Scientist',
 'Monitors solar and space weather activities.');

INSERT INTO APP_ROLE
(DEPARTMENT_ID, APP_ROLE_CODE, APP_ROLE_NAME, APP_ROLE_DESCRIPTION)
VALUES
(9, 'AI_SPECIALIST', 'AI Specialist',
 'Develops intelligent recommendation systems.');

INSERT INTO APP_ROLE
(DEPARTMENT_ID, APP_ROLE_CODE, APP_ROLE_NAME, APP_ROLE_DESCRIPTION)
VALUES
(10, 'SECURITY_ANALYST', 'Security Analyst',
 'Protects mission systems from cyber threats.');

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT APP_ROLE sample data inserted successfully.
PROMPT ===========================================