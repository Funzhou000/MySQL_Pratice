CREATE DATABASE IF NOT EXISTS mysql_practice DEFAULT CHARACTER SET utf8mb4;
USE mysql_practice;

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salary_grades;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
  dept_id INT PRIMARY KEY AUTO_INCREMENT,
  dept_name VARCHAR(100) NOT NULL UNIQUE,
  location VARCHAR(100) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE salary_grades (
  grade_id INT PRIMARY KEY AUTO_INCREMENT,
  grade_name VARCHAR(50) NOT NULL UNIQUE,
  min_salary DECIMAL(10,2) NOT NULL,
  max_salary DECIMAL(10,2) NOT NULL,
  CHECK (min_salary <= max_salary)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE employees (
  emp_id INT PRIMARY KEY AUTO_INCREMENT,
  emp_name VARCHAR(100) NOT NULL,
  gender ENUM('M','F') NULL,
  hire_date DATE NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  dept_id INT NOT NULL,
  email VARCHAR(120) NULL UNIQUE,
  CONSTRAINT fk_emp_dept
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO departments (dept_name, location) VALUES
('HR', 'Beijing'),
('Engineering', 'Shanghai'),
('Finance', 'Shenzhen');

INSERT INTO salary_grades (grade_name, min_salary, max_salary) VALUES
('G1', 3000.00, 5999.99),
('G2', 6000.00, 9999.99),
('G3', 10000.00, 14999.99),
('G4', 15000.00, 25000.00);

INSERT INTO employees (emp_name, gender, hire_date, salary, dept_id, email) VALUES
('Alice', 'F', '2023-03-01', 8000.00, 2, 'alice@example.com'),
('Bob',   'M', '2022-07-15', 12000.00, 2, 'bob@example.com'),
('Cindy', 'F', '2021-11-20', 7000.00, 1, 'cindy@example.com'),
('David', 'M', '2020-01-10', 16000.00, 3, 'david@example.com');

