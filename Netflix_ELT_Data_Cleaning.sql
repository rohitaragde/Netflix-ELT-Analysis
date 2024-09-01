--------------------------- Netflix Table Creation and Data Cleaning -----------

---- Table Creation for appending data------
create TABLE [dbo].[netflix_raw](
	[show_id] [varchar](10) primary key,
	[type] [varchar](10) NULL,
	[title] [nvarchar](250) NULL, 
	[director] [varchar](250) NULL,
	[cast] [varchar](1000) NULL,
	[country] [varchar](150) NULL,
	[date_added] [varchar](20) NULL,
	[release_year] [int] NULL,
	[rating] [varchar](10) NULL,
	[duration] [varchar](10) NULL,
	[listed_in] [varchar](100) NULL,
	[description] [varchar](500) NULL
) 
------------------------------------Data Cleaning ---------------------------------------

------ Handling Foreign Characters ----
/* Performed in the python script and 
   chnaged the datatype of title to nvarchar
   to store the foreign characters*/

SELECT *  FROM [dbo].[netflix_raw]
where show_id='s5023'

------ Removing Duplicates -----

select show_id from [dbo].[netflix_raw]
      group by show_id
	  having count(*)>1   --- show_id is unique---


--- Find Duplicates according to title and type ---
select * from  [dbo].[netflix_raw]
where concat(upper(title),type) in
(select concat(upper(title),type)
  from [dbo].[netflix_raw] 
  group by upper(title),type
  having count(*)>1
  )
order by title

--- Removing Duplicates ---
/* The table has 8807 records and currently we have 8804 records */

with cte as
(
select *,
row_number() over(partition by title,[type] order by show_id) as rn
from [netflix_raw]
)

select *
from cte where rn=1

--- New table for listed_in,director,country,cast

select show_id,trim(value) as genre 
into netflix_genre
from netflix_raw
cross apply string_split(listed_in,',')

select * from netflix_genre

select show_id,trim(value) as cast 
into netflix_cast
from netflix_raw
cross apply string_split(cast,',')

select * from netflix_cast 

select show_id,trim(value) as director 
into netflix_director
from netflix_raw
cross apply string_split(director,',')

select * from netflix_director

select show_id,trim(value) as country 
into netflix_country
from netflix_raw
cross apply string_split(country,',')

select * from netflix_country 


---- datatype conversion for date added ---
/* Done as a part of the query in the final table creation*/


---- Populate missing values in country,duration columns

insert into netflix_country 
select show_id,m.country
from netflix_raw nr
inner join
(
  select director,country
  from netflix_country nc
  inner join netflix_directors nd on nc.show_id=nd.show_id
  group by director,country
)m on nr.director=m.director 
where nr.country is null

select * from netflix_raw where director='Ahishor Solomon'

select director,country
from  netflix_country nc
inner join netflix_directors nd on nc.show_id=nd.show_id
group by director,country

select * from netflix_raw where duration is null

--populate rest of the nulls as not_available
--drop columns director , listed_in,country,cast


---------- Creating  Final Table ---------------------------------------


with cte as
(
select *,
row_number() over(partition by title,[type] order by show_id) as rn
from [netflix_raw]
)

select show_id,[type],title,cast(date_added as date) as date_added,
       release_year,rating,case when duration is null then rating else duration end as duration,
	   [description]
into netflix_stg
from cte where rn=1















