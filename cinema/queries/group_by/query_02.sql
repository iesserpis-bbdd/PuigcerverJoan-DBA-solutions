use cinema;

select g.id, g.name, count(f.id) how_many_films, round(avg(f.length)) average_legnth
from genre g
inner join genre_film gf
    on gf.genre = g.id
inner join film f
    on gf.film = f.id
group by g.id
having how_many_films > 5
order by g.name;
