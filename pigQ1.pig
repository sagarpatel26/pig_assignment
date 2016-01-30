//Q1-A

movies =  load '/home/qwerty/datasets/movie.txt' using PigStorage('|') as (id:int,name:chararray,year:int);
filter_year = filter movies by year!=0;
year_ordered = order filter_year by year;
grouped_year = group year_ordered by year; 
min_year = foreach grouped_year generate MIN(year_ordered.year),year_ordered.name;
oldest_movie = limit min_year 1;
dump oldest_movie;


//Q1-C
movie_rating = LOAD '/home/qwerty/datasets/moviesratings.txt' using PigStorage('|') AS (id:int,movie_id:int,rating:int);  
filtered_movies = filter movie_rating by movie_id!=0 or id !=0;     
id = foreach filtered_movies generate id;
distinct_id = DISTINCT id;
grp_id = group distinct_id all;
number_rating = foreach grp_id generate COUNT(distinct_id);
dump number_rating;


//Q1-D
movie_rating = LOAD '/home/qwerty/datasets/moviesratings.txt' using PigStorage('|') AS (id:int,movie_id:int,rating:int);  
filtered_movies = filter movie_rating by id !=0 or movie_id!=0 or rating!=0; 
movieID_rating = foreach filtered_movies generate movie_id, rating;  
grouped_movieID = group movieID_rating by movie_id;
average_ratings = foreach grouped_movieID generate group ,AVG(movieID_rating.rating) as rat;
grouped_avg = group average_ratings all; 
top3 = foreach grouped_avg generate TOP(3,1,avgr); 
dump grouped_avg;
