//Q2-A
students = LOAD '/home/qwerty/datasets/students.txt' using PigStorage('|') AS 
			(roll_no:int,school_name:chararray,name:chararray,age:int,gender:chararray,class:chararray,subject:chararray,totalMarksBags:int);
a = foreach students generate school_name,name,class,totalMarksBags;
grouped_students = group a by (class, name, school_name);
totalMarksBag = foreach grouped_students generate group,SUM(a.totalMarksBags) as total_totalMarksBags;
c = filter totalMarksBag by group.class=='tenth' and group.school_name=='DPS'; //change class and schollname according to req.or use parameter sub. 
d = order c by total_totalMarksBags desc;
e = limit d 1;
dump e;

//Q2-B
students = LOAD '/home/qwerty/datasets/students.txt' using PigStorage('|') AS 
			(roll_no:int,school_name:chararray,name:chararray,age:int,gender:chararray,class:chararray,subject:chararray,totalMarksBags:int);
a = foreach students generate school_name,name,class,totalMarksBags;
grouped_students =group a by (class,name,school_name);
totalMarksBag =foreach grouped_students generate group,SUM(a.totalMarksBags) as total_totalMarksBags;
c=filter totalMarksBag by group.class=='tenth'; //change class acording to req.
d = order c by total_totalMarksBags desc;
e = limit d 1;
dump e;

//Q2-C
students = LOAD '/home/qwerty/datasets/students.txt' using PigStorage('|') AS 
			(roll_no:int,school_name:chararray,name:chararray,age:int,gender:chararray,class:chararray,subject:chararray,totalMarksBags:int);
a = foreach students generate school_name,name,class,totalMarksBags;
grouped_students =group a by (school_name,name,class);
totalMarksBag =foreach grouped_students generate group,SUM(a.totalMarksBags) as total_totalMarksBags;
c = filter totalMarksBag by group.class=='tenth'; //change class according to requirement.
d = order c by total_totalMarksBags desc;
f=filter totalMarksBag by group.school_name == 'DPS' and group.class =='tenth';
g= order f by total_totalMarksBags desc;
dump g;

//Q2-D(i)
students = LOAD '/home/qwerty/datasets/students.txt' using PigStorage('|') AS 
			(roll_no:int,school_name:chararray,name:chararray,age:int,gender:chararray,class:chararray,subject:chararray,totalMarksBags:int);
a = foreach students generate gender,class,totalMarksBags;
group_gender_class = group a by (gender,class);
totalMarksBag = foreach group_gender_class generate group,MAX(SUM(a.totalMarksBags)) as total_totalMarksBags;
filter_marks = filter totalMarksBag by group.gender=='M' and group.class=='tenth';//change class as per requirement
b = foreach filter_marks generate total_totalMarksBags as M;
filter_females = filter totalMarksBag by group.gender=='F' and group.class=='tenth';
c = foreach filter_females generate total_totalMarksBags as F;
d = union b,c;
dump d;

//Q2-D(ii)
students = LOAD '/home/qwerty/datasets/students.txt' using PigStorage('|') AS 
			(roll_no:int,school_name:chararray,name:chararray,age:int,gender:chararray,class:chararray,subject:chararray,totalMarksBags:int);
a = foreach students generate school_name,gender;
grouped_students = group a by gender;
b= foreach grouped_students generate COUNT(a.gender);
grouped_students = group a by (school_name,gender);
b= foreach grouped_students generate group,COUNT(a.gender);
dump b;
