drop database if exists cinema;
create database cinema;
use cinema;

create table country (
    id char(5) primary key,
    name varchar(25) not null
);

create table actor (
    id char(5) primary key,
    name varchar(25) not null,
    brith_date date not null,
    country char(5) not null,
    foreign key (country) references country(id)
);

create table book (
    id char(5) primary key,
    title varchar(70) not null,
    year int,
    writer varchar(80) not null
);

create table film (
    id char(5) primary key,
    title varchar(70) not null,
    year int,
    length int,
    director varchar(80) not null
    book char(5),
    foreign key (book) references book(id)
);

create table genre (
    id char(5) primary key,
    name varchar(80) not null
);

create table performs (
    actor char(5),
    film char(5),
    role varchar(10) not null
    primary key(actor, film),
    foreign key (actor) references actor(id),
    foreign key (film) references film(id)
);

create table genre_film (
    genre char(5),
    film char(5),
    primary key(genre, film),
    foreign key (genre) references genre(id),
    foreign key (film) references film(id)
);

create table film_review (
    film char(5),
    rating decimal(2, 1) unsigned not null check (rating <= 5)
    foreign key (film) references film(id) on delete cascade
);
