/*
=========================================================
Project       : Integrated Satellite Tracking &
                Mission Management System (ISTMS)
Module        : User Management
Object        : Sequences
File          : 001_USER_SEQUENCES.sql
Author        : Sreerag T C
=========================================================
*/

---------------------------------------------------------
-- APP_USER
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_APP_USER';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE SEQ_APP_USER
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCACHE
NOCYCLE;

---------------------------------------------------------
-- USER_SESSION
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_USER_SESSION';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE SEQ_USER_SESSION
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCACHE
NOCYCLE;

---------------------------------------------------------
-- AUDIT_LOG
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_AUDIT_LOG';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE SEQ_AUDIT_LOG
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCACHE
NOCYCLE;

PROMPT ==========================================
PROMPT USER SEQUENCES CREATED
PROMPT ==========================================