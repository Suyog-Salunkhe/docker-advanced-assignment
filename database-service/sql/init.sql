-- Create a database
CREATE DATABASE IF NOT EXISTS `db-candidate-service`;

-- Switch to the created database
USE `db-candidate-service`;

-- Create a table
CREATE TABLE IF NOT EXISTS candidates (
    candidate_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_name VARCHAR(100) NOT NULL,
    designation VARCHAR(100) NOT NULL,
    organisation_name VARCHAR(100) UNIQUE NOT NULL,
    years_of_experience VARCHAR(15)
);
