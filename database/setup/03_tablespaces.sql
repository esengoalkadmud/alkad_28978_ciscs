-- Name: MUDAHINYUKA ESENGO Alkad
-- Student ID: 28978
-- Project Name: CISCS
-- File: 03_tablespaces.sql

ALTER SESSION SET CONTAINER = alkad_28978_ciscs_db;

-- 1. Data Tablespace
CREATE TABLESPACE ciscs_data 
DATAFILE 'ciscs_data01.dbf' SIZE 100M 
AUTOEXTEND ON NEXT 10M MAXSIZE 1G;

-- 2. Index Tablespace
CREATE TABLESPACE ciscs_idx 
DATAFILE 'ciscs_idx01.dbf' SIZE 50M 
AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

-- 3. Temporary Tablespace
CREATE TEMPORARY TABLESPACE ciscs_temp 
TEMPFILE 'ciscs_temp01.dbf' SIZE 50M 
AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

-- Assign defaults to the admin user
ALTER USER alkad_admin DEFAULT TABLESPACE ciscs_data;
ALTER USER alkad_admin TEMPORARY TABLESPACE ciscs_temp;
ALTER USER alkad_admin QUOTA UNLIMITED ON ciscs_data;
ALTER USER alkad_admin QUOTA UNLIMITED ON ciscs_idx;
