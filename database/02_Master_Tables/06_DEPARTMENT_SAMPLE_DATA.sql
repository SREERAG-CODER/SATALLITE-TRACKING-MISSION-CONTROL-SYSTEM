/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : DEPARTMENT
File          : 06_DEPARTMENT_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Inserts sample department records into the
DEPARTMENT table.
=========================================================
*/

---------------------------------------------------------
-- Insert Sample Data
---------------------------------------------------------

INSERT INTO DEPARTMENT
(
    DEPARTMENT_CODE,
    DEPARTMENT_NAME,
    DESCRIPTION
)
VALUES
(
    'ADMIN',
    'Administration',
    'Manages administration, finance, HR and organizational operations.'
);

INSERT INTO DEPARTMENT
(
    DEPARTMENT_CODE,
    DEPARTMENT_NAME,
    DESCRIPTION
)
VALUES
(
    'SATOPS',
    'Satellite Operations',
    'Responsible for satellite monitoring and operational control.'
);

INSERT INTO DEPARTMENT
(
    DEPARTMENT_CODE,
    DEPARTMENT_NAME,
    DESCRIPTION
)
VALUES
(
    'MISSION',
    'Mission Control',
    'Plans, coordinates and supervises all mission activities.'
);

INSERT INTO DEPARTMENT
(
    DEPARTMENT_CODE,
    DEPARTMENT_NAME,
    DESCRIPTION
)
VALUES
(
    'GROUND',
    'Ground Station Network',
    'Operates and maintains ground station infrastructure.'
);

INSERT INTO DEPARTMENT
(
    DEPARTMENT_CODE,
    DEPARTMENT_NAME,
    DESCRIPTION
)
VALUES
(
    'TELE',
    'Telemetry',
    'Collects, processes and analyzes telemetry data.'
);

INSERT INTO DEPARTMENT
(
    DEPARTMENT_CODE,
    DEPARTMENT_NAME,
    DESCRIPTION
)
VALUES
(
    'ORBIT',
    'Orbit & Flight Dynamics',
    'Calculates orbital parameters and predicts satellite trajectories.'
);

INSERT INTO DEPARTMENT
(
    DEPARTMENT_CODE,
    DEPARTMENT_NAME,
    DESCRIPTION
)
VALUES
(
    'COMM',
    'Communications',
    'Manages satellite communication links and signal integrity.'
);

INSERT INTO DEPARTMENT
(
    DEPARTMENT_CODE,
    DEPARTMENT_NAME,
    DESCRIPTION
)
VALUES
(
    'WEATHER',
    'Space Weather',
    'Monitors solar activity and evaluates space weather conditions.'
);

INSERT INTO DEPARTMENT
(
    DEPARTMENT_CODE,
    DEPARTMENT_NAME,
    DESCRIPTION
)
VALUES
(
    'AI',
    'AI & Automation',
    'Develops intelligent decision support and automation systems.'
);

INSERT INTO DEPARTMENT
(
    DEPARTMENT_CODE,
    DEPARTMENT_NAME,
    DESCRIPTION
)
VALUES
(
    'SECURITY',
    'Cyber Security',
    'Protects mission infrastructure, systems and operational data.'
);

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT DEPARTMENT sample data inserted successfully.
PROMPT ===========================================