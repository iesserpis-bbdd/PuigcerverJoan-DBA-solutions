drop database if exists highschool;
create database highschool;
use highschool;

create table family (
    family_id int primary key auto_increment,
    name varchar(100) not null unique key
);

create table course (
    course_id int primary key auto_increment,
    family_id int not null,
    name varchar(100) not null,
    level enum('mitja', 'superior') not null,
    acronym varchar(5) not null unique key,
    foreign key (family_id) references family(family_id)
);

create table subject (
    subject_id varchar(4) primary key,
    course_id int not null,
    name varchar(100) not null,
    acronym varchar(5) not null unique key,
    hours int not null,
    foreign key (course_id) references course(course_id)
);

create table person (
    dni varchar(10) primary key,
    name varchar(50) not null,
    surname varchar(50) not null,
    birth_date date not null,
    phone varchar(20),
    personal_email varchar(50),
    corporate_email varchar(50)
);

create table teacher (
    dni varchar(10) primary key,
    foreign key (dni) references person(dni)
);

create table `group` (
    group_id int primary key auto_increment,
    course_id int not null,
    letter char,
    tutor_dni varchar(10) not null unique key,
    unique key(course_id, letter),
    foreign key (course_id) references course(course_id),
    foreign key (tutor_dni) references teacher(dni)
);

create table student (
    dni varchar(10) primary key,
    nia varchar(8) not null unique key,
    group_id int,
    foreign key (dni) references person(dni),
    foreign key (group_id) references `group`(group_id)
);

create table year (
    year_id int primary key auto_increment,
    year_start int not null,
    year_end int not null
);

create table enrolled (
    student_dni varchar(10),
    subject_id varchar(4),
    year_id int,
    grade decimal(4,2) check (grade >= 0 and grade <= 10),
    primary key(student_dni, subject_id, year_id),
    foreign key (student_dni) references student(dni),
    foreign key (subject_id) references subject(subject_id),
    foreign key (year_id) references year(year_id)
);

create table teaches (
    teacher_dni varchar(10),
    subject_id varchar(4),
    year_id int,
    primary key(teacher_dni, subject_id, year_id),
    foreign key (teacher_dni) references teacher(dni),
    foreign key (subject_id) references subject(subject_id),
    foreign key (year_id) references year(year_id)
);
