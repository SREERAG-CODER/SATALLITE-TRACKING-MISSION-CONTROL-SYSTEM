/*
=========================================================
Project       : Satellite Mission Control System
Module        : Report Management
Object        : REPORT Comments
File          : 131_REPORT_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Adds descriptive comments to REPORT table.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE REPORT IS
'Stores metadata for generated reports. Report files are stored externally.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN REPORT.REPORT_ID IS
'Unique identifier for the report.';

COMMENT ON COLUMN REPORT.REPORT_NAME IS
'Display name of the report.';

COMMENT ON COLUMN REPORT.REPORT_TYPE IS
'Category of report.';

COMMENT ON COLUMN REPORT.REPORT_FORMAT IS
'File format of the generated report.';

COMMENT ON COLUMN REPORT.GENERATED_BY IS
'User who generated the report.';

COMMENT ON COLUMN REPORT.GENERATED_TIME IS
'Timestamp when the report was generated.';

COMMENT ON COLUMN REPORT.REPORT_FILE_NAME IS
'Physical filename of the generated report.';

COMMENT ON COLUMN REPORT.REPORT_STORAGE_PATH IS
'Directory where the report file is stored.';

COMMENT ON COLUMN REPORT.FILE_SIZE_BYTES IS
'Size of the generated report in bytes.';

COMMENT ON COLUMN REPORT.REPORT_HASH IS
'SHA-256 hash of the report file.';

COMMENT ON COLUMN REPORT.IS_DIGITALLY_SIGNED IS
'Indicates whether the report is digitally signed.';

COMMENT ON COLUMN REPORT.DOWNLOAD_COUNT IS
'Number of times the report has been opened.';

COMMENT ON COLUMN REPORT.LAST_ACCESSED_AT IS
'Timestamp of the last report access.';

COMMENT ON COLUMN REPORT.REPORT_STATUS IS
'Current lifecycle status of the report.';

COMMENT ON COLUMN REPORT.REFERENCE_TYPE IS
'Business entity associated with the report.';

COMMENT ON COLUMN REPORT.REFERENCE_ID IS
'Identifier of the associated business entity.';

COMMENT ON COLUMN REPORT.CREATED_AT IS
'Record creation timestamp.';

COMMENT ON COLUMN REPORT.UPDATED_AT IS
'Last modification timestamp.';

COMMENT ON COLUMN REPORT.UPDATED_BY IS
'User responsible for the latest modification.';

PROMPT ===========================================
PROMPT REPORT comments added successfully.
PROMPT ===========================================