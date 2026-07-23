/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Management
Object        : MISSION
File          : 50_MISSION_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Inserts sample mission records using real-world
space missions for demonstration and testing.
=========================================================
*/

---------------------------------------------------------
-- Chandrayaan-3
---------------------------------------------------------

INSERT INTO MISSION
(
    MISSION_CODE,
    MISSION_NAME,
    MISSION_TYPE,
    STATUS,
    AGENCY,
    MISSION_DIRECTOR,
    OBJECTIVE,
    TARGET,
    LAUNCH_SITE,
    PLANNED_LAUNCH_DATE,
    ACTUAL_LAUNCH_DATE,
    MISSION_DURATION_DAYS,
    BUDGET_USD,
    DESCRIPTION
)
VALUES
(
    'CH3',
    'Chandrayaan-3',
    'LUNAR',
    'COMPLETED',
    'ISRO',
    'P. Veeramuthuvel',
    'Demonstrate safe lunar landing and rover operations.',
    'Moon',
    'Satish Dhawan Space Centre',
    DATE '2023-07-14',
    DATE '2023-07-14',
    40,
    75000000,
    'India''s third lunar exploration mission with successful soft landing near the lunar south pole.'
);

---------------------------------------------------------
-- Aditya-L1
---------------------------------------------------------

INSERT INTO MISSION
(
    MISSION_CODE,
    MISSION_NAME,
    MISSION_TYPE,
    STATUS,
    AGENCY,
    MISSION_DIRECTOR,
    OBJECTIVE,
    TARGET,
    LAUNCH_SITE,
    PLANNED_LAUNCH_DATE,
    ACTUAL_LAUNCH_DATE,
    BUDGET_USD,
    DESCRIPTION
)
VALUES
(
    'ADITYA_L1',
    'Aditya-L1',
    'SOLAR',
    'ACTIVE',
    'ISRO',
    'Nigar Shaji',
    'Study the Sun from the Lagrange Point L1.',
    'Sun',
    'Satish Dhawan Space Centre',
    DATE '2023-09-02',
    DATE '2023-09-02',
    46000000,
    'India''s first dedicated solar observation mission.'
);

---------------------------------------------------------
-- Mars Orbiter Mission
---------------------------------------------------------

INSERT INTO MISSION
(
    MISSION_CODE,
    MISSION_NAME,
    MISSION_TYPE,
    STATUS,
    AGENCY,
    MISSION_DIRECTOR,
    OBJECTIVE,
    TARGET,
    LAUNCH_SITE,
    PLANNED_LAUNCH_DATE,
    ACTUAL_LAUNCH_DATE,
    MISSION_DURATION_DAYS,
    BUDGET_USD,
    DESCRIPTION
)
VALUES
(
    'MOM',
    'Mars Orbiter Mission',
    'MARS',
    'COMPLETED',
    'ISRO',
    'S. Arunan',
    'Demonstrate interplanetary mission capability and study Mars.',
    'Mars',
    'Satish Dhawan Space Centre',
    DATE '2013-11-05',
    DATE '2013-11-05',
    2982,
    74000000,
    'Also known as Mangalyaan, India''s first mission to Mars.'
);

---------------------------------------------------------
-- Gaganyaan
---------------------------------------------------------

INSERT INTO MISSION
(
    MISSION_CODE,
    MISSION_NAME,
    MISSION_TYPE,
    STATUS,
    AGENCY,
    MISSION_DIRECTOR,
    OBJECTIVE,
    TARGET,
    LAUNCH_SITE,
    PLANNED_LAUNCH_DATE,
    BUDGET_USD,
    DESCRIPTION
)
VALUES
(
    'GAGANYAAN',
    'Gaganyaan',
    'HUMAN_SPACEFLIGHT',
    'READY_FOR_LAUNCH',
    'ISRO',
    'R. Hutton',
    'Demonstrate India''s human spaceflight capability.',
    'Low Earth Orbit',
    'Satish Dhawan Space Centre',
    DATE '2027-01-01',
    1100000000,
    'India''s first crewed orbital mission.'
);

---------------------------------------------------------
-- XPoSat
---------------------------------------------------------

INSERT INTO MISSION
(
    MISSION_CODE,
    MISSION_NAME,
    MISSION_TYPE,
    STATUS,
    AGENCY,
    MISSION_DIRECTOR,
    OBJECTIVE,
    TARGET,
    LAUNCH_SITE,
    PLANNED_LAUNCH_DATE,
    ACTUAL_LAUNCH_DATE,
    BUDGET_USD,
    DESCRIPTION
)
VALUES
(
    'XPOSAT',
    'XPoSat',
    'SPACE_SCIENCE',
    'ACTIVE',
    'ISRO',
    NULL,
    'Study X-ray polarization from astronomical sources.',
    'Deep Space',
    'Satish Dhawan Space Centre',
    DATE '2024-01-01',
    DATE '2024-01-01',
    NULL,
    'India''s first dedicated X-ray polarimetry mission.'
);

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION sample data inserted successfully.
PROMPT ===========================================