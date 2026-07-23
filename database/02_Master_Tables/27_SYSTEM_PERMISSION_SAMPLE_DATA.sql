/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SYSTEM_PERMISSION
File          : 27_SYSTEM_PERMISSION_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Inserts sample permissions into the
SYSTEM_PERMISSION table.
=========================================================
*/

---------------------------------------------------------
-- Dashboard
---------------------------------------------------------

INSERT INTO SYSTEM_PERMISSION
(MODULE_ID, PERMISSION_CATEGORY, PERMISSION_CODE,
 PERMISSION_NAME, PERMISSION_DESCRIPTION)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'DASHBOARD'),
    'CRUD',
    'DASHBOARD_VIEW',
    'View Dashboard',
    'Allows viewing the mission control dashboard.'
);

---------------------------------------------------------
-- Satellite Management
---------------------------------------------------------

INSERT INTO SYSTEM_PERMISSION
(MODULE_ID, PERMISSION_CATEGORY, PERMISSION_CODE,
 PERMISSION_NAME, PERMISSION_DESCRIPTION)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'SATELLITE'),
    'CRUD',
    'SATELLITE_VIEW',
    'View Satellite',
    'Allows viewing satellite information.'
);

INSERT INTO SYSTEM_PERMISSION
(MODULE_ID, PERMISSION_CATEGORY, PERMISSION_CODE,
 PERMISSION_NAME, PERMISSION_DESCRIPTION)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'SATELLITE'),
    'CRUD',
    'SATELLITE_CREATE',
    'Create Satellite',
    'Allows registering a new satellite.'
);

INSERT INTO SYSTEM_PERMISSION
(MODULE_ID, PERMISSION_CATEGORY, PERMISSION_CODE,
 PERMISSION_NAME, PERMISSION_DESCRIPTION)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'SATELLITE'),
    'CRUD',
    'SATELLITE_UPDATE',
    'Update Satellite',
    'Allows updating satellite information.'
);

INSERT INTO SYSTEM_PERMISSION
(MODULE_ID, PERMISSION_CATEGORY, PERMISSION_CODE,
 PERMISSION_NAME, PERMISSION_DESCRIPTION)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'SATELLITE'),
    'CRUD',
    'SATELLITE_DELETE',
    'Delete Satellite',
    'Allows deleting satellite information.'
);

---------------------------------------------------------
-- Mission Management
---------------------------------------------------------

INSERT INTO SYSTEM_PERMISSION
(MODULE_ID, PERMISSION_CATEGORY, PERMISSION_CODE,
 PERMISSION_NAME, PERMISSION_DESCRIPTION)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'MISSION'),
    'CRUD',
    'MISSION_VIEW',
    'View Mission',
    'Allows viewing mission information.'
);

INSERT INTO SYSTEM_PERMISSION
(MODULE_ID, PERMISSION_CATEGORY, PERMISSION_CODE,
 PERMISSION_NAME, PERMISSION_DESCRIPTION)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'MISSION'),
    'APPROVAL',
    'MISSION_APPROVE',
    'Approve Mission',
    'Allows approving mission plans.'
);

---------------------------------------------------------
-- Command Center
---------------------------------------------------------

INSERT INTO SYSTEM_PERMISSION
(MODULE_ID, PERMISSION_CATEGORY, PERMISSION_CODE,
 PERMISSION_NAME, PERMISSION_DESCRIPTION)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'COMMAND'),
    'COMMAND',
    'COMMAND_EXECUTE',
    'Execute Command',
    'Allows sending commands to satellites.'
);

---------------------------------------------------------
-- AI Recommendation Engine
---------------------------------------------------------

INSERT INTO SYSTEM_PERMISSION
(MODULE_ID, PERMISSION_CATEGORY, PERMISSION_CODE,
 PERMISSION_NAME, PERMISSION_DESCRIPTION)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'AI_ENGINE'),
    'ANALYTICS',
    'AI_RECOMMEND',
    'Generate Recommendations',
    'Allows generating AI-based recommendations.'
);

---------------------------------------------------------
-- Reports
---------------------------------------------------------

INSERT INTO SYSTEM_PERMISSION
(MODULE_ID, PERMISSION_CATEGORY, PERMISSION_CODE,
 PERMISSION_NAME, PERMISSION_DESCRIPTION)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'REPORTS'),
    'REPORTING',
    'REPORT_EXPORT',
    'Export Reports',
    'Allows exporting reports.'
);

---------------------------------------------------------
-- User Management
---------------------------------------------------------

INSERT INTO SYSTEM_PERMISSION
(MODULE_ID, PERMISSION_CATEGORY, PERMISSION_CODE,
 PERMISSION_NAME, PERMISSION_DESCRIPTION)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'USER_MGMT'),
    'SECURITY',
    'USER_MANAGE',
    'Manage Users',
    'Allows managing application users.'
);

---------------------------------------------------------
-- Role Management
---------------------------------------------------------

INSERT INTO SYSTEM_PERMISSION
(MODULE_ID, PERMISSION_CATEGORY, PERMISSION_CODE,
 PERMISSION_NAME, PERMISSION_DESCRIPTION)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'ROLE_MGMT'),
    'SECURITY',
    'ROLE_MANAGE',
    'Manage Roles',
    'Allows managing application roles.'
);

---------------------------------------------------------
-- Permission Management
---------------------------------------------------------

INSERT INTO SYSTEM_PERMISSION
(MODULE_ID, PERMISSION_CATEGORY, PERMISSION_CODE,
 PERMISSION_NAME, PERMISSION_DESCRIPTION)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'PERMISSION_MGMT'),
    'SECURITY',
    'PERMISSION_MANAGE',
    'Manage Permissions',
    'Allows managing system permissions.'
);

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SYSTEM_PERMISSION sample data inserted successfully.
PROMPT ===========================================