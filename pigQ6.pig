students = LOAD '/home/qwerty/datasets/students.txt' using PigStorage('|') AS 
			(roll_no:int, school_name:chararray, name:chararray, age:int, gender:chararray, class:chararray, subject:chararray, marks:int);
a = foreach students generate school_name,gender;
b = filter a by gender=='$X';
grouped_students = group b by (school_name,gender);
c = foreach grouped_students generate group,COUNT($1);
dump c;
 