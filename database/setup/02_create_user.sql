-- Name: MUDAHINYUKA ESENGO Alkad
-- Student ID: 28978
-- Project Name: CISCS
-- File: 02_create_user.sql

ALTER SESSION SET CONTAINER = alkad_28978_ciscs_db;

-- Create a specific application user for the project
CREATE USER ciscs_app IDENTIFIED BY "app_password";
GRANT CONNECT, RESOURCE, DBA TO ciscs_app;
