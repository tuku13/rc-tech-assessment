-- Important: I used Postgres 16.4 for testing the solution

CREATE TABLE subject(
    id SERIAL PRIMARY KEY, -- auto-incrementing key column for easier identification
    name VARCHAR(20) NOT NULL -- variable length character sequence with limit of 20 characters
);

-- Create a table for students attending subjects
CREATE TABLE student_attends_subject(
    id SERIAL PRIMARY KEY, -- auto-incrementing key column for easier identification
    student_id INT NOT NULL, -- referencing a student
    subject_id INT NOT NULL, -- referencing a subject
    grade smallint, -- the smallest int for memory efficiency; could be null to handle when the student is not graded

    FOREIGN KEY (student_id) REFERENCES student(id), -- foreign key to student table
    FOREIGN KEY (subject_id) REFERENCES subject(id) -- foreign key to subject table
);

-- An alternative solution could be a model with two separate tables for attendance and grade:
-- student_attends_subject(id: int, student_id: int, subject_id: int) and grade(id: int, attend_id: int, grade: smallint)
-- in this case to query grades for attendance would require an additional INNER JOIN between the student_attends_subject and grade tables

-- Insert the subject into the table
INSERT INTO subject VALUES (DEFAULT, 'Algebra');
INSERT INTO subject VALUES (DEFAULT, 'Biology');
INSERT INTO subject VALUES (DEFAULT, 'World History');

-- List the subjects
SELECT * FROM subject;