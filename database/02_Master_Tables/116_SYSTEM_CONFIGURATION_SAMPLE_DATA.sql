/*
=========================================================
Project       : Satellite Mission Control System
Module        : System Configuration
Object        : SYSTEM_CONFIGURATION Sample Data
File          : 116_SYSTEM_CONFIGURATION_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Inserts sample system configuration records.
=========================================================
*/

---------------------------------------------------------
-- Authentication
---------------------------------------------------------

INSERT INTO SYSTEM_CONFIGURATION
(CONFIG_KEY, CONFIG_VALUE, CONFIG_VALUE_ENCRYPTED,
 CONFIG_CATEGORY, DESCRIPTION, DATA_TYPE)
VALUES
('SESSION_TIMEOUT',
 '30',
 'N',
 'AUTH',
 'Session timeout in minutes.',
 'NUMBER');

INSERT INTO SYSTEM_CONFIGURATION
(CONFIG_KEY, CONFIG_VALUE, CONFIG_VALUE_ENCRYPTED,
 CONFIG_CATEGORY, DESCRIPTION, DATA_TYPE)
VALUES
('MAX_LOGIN_ATTEMPTS',
 '5',
 'N',
 'AUTH',
 'Maximum consecutive failed login attempts.',
 'NUMBER');

---------------------------------------------------------
-- Dashboard
---------------------------------------------------------

INSERT INTO SYSTEM_CONFIGURATION
(CONFIG_KEY, CONFIG_VALUE, CONFIG_VALUE_ENCRYPTED,
 CONFIG_CATEGORY, DESCRIPTION, DATA_TYPE)
VALUES
('DEFAULT_THEME',
 'DARK',
 'N',
 'DASHBOARD',
 'Default application theme.',
 'STRING');

---------------------------------------------------------
-- Notification
---------------------------------------------------------

INSERT INTO SYSTEM_CONFIGURATION
(CONFIG_KEY, CONFIG_VALUE, CONFIG_VALUE_ENCRYPTED,
 CONFIG_CATEGORY, DESCRIPTION, DATA_TYPE)
VALUES
('NOTIFICATION_RETENTION_DAYS',
 '30',
 'N',
 'NOTIFICATION',
 'Days to retain notifications.',
 'NUMBER');

---------------------------------------------------------
-- Telemetry
---------------------------------------------------------

INSERT INTO SYSTEM_CONFIGURATION
(CONFIG_KEY, CONFIG_VALUE, CONFIG_VALUE_ENCRYPTED,
 CONFIG_CATEGORY, DESCRIPTION, DATA_TYPE)
VALUES
('TELEMETRY_REFRESH_INTERVAL',
 '5',
 'N',
 'TELEMETRY',
 'Refresh interval in seconds.',
 'NUMBER');

---------------------------------------------------------
-- System
---------------------------------------------------------

INSERT INTO SYSTEM_CONFIGURATION
(CONFIG_KEY, CONFIG_VALUE, CONFIG_VALUE_ENCRYPTED,
 CONFIG_CATEGORY, DESCRIPTION, DATA_TYPE)
VALUES
('APPLICATION_VERSION',
 '1.0.0',
 'N',
 'SYSTEM',
 'Current application version.',
 'STRING');

INSERT INTO SYSTEM_CONFIGURATION
(CONFIG_KEY, CONFIG_VALUE, CONFIG_VALUE_ENCRYPTED,
 CONFIG_CATEGORY, DESCRIPTION, DATA_TYPE)
VALUES
('MAINTENANCE_MODE',
 'FALSE',
 'N',
 'SYSTEM',
 'Enables or disables maintenance mode.',
 'BOOLEAN');

COMMIT;

PROMPT ===========================================
PROMPT SYSTEM_CONFIGURATION sample data inserted.
PROMPT ===========================================