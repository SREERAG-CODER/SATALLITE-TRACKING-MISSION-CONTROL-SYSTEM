/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : APP_ROLE
File          : 11_APP_ROLE_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Displays the indexes created for the APP_ROLE table.
Primary key, unique constraints and the foreign key
index are already created during table creation.
=========================================================
*/

---------------------------------------------------------
-- Display Indexes
---------------------------------------------------------

COLUMN INDEX_NAME FORMAT A35
COLUMN UNIQUENESS FORMAT A10

SELECT INDEX_NAME,
       UNIQUENESS
FROM USER_INDEXES
WHERE TABLE_NAME = 'APP_ROLE'
ORDER BY INDEX_NAME;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT APP_ROLE indexes verified successfully.
PROMPT ===========================================