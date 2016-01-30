DEFINE oldest_movie_year (id, name, year) RETURNS oldest_year {

	filter_year = filter movies by $year!=0;
	year_order = order filter_year by $year;
	grouped_year = group year_order by $year; 
	min_year= foreach grouped_year generate MIN(year_order.year), year_order.name;
	$oldest_year = limit min_year 1;
};
