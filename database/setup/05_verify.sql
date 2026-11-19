-- Name: MUDAHINYUKA ESENGO Alkad
-- Student ID: 28978
-- Project Name: CISCS
-- File: 05_verify.sql

-- 1. Verify PDB exists and is open
SELECT name, open_mode FROM v$pdbs WHERE name = 'ALKAD_28978_CISCS_DB';

-- 2. Verify Admin User Default & Temp Tablespaces
SELECT username, default_tablespace, temporary_tablespace 
FROM dba_users WHERE username = 'ALKAD_ADMIN';

-- 3. Verify Tablespaces (Sizes, Autoextend, Max size)
SELECT tablespace_name, file_name, bytes/1024/1024 AS size_mb, 
       autoextensible, maxbytes/1024/1024 AS max_size_mb
FROM dba_data_files WHERE tablespace_name IN ('CISCS_DATA', 'CISCS_IDX');

SELECT tablespace_name, file_name, bytes/1024/1024 AS size_mb, 
       autoextensible, maxbytes/1024/1024 AS max_size_mb
FROM dba_temp_files WHERE tablespace_name = 'CISCS_TEMP';

-- 4. Archive Log Mode
ARCHIVE LOG LIST;
