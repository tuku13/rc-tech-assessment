-- Important: I used Postgres 16.4 for testing the solution

-- Insert the given data
INSERT INTO student_attends_subject(id, student_id, subject_id, grade) VALUES (DEFAULT, 1, 1, 3); -- John, Algebra, 3
INSERT INTO student_attends_subject(id, student_id, subject_id, grade) VALUES (DEFAULT, 1, 2, 2); -- John, Biology, 2
INSERT INTO student_attends_subject(id, student_id, subject_id, grade) VALUES (DEFAULT, 1, 3, 5); -- John, World History, 5

INSERT INTO student_attends_subject(id, student_id, subject_id, grade) VALUES (DEFAULT, 2, 1, 4); -- Adam, Algebra, 4
INSERT INTO student_attends_subject(id, student_id, subject_id, grade) VALUES (DEFAULT, 2, 2, 3); -- Adam, Biology, 3
INSERT INTO student_attends_subject(id, student_id, subject_id, grade) VALUES (DEFAULT, 2, 3, 2); -- Adam, World History, 2

INSERT INTO student_attends_subject(id, student_id, subject_id, grade) VALUES (DEFAULT, 3, 1, 5); -- Lucy, Algebra, 5
INSERT INTO student_attends_subject(id, student_id, subject_id, grade) VALUES (DEFAULT, 3, 2, 4); -- Lucy, Biology, 4
INSERT INTO student_attends_subject(id, student_id, subject_id, grade) VALUES (DEFAULT, 3, 3, 3); -- Lucy, World History, 3

-- List the average of students for each subject
SELECT subject.name as subject, avg(student_attends_subject.grade) as average
FROM student_attends_subject
        JOIN student ON student_attends_subject.student_id = student.id
        JOIN subject ON student_attends_subject.subject_id = subject.id
GROUP BY subject.name;

-- List the average of students for 'Algebra'
SELECT subject.name as subject, avg(student_attends_subject.grade) as average
FROM student_attends_subject
         JOIN student ON student_attends_subject.student_id = student.id
         JOIN subject ON student_attends_subject.subject_id = subject.id
WHERE subject.name = 'Algebra'
GROUP BY subject.name;