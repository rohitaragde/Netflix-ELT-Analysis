-------------------- Netflix Data Analysis ------------------------


---- Original Raw Table ------
select * from netflix_raw 


---- Other Tables derived using string_split() -----

select * from netflix_cast
select * from netflix_country
select * from netflix_directors
select * from netflix_genre

---- Final Cleaned Table---

select * from netflix_stg

------------------------- Netflix Data Analysis --------------------------------------

/* 1. For each director, count the no of movies and tv shows created by them in seperate
      columns for directors who have created tv shows and movies both*/

select nd.director,
count(distinct case when n.type='Movie' then n.show_id end) as no_of_movies,
count(distinct case when n.type='TV Show' then n.show_id end) as no_of_TV_Show
from netflix_stg n inner join netflix_directors nd
on n.show_id=nd.show_id
group by nd.director 
having count(distinct n.[type])>1

-- order by runs after select and hence we can use alias

/* 2. Which Country has the highest number of comedy movies*/

select top 1 nc.country,count(distinct ng.show_id) as no_of_movies 
from netflix_genre ng inner join netflix_country nc
on ng.show_id=nc.show_id
inner join netflix_stg n on ng.show_id=n.show_id 
where ng.genre like '%Comedies%' and n.type='Movie'
group by nc.country 
order by no_of_movies desc

/* 3. For each user (as per date added to netflix), whihc director has maximum
      number of movies released */

with cte as
(
  select nd.director,
       year(date_added) as date_year,
	   count(n.show_id) as no_of_movies
from netflix_stg n inner join netflix_directors nd
on n.show_id=nd.show_id
where type='movie'
group by nd.director,year(date_added)
),

cte2 as
(
select *,
row_number() over(partition by date_year order by no_of_movies desc, director) as rn
from cte 
)

select * from cte2 where rn=1


/* 4. What is the average duration of movies in each genre */

select ng.genre,avg(cast(replace(duration,' min',' ') as int))as avg_duration
from netflix_stg n inner join netflix_genre ng
on n.show_id=ng.show_id
where type='movie'
group by ng.genre

/* 5. Find the list of directors who have created horror and comedy movies both.
      Display director names along with number of comedy and horror movies
	  directed by them */

select nd.director,
count(distinct case when ng.genre='Comedies' then n.show_id end) as no_of_comedy,
count(case when ng.genre='Horror Movies' then n.show_id end) as no_of_horror
from netflix_stg n
inner join netflix_genre ng
on n.show_id=ng.show_id
inner join netflix_directors nd
on n.show_id=nd.show_id
where type='movie' 
and ng.genre in('Comedies','Horror Movies')
group by nd.director
having count(distinct ng.genre)=2

select * from netflix_genre where 
show_id 
in(select show_id from netflix_directors where director like '%Tim Burton%')
order by genre 