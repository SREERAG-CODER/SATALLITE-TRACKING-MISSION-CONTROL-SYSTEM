/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : USER_APP_ROLE
File          : 37_USER_APP_ROLE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Maps application users to application roles.
Supports assigning multiple roles to a user.
=========================================================
*/

---------------------------------------------------------
-- Drop Table (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE USER_APP_ROLE CASCADE CONSTRAINTS';
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

CREATE TABLE USER_APP_ROLE
(
    USER_ID         NUMBER(10)      NOT NULL,
    ROLE_ID         NUMBER(10)      NOT NULL,
    IS_ACTIVE       CHAR(1)         DEFAULT 'Y' NOT NULL,
    CREATED_AT      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL
);

---------------------------------------------------------
-- Primary Key
---------------------------------------------------------

ALTER TABLE USER_APP_ROLE
ADD CONSTRAINT PK_USER_APP_ROLE
PRIMARY KEY
(
    USER_ID,
    ROLE_ID
);

---------------------------------------------------------
-- Foreign Keys
---------------------------------------------------------

ALTER TABLE USER_APP_ROLE
ADD CONSTRAINT FK_USER_APP_ROLE_USER
FOREIGN KEY (USER_ID)
REFERENCES APP_USER (USER_ID);

ALTER TABLE USER_APP_ROLE
ADD CONSTRAINT FK_USER_APP_ROLE_ROLE
FOREIGN KEY (ROLE_ID)
REFERENCES APP_ROLE (ROLE_ID);

---------------------------------------------------------
-- Check Constraint
---------------------------------------------------------

ALTER TABLE USER_APP_ROLE
ADD CONSTRAINT CHK_USER_APP_ROLE_ACTIVE
CHECK (IS_ACTIVE IN ('Y','N'));

---------------------------------------------------------
-- Index
---------------------------------------------------------

CREATE INDEX IDX_USER_APP_ROLE_ROLE
ON USER_APP_ROLE(ROLE_ID);

---------------------------------------------------------
-- Comments
---------------------------------------------------------

COMMENT ON TABLE USER_APP_ROLE IS
'Maps application users to application roles. Supports Role-Based Access Control (RBAC).';

COMMENT ON COLUMN USER_APP_ROLE.USER_ID IS
'References the application user.';

COMMENT ON COLUMN USER_APP_ROLE.ROLE_ID IS
'References the assigned application role.';

COMMENT ON COLUMN USER_APP_ROLE.IS_ACTIVE IS
'Indicates whether the role assignment is active (Y) or inactive (N).';

COMMENT ON COLUMN USER_APP_ROLE.CREATED_AT IS
'Timestamp when the role assignment was created.';

---------------------------------------------------------
-- Sample Data
---------------------------------------------------------

INSERT INTO USER_APP_ROLE
(
    USER_ID,
    ROLE_ID
)
VALUES
(
    (SELECT USER_ID
     FROM APP_USER
     WHERE USERNAME = 'admin'),

    (SELECT ROLE_ID
     FROM APP_ROLE
     WHERE ROLE_CODE = 'ADMIN')
);

INSERT INTO USER_APP_ROLE
(
    USER_ID,
    ROLE_ID
)
VALUES
(
    (SELECT USER_ID
     FROM APP_USER
     WHERE USERNAME = 'mission_controller'),

    (SELECT ROLE_ID
     FROM APP_ROLE
     WHERE ROLE_CODE = 'MISSION_CONTROLLER')
);

INSERT INTO USER_APP_ROLE
(
    USER_ID,
    ROLE_ID
)
VALUES
(
    (SELECT USER_ID
     FROM APP_USER
     WHERE USERNAME = 'sat_engineer'),

    (SELECT ROLE_ID
     FROM APP_ROLE
     WHERE ROLE_CODE = 'ENGINEER')
);

INSERT INTO USER_APP_ROLE
(
    USER_ID,
    ROLE_ID
)
VALUES
(
    (SELECT USER_ID
     FROM APP_USER
     WHERE USERNAME = 'telemetry_analyst'),

    (SELECT ROLE_ID
     FROM APP_ROLE
     WHERE ROLE_CODE = 'ANALYST')
);

INSERT INTO USER_APP_ROLE
(
    USER_ID,
    ROLE_ID
)
VALUES
(
    (SELECT USER_ID
     FROM APP_USER
     WHERE USERNAME = 'ai_analyst'),

    (SELECT ROLE_ID
     FROM APP_ROLE
     WHERE ROLE_CODE = 'ANALYST')
);

COMMIT;

---------------------------------------------------------
-- Verification
---------------------------------------------------------

DESC USER_APP_ROLE;

SELECT *
FROM USER_APP_ROLE
ORDER BY USER_ID, ROLE_ID;

SELECT
    AU.USERNAME,
    AR.ROLE_NAME,
    UAR.IS_ACTIVE
FROM USER_APP_ROLE UAR
JOIN APP_USER AU
ON UAR.USER_ID = AU.USER_ID
JOIN APP_ROLE AR
ON UAR.ROLE_ID = AR.ROLE_ID
ORDER BY AU.USERNAME,
         AR.ROLE_NAME;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT USER_APP_ROLE table created successfully.
PROMPT ===========================================
