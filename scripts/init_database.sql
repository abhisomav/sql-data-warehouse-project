/*
===============================================================================
Script:       01_create_database_and_schemas.sql
Project:      Medallion Data Warehouse
Author:       Abhi Somav
Platform:     Microsoft SQL Server (T-SQL)

Purpose:
    Creates the DataWarehouse database and the three medallion layers as
    schemas:
        - bronze : raw data, loaded as-is from source systems
        - silver : cleaned, standardized, and conformed data
        - gold   : business-ready models (star schema) for reporting

Usage:
    Run once against a SQL Server instance before any table or load scripts.
    Running it again will fail because the database already exists.

Notes:
    - Execute from the master database context.
    - Schema names are lowercase by convention so they match the folder
      layout of the repository.

!!! WARNING !!!
    - This script DROPS and RECREATES the DataWarehouse database.
      All existing data, tables, and schemas in DataWarehouse will be
      permanently deleted.
===============================================================================
*/

USE master;

-- Drop the database if it already exists (DESTRUCTIVE)
IF DB_ID('DataWarehouse') IS NOT NULL
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
