-- Create a new MySQL user
CREATE USER 'kaoutar'@'%' IDENTIFIED BY '123456789';

-- Create a database if it doesn't exist
CREATE DATABASE IF NOT EXISTS myDB;

-- Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON myDB.* TO 'kaoutar'@'%';

-- Reload the grant tables to apply changes
FLUSH PRIVILEGES;
