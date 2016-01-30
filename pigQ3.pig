REGISTER /home/qwerty/jarfiles/pig/Q3UDF.jar ;
data = LOAD '/user/qwerty/sd.txt' using PigStorage('|') AS(id:int,tsales:double,cper:double);
ans = FOREACH data GENERATE $0, $1, $2, xyz.sagarpatel.pig.udf.CommissionCalcUDF($0, $1, $2);
dump ans;
