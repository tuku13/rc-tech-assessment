-- Important: I used Postgres 16.4 for testing the solution

-- Create the homeroom table with name field
CREATE TABLE IF NOT EXISTS homeroom(
    id SERIAL PRIMARY KEY, -- auto-incrementing key column for easier identification
    name VARCHAR(10) NOT NULL UNIQUE -- unique character sequence with limit of 10 characters (based on the sample data fixed length or lower limit still could work)
);

-- Modify the student table to allow association between students and homerooms
ALTER TABLE student ADD homeroom_id INT; -- add homeroom_id column to the student table
ALTER TABLE student ADD FOREIGN KEY (homeroom_id) REFERENCES homeroom(id); -- make it as a foreign key referencing the homeroom's primary key

-- Create an index on the homeroom's name field for more performant querying, but it could be redundant because the name field is already unique, which means an index has already been created by the database.
CREATE INDEX homeroom_name_idx ON homeroom(name);

-- Insert the homerooms into the table
INSERT INTO homeroom VALUES (DEFAULT, '9A');
INSERT INTO homeroom VALUES (DEFAULT, '9B');