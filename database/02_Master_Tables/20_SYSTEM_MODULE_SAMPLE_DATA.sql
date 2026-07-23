/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SYSTEM_MODULE
File          : 20_SYSTEM_MODULE_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Inserts sample data into the SYSTEM_MODULE table,
including both root modules and selected
sub-modules to demonstrate the module hierarchy.
=========================================================
*/

---------------------------------------------------------
-- Root Modules
---------------------------------------------------------

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'DASHBOARD', 'DASHBOARD', 'Dashboard',
'Displays the overall mission control dashboard.',
'/dashboard', 'dashboard', 1, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'MANAGEMENT', 'SATELLITE', 'Satellite Management',
'Manages satellite information.',
'/satellites', 'satellite', 2, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'MANAGEMENT', 'MISSION', 'Mission Management',
'Manages satellite missions.',
'/missions', 'rocket_launch', 3, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'MANAGEMENT', 'GROUND_STATION', 'Ground Station Management',
'Manages ground stations.',
'/ground-stations', 'public', 4, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'MONITORING', 'TELEMETRY', 'Telemetry Monitoring',
'Monitors telemetry received from satellites.',
'/telemetry', 'monitor_heart', 5, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'MONITORING', 'HEALTH', 'Satellite Health',
'Monitors satellite subsystem health.',
'/health', 'health_and_safety', 6, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'MANAGEMENT', 'COMMAND', 'Command Center',
'Sends operational commands to satellites.',
'/commands', 'send', 7, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'MONITORING', 'COMMUNICATION', 'Communication Logs',
'Tracks satellite communication sessions.',
'/communications', 'forum', 8, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'MONITORING', 'SPACE_WEATHER', 'Space Weather',
'Monitors space weather conditions.',
'/space-weather', 'cloud', 9, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'AI', 'AI_ENGINE', 'AI Recommendation Engine',
'Provides intelligent operational recommendations.',
'/ai-engine', 'psychology', 10, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'REPORT', 'REPORTS', 'Reports',
'Generates operational reports.',
'/reports', 'description', 11, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'ADMINISTRATION', 'USER_MGMT', 'User Management',
'Manages application users.',
'/users', 'group', 12, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'ADMINISTRATION', 'ROLE_MGMT', 'Role Management',
'Manages application roles.',
'/roles', 'admin_panel_settings', 13, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'ADMINISTRATION', 'PERMISSION_MGMT', 'Permission Management',
'Manages system permissions.',
'/permissions', 'security', 14, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'REPORT', 'AUDIT_LOG', 'Audit Logs',
'Displays application audit logs.',
'/audit-logs', 'history', 15, 'Y');

INSERT INTO SYSTEM_MODULE
(MODULE_LEVEL, MODULE_TYPE, MODULE_CODE, MODULE_NAME,
 MODULE_DESCRIPTION, ROUTE_PATH, ICON_NAME,
 DISPLAY_ORDER, IS_MENU)
VALUES
(1, 'CONFIGURATION', 'SETTINGS', 'System Settings',
'Manages application configuration.',
'/settings', 'settings', 16, 'Y');

---------------------------------------------------------
-- Sample Sub-Modules
---------------------------------------------------------

INSERT INTO SYSTEM_MODULE
(PARENT_MODULE_ID, MODULE_LEVEL, MODULE_TYPE,
 MODULE_CODE, MODULE_NAME, MODULE_DESCRIPTION,
 ROUTE_PATH, ICON_NAME, DISPLAY_ORDER, IS_MENU)
VALUES
(2, 2, 'MANAGEMENT',
'SAT_ADD', 'Add Satellite',
'Registers a new satellite.',
'/satellites/add', 'add', 1, 'N');

INSERT INTO SYSTEM_MODULE
(PARENT_MODULE_ID, MODULE_LEVEL, MODULE_TYPE,
 MODULE_CODE, MODULE_NAME, MODULE_DESCRIPTION,
 ROUTE_PATH, ICON_NAME, DISPLAY_ORDER, IS_MENU)
VALUES
(2, 2, 'MANAGEMENT',
'SAT_VIEW', 'View Satellites',
'Displays all satellites.',
'/satellites/view', 'visibility', 2, 'N');

INSERT INTO SYSTEM_MODULE
(PARENT_MODULE_ID, MODULE_LEVEL, MODULE_TYPE,
 MODULE_CODE, MODULE_NAME, MODULE_DESCRIPTION,
 ROUTE_PATH, ICON_NAME, DISPLAY_ORDER, IS_MENU)
VALUES
(3, 2, 'MANAGEMENT',
'MISSION_CREATE', 'Create Mission',
'Creates a new satellite mission.',
'/missions/create', 'add_task', 1, 'N');

INSERT INTO SYSTEM_MODULE
(PARENT_MODULE_ID, MODULE_LEVEL, MODULE_TYPE,
 MODULE_CODE, MODULE_NAME, MODULE_DESCRIPTION,
 ROUTE_PATH, ICON_NAME, DISPLAY_ORDER, IS_MENU)
VALUES
(3, 2, 'REPORT',
'MISSION_TIMELINE', 'Mission Timeline',
'Displays the mission timeline.',
'/missions/timeline', 'timeline', 2, 'N');

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SYSTEM_MODULE sample data inserted successfully.
PROMPT ===========================================