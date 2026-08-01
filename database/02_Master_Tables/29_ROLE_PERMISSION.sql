/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : ROLE_PERMISSION
File          : 29_ROLE_PERMISSION.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Maps application roles to system permissions,
implementing Role-Based Access Control (RBAC).
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ROLE_PERMISSION CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

---------------------------------------------------------
-- Create Table
---------------------------------------------------------

CREATE TABLE ROLE_PERMISSION
(
    APP_ROLE_ID        NUMBER(10)      NOT NULL,
    PERMISSION_ID      NUMBER(10)      NOT NULL,
    IS_ACTIVE          CHAR(1)         DEFAULT 'Y' NOT NULL,
    CREATED_AT         TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL
);

---------------------------------------------------------
-- Primary Key
---------------------------------------------------------

ALTER TABLE ROLE_PERMISSION
ADD CONSTRAINT PK_ROLE_PERMISSION
PRIMARY KEY
(
    APP_ROLE_ID,
    PERMISSION_ID
);

---------------------------------------------------------
-- Foreign Keys
---------------------------------------------------------

ALTER TABLE ROLE_PERMISSION
ADD CONSTRAINT FK_ROLE_PERMISSION_APP_ROLE
FOREIGN KEY (APP_ROLE_ID)
REFERENCES APP_ROLE(APP_ROLE_ID);

ALTER TABLE ROLE_PERMISSION
ADD CONSTRAINT FK_ROLE_PERMISSION_PERMISSION
FOREIGN KEY (PERMISSION_ID)
REFERENCES SYSTEM_PERMISSION(PERMISSION_ID);

---------------------------------------------------------
-- Check Constraint
---------------------------------------------------------

ALTER TABLE ROLE_PERMISSION
ADD CONSTRAINT CHK_ROLE_PERMISSION_ACTIVE
CHECK (IS_ACTIVE IN ('Y','N'));

---------------------------------------------------------
-- Index
---------------------------------------------------------

CREATE INDEX IDX_ROLE_PERMISSION_PERMISSION
ON ROLE_PERMISSION(PERMISSION_ID);

---------------------------------------------------------
-- Comments
---------------------------------------------------------

COMMENT ON TABLE ROLE_PERMISSION IS
'Maps application roles to system permissions for Role-Based Access Control (RBAC).';

COMMENT ON COLUMN ROLE_PERMISSION.APP_ROLE_ID IS
'References the application role.';

COMMENT ON COLUMN ROLE_PERMISSION.PERMISSION_ID IS
'References the assigned system permission.';

COMMENT ON COLUMN ROLE_PERMISSION.IS_ACTIVE IS
'Indicates whether the mapping is active (Y) or inactive (N).';

COMMENT ON COLUMN ROLE_PERMISSION.CREATED_AT IS
'Timestamp when the mapping was created.';

---------------------------------------------------------
-- Sample Data
---------------------------------------------------------

INSERT INTO ROLE_PERMISSION
(
    APP_ROLE_ID,
    PERMISSION_ID
)
VALUES
(
    (
        SELECT APP_ROLE_ID
        FROM APP_ROLE
        WHERE APP_ROLE_CODE = 'SYS_ADMIN'
    ),
    (
        SELECT PERMISSION_ID
        FROM SYSTEM_PERMISSION
        WHERE PERMISSION_CODE = 'USER_MANAGE'
    )
);

INSERT INTO ROLE_PERMISSION
(
    APP_ROLE_ID,
    PERMISSION_ID
)
VALUES
(
    (
        SELECT APP_ROLE_ID
        FROM APP_ROLE
        WHERE APP_ROLE_CODE = 'SYS_ADMIN'
    ),
    (
        SELECT PERMISSION_ID
        FROM SYSTEM_PERMISSION
        WHERE PERMISSION_CODE = 'ROLE_MANAGE'
    )
);

INSERT INTO ROLE_PERMISSION
(
    APP_ROLE_ID,
    PERMISSION_ID
)
VALUES
(
    (
        SELECT APP_ROLE_ID
        FROM APP_ROLE
        WHERE APP_ROLE_CODE = 'MISSION_DIR'
    ),
    (
        SELECT PERMISSION_ID
        FROM SYSTEM_PERMISSION
        WHERE PERMISSION_CODE = 'MISSION_APPROVE'
    )
);

COMMIT;

---------------------------------------------------------
-- Verification
---------------------------------------------------------

DESC ROLE_PERMISSION;

SELECT *
FROM ROLE_PERMISSION
ORDER BY APP_ROLE_ID,
         PERMISSION_ID;

SELECT
    AR.APP_ROLE_NAME,
    SP.PERMISSION_CODE,
    SP.PERMISSION_NAME
FROM ROLE_PERMISSION RP
JOIN APP_ROLE AR
ON RP.APP_ROLE_ID = AR.APP_ROLE_ID
JOIN SYSTEM_PERMISSION SP
ON RP.PERMISSION_ID = SP.PERMISSION_ID
ORDER BY
    AR.APP_ROLE_NAME,
    SP.PERMISSION_NAME;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT ROLE_PERMISSION table created successfully.
PROMPT ===========================================