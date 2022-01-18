drop database if exists music;
create database music;
use music;

create table song (
    id int primary key,
    title varchar(30) not null,
    length int
);

create table company (
    id int primary key,
    name varchar(30) not null,
    address varchar(30),
    fax varchar(10),
    phone varchar(10)
);

create table band (
    id int primary key,
    name varchar(30) not null,
    `date` date,
    country varchar(30)
);

create table album (
    id int primary key,
    name varchar(30) not null,
    `date` date,
    company int not null,
    band int not null,
    foreign key (company) references company(id),
    foreign key (band) references band(id)
);

create table song_album (
    song int,
    album int,
    primary key(song, album),
    foreign key (song) references song(id),
    foreign key (album) references album(id)
);

create table artist (
    dni varchar(10) primary key,
    name varchar(30) not null
);

create table band_component (
    dni varchar(10),
    band int,
    role varchar(10),
    primary key(dni, band),
    foreign key (dni) references artist(dni),
    foreign key (band) references band(id)
);

create table fan_club (
    id int primary key,
    name varchar(30) not null,
    address varchar(30),
    num int,
    band int not null,
    foreign key (band) references band(id)
);

