/*
=========================================================
Project       : Satellite Mission Control System
Module        : Report Management
Object        : REPORT Test
File          : 134_REPORT_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Tests the Report Management module.
=========================================================
*/

---------------------------------------------------------
-- Current Reports
---------------------------------------------------------

PROMPT
PROMPT ===== CURRENT REPORTS =====

SELECT
    REPORT_ID,
    REPORT_NAME,
    REPORT_TYPE,
    REPORT_FORMAT,
    REPORT_STATUS,
    DOWNLOAD_COUNT
FROM REPORT
ORDER BY REPORT_ID;

---------------------------------------------------------
-- Register Report
---------------------------------------------------------

BEGIN

    PKG_REPORT_MANAGER.REGISTER_REPORT
    (
        P_REPORT_NAME         => 'Satellite Health Report',
        P_REPORT_TYPE         => 'SATELLITE',
        P_REPORT_FORMAT       => 'PDF',
        P_GENERATED_BY        => 1,
        P_REPORT_FILE_NAME    => 'Satellite_Health_Report.pdf',
        P_REPORT_STORAGE_PATH => 'D:\MissionControl\Reports\',
        P_FILE_SIZE_BYTES     => 254896,
        P_REPORT_HASH         => 'ABC123DEF456789ABC123DEF456789ABC123DEF456789ABC123DEF456789AB',
        P_REFERENCE_TYPE      => 'SATELLITE',
        P_REFERENCE_ID        => 1
    );

END;
/

---------------------------------------------------------
-- Open Report
---------------------------------------------------------

BEGIN

    PKG_REPORT_MANAGER.OPEN_REPORT(1);

END;
/

---------------------------------------------------------
-- Archive Report
---------------------------------------------------------

BEGIN

    PKG_REPORT_MANAGER.ARCHIVE_REPORT(2);

END;
/

---------------------------------------------------------
-- Soft Delete Report
---------------------------------------------------------

BEGIN

    PKG_REPORT_MANAGER.DELETE_REPORT(3);

END;
/

---------------------------------------------------------
-- Report Count
---------------------------------------------------------

PROMPT
PROMPT ===== TOTAL REPORTS =====

SELECT
    PKG_REPORT_MANAGER.GET_REPORT_COUNT
AS TOTAL_REPORTS
FROM DUAL;

---------------------------------------------------------
-- Package Status
---------------------------------------------------------

PROMPT
PROMPT ===== PACKAGE STATUS =====

SELECT
    OBJECT_NAME,
    STATUS
FROM USER_OBJECTS
WHERE OBJECT_NAME='PKG_REPORT_MANAGER';

---------------------------------------------------------
-- Trigger Status
---------------------------------------------------------

PROMPT
PROMPT ===== TRIGGERS =====

SELECT
    TRIGGER_NAME,
    STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME='REPORT';

---------------------------------------------------------
-- Indexes
---------------------------------------------------------

PROMPT
PROMPT ===== INDEXES =====

SELECT
    INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME='REPORT';

---------------------------------------------------------
-- Final Verification
---------------------------------------------------------

PROMPT
PROMPT ===== FINAL REPORT TABLE =====

SELECT
    REPORT_ID,
    REPORT_NAME,
    REPORT_STATUS,
    DOWNLOAD_COUNT,
    LAST_ACCESSED_AT
FROM REPORT
ORDER BY REPORT_ID;

PROMPT ===========================================
PROMPT REPORT module tested successfully.
PROMPT ===========================================