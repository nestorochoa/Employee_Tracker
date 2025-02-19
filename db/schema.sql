DROP DATABASE IF EXISTS employee_db;
CREATE DATABASE employee_db;

USE employee_db;

CREATE TABLE department(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE `role`(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(30) NOT NULL UNIQUE,
    salary DECIMAL NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
    ON DELETE SET NULL
);

CREATE TABLE employee(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL UNIQUE,
    last_name VARCHAR(30) NOT NULL UNIQUE,
    role_id INT,
    manager_id INT NULL,
    FOREIGN KEY (role_id) REFERENCES `role`(id)
    ON DELETE SET NULL,
    FOREIGN KEY (manager_id) REFERENCES employee(id)
    ON DELETE SET NULL
);