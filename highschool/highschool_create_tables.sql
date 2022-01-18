drop database if exists highschool;
create database highschool;
use highschool;

create table family (
    family_id int primary key auto_increment,
    name varchar(100) not null unique key
);

create table formative_course (
    course_id int primary key auto_increment,
    family_id int not null,
    name varchar(100) not null,
    acronym varchar(5) not null unique key,
    foreign key (family_id) references family(family_id)
);

create table subject (
    subject_id int primary key auto_increment,
    name varchar(100) not null,
    acronym varchar(5) not null unique key
);

create table subject_formative_course (
    subject_id int,
    course_id int,
    primary key(subject_id, course_id),
    foreign key (subject_id) references subject(subject_id),
    foreign key (course_id) references formative_course(course_id)
);

create table person (
    DNI varchar(10) primary key,
    name varchar(50) not null,
    surname varchar(50) not null,
    birth_date date not null,
    phone varchar(20),
    personal_email varchar(50),
    coorporate_email varchar(50)
);

create table teacher (
    DNI varchar(10) primary key,
    foreign key (DNI) references person(DNI)
);

create table `group` (
    group_id int primary key auto_increment,
    course_id int not null,
    letter char,
    tutor_DNI varchar(10) not null unique key,
    unique key(course_id, letter),
    foreign key (course_id) references formative_course(course_id),
    foreign key (tutor_DNI) references teacher(DNI)
);

create table student (
    DNI varchar(10) primary key,
    NIA varchar(8) not null unique key,
    group_id int,
    foreign key (DNI) references person(DNI),
    foreign key (group_id) references `group`(group_id)
);

create table year (
    year_id int primary key auto_increment,
    year_start int not null,
    year_end int not null
);

create table enrolled (
    student_DNI varchar(10),
    subject_id int,
    year_id int,
    grade decimal(4,2) check (grade >= 0 and grade <= 10),
    primary key(student_DNI, subject_id, year_id),
    foreign key (student_DNI) references student(DNI),
    foreign key (subject_id) references subject(subject_id),
    foreign key (year_id) references year(year_id)
);

create table teaches (
    teacher_DNI varchar(10),
    subject_id int,
    year_id int,
    primary key(teacher_DNI, subject_id, year_id),
    foreign key (teacher_DNI) references teacher(DNI),
    foreign key (subject_id) references subject(subject_id),
    foreign key (year_id) references year(year_id)
);
