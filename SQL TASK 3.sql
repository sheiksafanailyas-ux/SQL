USE financiaidb;
CREATE TABLE students_table (
	Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Course VARCHAR(20),
    Age INT,
    Marks INT,
    City VARCHAR(50)
);
select * from students_table;
insert into students_table values (21,"Darshan","BCA",19,95,"Bangalore"),
(22,"Bhuvith","B,com",25,75,"coorg"),(23,"Janvi","BBA",18,92,"coorg"),
(24,"sanath","BCA",23,85,"Pune"),(25,"Teju","BCom",20,96,"Kochi");
UPDATE students_table SET course="BCA" where students_ID=25;
UPDATE students_table SET course="BCom" where student_ID=23;
UPDATE students_table SET marks=100 where student_ID=21;
UPDATE students_table SET city="coorg" where student_ID=15;
UPDATE students_table SET city="Pune" where student_ID=1;
DELETE FROM students_table WHERE student_ID=12;
DELETE FROM students_table WHERE student_ID=18;
DELETE FROM students_table WHERE student_ID=9;
DELETE FROM students_table WHERE student_ID=21;
DELETE FROM students_table WHERE student_ID=24;