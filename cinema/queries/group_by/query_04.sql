use cinema;

select f.director, count(f.id) films
from film f
where f.director like "%George%"
group by f.director
having films = 2
order by f.director;
