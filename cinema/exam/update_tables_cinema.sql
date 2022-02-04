use cinema;

alter table film
    modify title varchar(80),
    modify length int unsigned;

alter table film_review
    add email varchar(100),
    add primary key(film, email);
