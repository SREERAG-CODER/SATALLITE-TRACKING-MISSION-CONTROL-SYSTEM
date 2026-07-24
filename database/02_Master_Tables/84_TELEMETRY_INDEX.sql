/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : TELEMETRY
File          : 84_TELEMETRY_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Creates indexes to improve query performance
for telemetry monitoring, reporting,
and time-series analysis.
=========================================================
*/

---------------------------------------------------------
-- Drop Indexes (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_TELEMETRY_MISSION';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_TELEMETRY_SATELLITE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_TELEMETRY_COMMAND';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_TELEMETRY_PARAMETER';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_TELEMETRY_RECORDED_AT';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_TELEMETRY_SAT_TIME';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_TELEMETRY_PARAM_TIME';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

---------------------------------------------------------
-- Create Indexes
---------------------------------------------------------

CREATE INDEX IDX_TELEMETRY_MISSION
ON TELEMETRY (MISSION_ID);

CREATE INDEX IDX_TELEMETRY_SATELLITE
ON TELEMETRY (SATELLITE_ID);

CREATE INDEX IDX_TELEMETRY_COMMAND
ON TELEMETRY (COMMAND_ID);

CREATE INDEX IDX_TELEMETRY_PARAMETER
ON TELEMETRY (PARAMETER_NAME);

CREATE INDEX IDX_TELEMETRY_RECORDED_AT
ON TELEMETRY (RECORDED_AT);

CREATE INDEX IDX_TELEMETRY_SAT_TIME
ON TELEMETRY
(
    SATELLITE_ID,
    RECORDED_AT
);

CREATE INDEX IDX_TELEMETRY_PARAM_TIME
ON TELEMETRY
(
    PARAMETER_NAME,
    RECORDED_AT
);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT TELEMETRY indexes created successfully.
PROMPT ===========================================