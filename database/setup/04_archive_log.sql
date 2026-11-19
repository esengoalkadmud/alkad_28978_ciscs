-- Name: MUDAHINYUKA ESENGO Alkad
-- Student ID: 28978
-- Project Name: CISCS
-- File: 04_archive_log.sql

-- ARCHIVE LOGGING EXPLANATION:
-- Archive logging is a Container Database (CDB) level setting, not a Pluggable Database (PDB) setting.
-- A PDB shares the redo log files of the root container. 
-- Therefore, you cannot enable ARCHIVELOG mode for a single PDB; it must be enabled for the entire CDB, 
-- which requires shutting down the database, starting it in MOUNT state, altering the database, and opening it.

-- Check current mode:
ARCHIVE LOG LIST;

-- To enable on local machine (Requires SYSDBA):
-- SHUTDOWN IMMEDIATE;
-- STARTUP MOUNT;
-- ALTER DATABASE ARCHIVELOG;
-- ALTER DATABASE OPEN;
