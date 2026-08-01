/*
=========================================================
Project       : Satellite Mission Control System
Module        : Report Management
Object        : REPORT Sample Data
File          : 132_REPORT_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Sample report records.
=========================================================
*/

---------------------------------------------------------
-- Mission Report
---------------------------------------------------------

INSERT INTO REPORT
(
    REPORT_NAME,
    REPORT_TYPE,
    REPORT_FORMAT,
    GENERATED_BY,
    REPORT_FILE_NAME,
    REPORT_STORAGE_PATH,
    FILE_SIZE_BYTES,
    REPORT_HASH,
    IS_DIGITALLY_SIGNED,
    REPORT_STATUS,
    REFERENCE_TYPE,
    REFERENCE_ID
)
VALUES
(
    'Mission Summary Report',
    'MISSION',
    'PDF',
    1,
    'Mission_Summary_20260725.pdf',
    'D:\MissionControl\Reports\',
    184320,
    'A5F4C8D8B4E1D6E4F0A9D35C123456789ABCDEF123456789ABCDEF123456789',
    'Y',
    'GENERATED',
    'MISSION',
    1
);

---------------------------------------------------------
-- Telemetry Report
---------------------------------------------------------

INSERT INTO REPORT
(
    REPORT_NAME,
    REPORT_TYPE,
    REPORT_FORMAT,
    GENERATED_BY,
    REPORT_FILE_NAME,
    REPORT_STORAGE_PATH,
    FILE_SIZE_BYTES,
    REPORT_HASH,
    IS_DIGITALLY_SIGNED,
    REPORT_STATUS,
    REFERENCE_TYPE,
    REFERENCE_ID
)
VALUES
(
    'Telemetry Analysis',
    'TELEMETRY',
    'EXCEL',
    2,
    'Telemetry_Report.xlsx',
    'D:\MissionControl\Reports\',
    95241,
    'B123C8D8B4E1D6E4F0A9D35C123456789ABCDEF123456789ABCDEF123456780',
    'N',
    'GENERATED',
    'SATELLITE',
    2
);

COMMIT;

PROMPT ===========================================
PROMPT REPORT sample data inserted successfully.
PROMPT ===========================================