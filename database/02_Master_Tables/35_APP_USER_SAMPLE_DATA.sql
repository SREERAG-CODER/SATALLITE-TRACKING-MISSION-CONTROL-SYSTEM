/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : APP_USER
File          : 35_APP_USER_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.2.0
Created On    : 23-JUL-2026
=========================================================
Description:
Updates APP_USER with exact, verified 60-character BCrypt
password hashes generated via BCryptPasswordEncoder.
=========================================================
*/

---------------------------------------------------------
-- Update Passwords with Verified BCrypt Hashes
---------------------------------------------------------

-- Password: admin123
UPDATE APP_USER 
SET PASSWORD_HASH = '$2a$10$XY7itl2frUjbVnBUx0Qv.Ob/6zS/mvVYa1HA7Rwh6tJq42vSy3/gS'
WHERE USERNAME = 'admin';

-- Password: mission123
UPDATE APP_USER 
SET PASSWORD_HASH = '$2a$10$okLdED4b/pFCEb/EffsO0eUl8satsj1Td/BChYwyEx5cykwkr5zfC'
WHERE USERNAME = 'mission_controller';

-- Password: engineer123
UPDATE APP_USER 
SET PASSWORD_HASH = '$2a$10$MWmwxfU/h1PYwjv9lRG7JObexXXMp52EqjUQwC2yeNVpvxRiL699W'
WHERE USERNAME = 'sat_engineer';

-- Password: telemetry123
UPDATE APP_USER 
SET PASSWORD_HASH = '$2a$10$TUkILndgnQXy/cbymLEot.EbiNkjPsHnRsVVCAzbKdmR5jPb4eT3m'
WHERE USERNAME = 'telemetry_analyst';

-- Password: ai123
UPDATE APP_USER 
SET PASSWORD_HASH = '$2a$10$F7HSTobmszXm4EyFauSeXukCbijrmi0C6dC7RuLIdL5xIzKb69dOm'
WHERE USERNAME = 'ai_analyst';

---------------------------------------------------------
-- Fallback Insert (Only if users do not exist)
---------------------------------------------------------

INSERT INTO APP_USER (DEPARTMENT_ID, EMPLOYEE_ID, USERNAME, EMAIL, PASSWORD_HASH, FIRST_NAME, LAST_NAME, PHONE_NUMBER, PROFILE_IMAGE_URL)
SELECT (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_CODE = 'ADMIN'), 'EMP001', 'admin', 'admin@satmission.com', '$2a$10$XY7itl2frUjbVnBUx0Qv.Ob/6zS/mvVYa1HA7Rwh6tJq42vSy3/gS', 'System', 'Administrator', '9876543210', '/images/admin.png'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM APP_USER WHERE USERNAME = 'admin');

INSERT INTO APP_USER (DEPARTMENT_ID, EMPLOYEE_ID, USERNAME, EMAIL, PASSWORD_HASH, FIRST_NAME, LAST_NAME, PHONE_NUMBER, PROFILE_IMAGE_URL)
SELECT (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_CODE = 'MISSION'), 'EMP002', 'mission_controller', 'mission@satmission.com', '$2a$10$okLdED4b/pFCEb/EffsO0eUl8satsj1Td/BChYwyEx5cykwkr5zfC', 'Ananya', 'Nair', '9876543211', '/images/mission.png'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM APP_USER WHERE USERNAME = 'mission_controller');

INSERT INTO APP_USER (DEPARTMENT_ID, EMPLOYEE_ID, USERNAME, EMAIL, PASSWORD_HASH, FIRST_NAME, LAST_NAME, PHONE_NUMBER, PROFILE_IMAGE_URL)
SELECT (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_CODE = 'SATOPS'), 'EMP003', 'sat_engineer', 'engineer@satmission.com', '$2a$10$MWmwxfU/h1PYwjv9lRG7JObexXXMp52EqjUQwC2yeNVpvxRiL699W', 'Rahul', 'Menon', '9876543212', '/images/engineer.png'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM APP_USER WHERE USERNAME = 'sat_engineer');

INSERT INTO APP_USER (DEPARTMENT_ID, EMPLOYEE_ID, USERNAME, EMAIL, PASSWORD_HASH, FIRST_NAME, LAST_NAME, PHONE_NUMBER, PROFILE_IMAGE_URL)
SELECT (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_CODE = 'TELE'), 'EMP004', 'telemetry_analyst', 'telemetry@satmission.com', '$2a$10$TUkILndgnQXy/cbymLEot.EbiNkjPsHnRsVVCAzbKdmR5jPb4eT3m', 'Meera', 'Pillai', '9876543213', '/images/telemetry.png'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM APP_USER WHERE USERNAME = 'telemetry_analyst');

INSERT INTO APP_USER (DEPARTMENT_ID, EMPLOYEE_ID, USERNAME, EMAIL, PASSWORD_HASH, FIRST_NAME, LAST_NAME, PHONE_NUMBER, PROFILE_IMAGE_URL)
SELECT (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_CODE = 'AI'), 'EMP005', 'ai_analyst', 'ai@satmission.com', '$2a$10$F7HSTobmszXm4EyFauSeXukCbijrmi0C6dC7RuLIdL5xIzKb69dOm', 'Arjun', 'Krishna', '9876543214', '/images/ai.png'
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM APP_USER WHERE USERNAME = 'ai_analyst');

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT APP_USER passwords updated with valid BCrypt hashes.
PROMPT ===========================================