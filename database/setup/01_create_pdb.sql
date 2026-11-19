-- Name: MUDAHINYUKA ESENGO Alkad
-- Student ID: 28978
-- Project Name: CISCS
-- File: 01_create_pdb.sql

-- Connect to CDB$ROOT as SYSDBA first
CREATE PLUGGABLE DATABASE alkad_28978_ciscs_db
ADMIN USER alkad_admin IDENTIFIED BY "alkad"
FILE_NAME_CONVERT = ('/opt/oracle/oradata/FREE/pdbseed/', '/opt/oracle/oradata/FREE/alkad_28978_ciscs_db/',
                     '/opt/oracle/oradata/FREE/FREEPDB1/', '/opt/oracle/oradata/FREE/alkad_28978_ciscs_db/');

-- Open the PDB and save state
ALTER PLUGGABLE DATABASE alkad_28978_ciscs_db OPEN;
ALTER PLUGGABLE DATABASE alkad_28978_ciscs_db SAVE STATE;
