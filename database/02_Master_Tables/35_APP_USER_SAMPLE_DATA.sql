/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : APP_USER
File          : 35_APP_USER_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Inserts sample users into the APP_USER table.
=========================================================
*/

---------------------------------------------------------
-- Administrator
---------------------------------------------------------

INSERT INTO APP_USER
(
    DEPARTMENT_ID,
    EMPLOYEE_ID,
    USERNAME,
    EMAIL,
    PASSWORD_HASH,
    FIRST_NAME,
    LAST_NAME,
    PHONE_NUMBER,
    PROFILE_IMAGE_URL
)
VALUES
(
    (SELECT DEPARTMENT_ID
     FROM DEPARTMENT
     WHERE DEPARTMENT_CODE = 'ADMIN'),

    'EMP001',
    'admin',
    'admin@satmission.com',
    '$2B$ADMIN_HASH',
    'System',
    'Administrator',
    '9876543210',
    '/images/admin.png'
);

---------------------------------------------------------
-- Mission Controller
---------------------------------------------------------

INSERT INTO APP_USER
(
    DEPARTMENT_ID,
    EMPLOYEE_ID,
    USERNAME,
    EMAIL,
    PASSWORD_HASH,
    FIRST_NAME,
    LAST_NAME,
    PHONE_NUMBER,
    PROFILE_IMAGE_URL
)
VALUES
(
    (SELECT DEPARTMENT_ID
     FROM DEPARTMENT
     WHERE DEPARTMENT_CODE = 'MISSION'),

    'EMP002',
    'mission_controller',
    'mission@satmission.com',
    '$2B$MISSION_HASH',
    'Ananya',
    'Nair',
    '9876543211',
    '/images/mission.png'
);

---------------------------------------------------------
-- Satellite Engineer
---------------------------------------------------------

INSERT INTO APP_USER
(
    DEPARTMENT_ID,
    EMPLOYEE_ID,
    USERNAME,
    EMAIL,
    PASSWORD_HASH,
    FIRST_NAME,
    LAST_NAME,
    PHONE_NUMBER,
    PROFILE_IMAGE_URL
)
VALUES
(
    (SELECT DEPARTMENT_ID
     FROM DEPARTMENT
     WHERE DEPARTMENT_CODE = 'ENGINEERING'),

    'EMP003',
    'sat_engineer',
    'engineer@satmission.com',
    '$2B$ENGINEER_HASH',
    'Rahul',
    'Menon',
    '9876543212',
    '/images/engineer.png'
);

---------------------------------------------------------
-- Telemetry Analyst
---------------------------------------------------------

INSERT INTO APP_USER
(
    DEPARTMENT_ID,
    EMPLOYEE_ID,
    USERNAME,
    EMAIL,
    PASSWORD_HASH,
    FIRST_NAME,
    LAST_NAME,
    PHONE_NUMBER,
    PROFILE_IMAGE_URL
)
VALUES
(
    (SELECT DEPARTMENT_ID
     FROM DEPARTMENT
     WHERE DEPARTMENT_CODE = 'TELEMETRY'),

    'EMP004',
    'telemetry_analyst',
    'telemetry@satmission.com',
    '$2B$TELEMETRY_HASH',
    'Meera',
    'Pillai',
    '9876543213',
    '/images/telemetry.png'
);

---------------------------------------------------------
-- AI Analyst
---------------------------------------------------------

INSERT INTO APP_USER
(
    DEPARTMENT_ID,
    EMPLOYEE_ID,
    USERNAME,
    EMAIL,
    PASSWORD_HASH,
    FIRST_NAME,
    LAST_NAME,
    PHONE_NUMBER,
    PROFILE_IMAGE_URL
)
VALUES
(
    (SELECT DEPARTMENT_ID
     FROM DEPARTMENT
     WHERE DEPARTMENT_CODE = 'AI'),

    'EMP005',
    'ai_analyst',
    'ai@satmission.com',
    '$2B$AI_HASH',
    'Arjun',
    'Krishna',
    '9876543214',
    '/images/ai.png'
);

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT APP_USER sample data inserted successfully.
PROMPT ===========================================