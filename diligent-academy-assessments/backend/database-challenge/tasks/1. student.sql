-- Important: I used Postgres 16.4 for testing the solution

-- Create a student table with id, name and email fields.
-- The name and email fields are variable-length character sequences with character limits for performance reasons.
CREATE TABLE IF NOT EXISTS student(
    id SERIAL PRIMARY KEY, -- auto-incrementing key column for easier identification
    name VARCHAR(100) NOT NULL, -- with variable length of 100 characters (could be less or more on a more specific task), cannot be empty
    email VARCHAR(320) NOT NULL UNIQUE -- with variable length of 320 characters (theoretical maximum length of an email), cannot be empty, only unique values are valid
);

-- Insert the students into the table
INSERT INTO student VALUES (DEFAULT, 'John', 'john@school.com');
INSERT INTO student VALUES (DEFAULT, 'Adam', 'adam@school.com');
INSERT INTO student VALUES (DEFAULT, 'Lucy', 'lucy@school.com');

-- Query all student
SELECT * FROM student;