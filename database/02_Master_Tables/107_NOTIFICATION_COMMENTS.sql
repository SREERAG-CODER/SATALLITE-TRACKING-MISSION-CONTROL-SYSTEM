/*
=========================================================
Project       : Satellite Mission Control System
Module        : Notification
Object        : NOTIFICATION Comments
File          : 107_NOTIFICATION_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Adds descriptive comments to the NOTIFICATION table
and its columns.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE NOTIFICATION IS
'Stores system-generated and user-specific notifications for Mission Control users.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN NOTIFICATION.NOTIFICATION_ID IS
'Unique identifier for the notification.';

COMMENT ON COLUMN NOTIFICATION.USER_ID IS
'Recipient user. NULL indicates a broadcast notification.';

COMMENT ON COLUMN NOTIFICATION.TITLE IS
'Notification title.';

COMMENT ON COLUMN NOTIFICATION.MESSAGE IS
'Detailed notification message.';

COMMENT ON COLUMN NOTIFICATION.NOTIFICATION_TYPE IS
'Category of notification.';

COMMENT ON COLUMN NOTIFICATION.PRIORITY IS
'Priority level of the notification.';

COMMENT ON COLUMN NOTIFICATION.IS_READ IS
'Indicates whether the notification has been read.';

COMMENT ON COLUMN NOTIFICATION.CREATED_TIME IS
'Timestamp when the notification was generated.';

COMMENT ON COLUMN NOTIFICATION.READ_TIME IS
'Timestamp when the notification was read.';

COMMENT ON COLUMN NOTIFICATION.EXPIRY_TIME IS
'Timestamp after which the notification becomes inactive.';

COMMENT ON COLUMN NOTIFICATION.CREATED_AT IS
'Record creation timestamp.';

COMMENT ON COLUMN NOTIFICATION.UPDATED_AT IS
'Last modification timestamp.';

COMMENT ON COLUMN NOTIFICATION.UPDATED_BY IS
'User responsible for the latest update.';

PROMPT ===========================================
PROMPT Notification comments added successfully.
PROMPT ===========================================