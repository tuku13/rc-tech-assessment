-- Important: I used Postgres 16.4 for testing the solution

-- Associate the students and the homerooms, assuming these homerooms: [{id=1, name='9A'}, {id=2, name='9B'}]
UPDATE student SET homeroom_id=1 WHERE name='John';
UPDATE student SET homeroom_id=1 WHERE name='Adam';
UPDATE student SET homeroom_id=2 WHERE name='Lucy';

-- Select every student
SELECT student.name, homeroom.name
FROM student
         INNER JOIN homeroom ON homeroom.id = student.homeroom_id;

-- Select the student from homeroom 9A
SELECT student.name, homeroom.name -- show the student's name and the homeroom's name
FROM student
        INNER JOIN homeroom ON homeroom.id = student.homeroom_id -- join the students and homerooms
WHERE homeroom.name = '9A'; -- select the students who are in homeroom 9A