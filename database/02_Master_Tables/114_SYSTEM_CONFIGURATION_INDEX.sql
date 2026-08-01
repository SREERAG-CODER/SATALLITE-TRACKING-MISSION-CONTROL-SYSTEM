/*
=========================================================
Project       : Satellite Mission Control System
Module        : System Configuration
Object        : SYSTEM_CONFIGURATION Indexes
File          : 114_SYSTEM_CONFIGURATION_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Indexes for efficient configuration retrieval.
=========================================================
*/

---------------------------------------------------------
-- Configuration Key
---------------------------------------------------------

CREATE UNIQUE INDEX IDX_SYSTEM_CONFIGURATION_KEY
ON SYSTEM_CONFIGURATION(CONFIG_KEY);

---------------------------------------------------------
-- Configuration Category
---------------------------------------------------------

CREATE INDEX IDX_SYSTEM_CONFIGURATION_CATEGORY
ON SYSTEM_CONFIGURATION(CONFIG_CATEGORY);

---------------------------------------------------------
-- Active Configurations
---------------------------------------------------------

CREATE INDEX IDX_SYSTEM_CONFIGURATION_ACTIVE
ON SYSTEM_CONFIGURATION(IS_ACTIVE);

---------------------------------------------------------
-- Data Type
---------------------------------------------------------

CREATE INDEX IDX_SYSTEM_CONFIGURATION_TYPE
ON SYSTEM_CONFIGURATION(DATA_TYPE);

---------------------------------------------------------
-- Composite Index
---------------------------------------------------------

CREATE INDEX IDX_SYSTEM_CONFIGURATION_CATEGORY_KEY
ON SYSTEM_CONFIGURATION
(
    CONFIG_CATEGORY,
    CONFIG_KEY
);

PROMPT ===========================================
PROMPT SYSTEM_CONFIGURATION indexes created successfully.
PROMPT ===========================================