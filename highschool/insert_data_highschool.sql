USE highschool;

INSERT INTO family(family_id, name) VALUES
(1, "Informàtica i comunicacions");

INSERT INTO course(course_id, name, acronym, family_id, level) VALUES
(1, "Administració de Sistemes Informàtics en Xarxa", "ASIX", 1, "superior"),
(2, "Desenvolupament d'Aplicacions Multiplataforma", "DAM", 1, "superior"),
(3, "Desenvolupament d'Aplicacions Web", "DAW", 1, "superior"),
(4, "Sistemes Microinformàtics en Xarxa", "SMX", 1, "mitja");

INSERT INTO subject(subject_id, course_id, name, acronym, hours) VALUES
("0369", 1, "Implantació de Sistemes Operatius en Xarxa", "ISO", "224"),
("0370", 1, "Planificació i administració de xarxes", "PAX", "192"),
("0371", 1, "Fonaments de maquinari", "FHW", "96"),
("0373", 1, "Llenguatge de marques i sistemes de gestió d'informació", "LLM", "96"),
("0374", 1, "Administració de sistemes operatius", "ASO", "120"),
("0375", 1, "Serveis de xarxa i Internet", "SXI", "120"),
("0376", 1, "Implantació d'aplicacions web", "IAW", "100"),
("0377", 1, "Administració de sistemes gestors de bases de dades", "SGBD", "60"),
("0378", 1, "Seguretat i alta disponibilitat", "SAD", "100"),
("0483", 3, "Sistemes Informàtics", "SI", "160"),
("0484", 3, "Bases de Dades", "DBA", "160"),
("0485", 3, "Programació", "PRG", "256"),
("0487", 3, "Entorns de Desenvolupament", "IDE", "96");

INSERT INTO person(dni, name, surname, phone, birth_date, personal_email, corporate_email) VALUES 
("10000000A", "Pere", "Martí", "923456781", "2001-06-14", "peremm@gmail.com", "pere.marti@iesserpis.org"),
("10000001B", "Josep", "Mora", "58489546787", "1986-05-20", "josepmor@gmail.com", "josep.mora@alu.iesserpis.org"),
("10000002C", "Sandra", "Noguera","64852556","1994-12-31","sandranog@gmail.com" ,"sandra.noguera@alu.iesserpis.org"),
("10000003D", "Laura", "Moll","969789789", "2000-11-25", "laura.moll@gmail.com","laura.moll@iesserpis.org"),
("10000004E", "Antonio", "Llopis", "654456781", "1996-02-24", "toniuskov@gmail.com", "antllo@iesserpis.org"),
("00000020A", "Takuto", "Kurosawa", "623466781", "2000-01-23", "takuto@gmail.com", "takku@iesserpis.org"),
("00000014A", "Augusto", "Julio", "623456351", "1994-08-19", "CaioAugustoCesar@gmail.com", "Augju@iesserpis.org"),
("00069069Z", "Pedro", "Munoz", "969755751", "2021-02-14", "pedro@msn.com", "pedromun@iesserpis.org"),
("00000047A", "Jose", "Luis", "244466666", "2021-11-04", "joseluisito@gmail.com", "joseluis@iesserpis.org"),
("38695677E", "Vegeta", "Martinez", "455344869", "2006-06-06", "vegema@gmail.com", "vege.mart@iesserpis.org"),
("00000102M", "Marcos", "Viñes", "679124354", "1996-11-05", "marvase@gmail.com", "martec@iesserpis.org"),
("78639001Y", "Grace", "Bakouka", "602791422", "1960-06-29", "dffd34@gmail.com", "grabak@alu.iesserpis.org"),
("53941391L", "Alfonso", "Benlloch", "692042664", "2000-06-29", "albeu00@gmail.com", "alfbue@alu.iesserpis.org"),
("32532810K", "Daniel", "Carabal", "64929091", "2001-11-12", "danifary@gmail.com", "dantud@alu.iesserpis.org"),
("42199242P", "Maria", "Garcia", "965426421", "2019-02-14", "mariagarcia@msn.com", "garmar@iesserpis.org"),
("00001941S", "Carlos", "Mares", "654814881", "1999-06-13", "teviniste@gmail.com", "carto m01@iesserpis.org"),
("00000033L", "Sergio","aragon","695643116","2001-12-12","martinezaragon22@gmail.com","serara@alu.iesserpis.org"),
("77187562K", "Angel", "Martinez","652554465","2001-07-19","angel.martinez@gmail.com","angel.martinez@alu.iesserpis.org"),
("00001934S", "Caius", "Iulius", "654887781", "2000-06-13", "CaiusIuliusCaesar@gmail.com", "caiiul@iesserpis.org"),
("34681647G", "Daniel", "Peris", "679287850", "2002-09-15", "dancor@gmail.com", "dan.cor@iesserpis.org"),
("26579092L", "Henry", "Rios", "634504552", "2001-05-25", "henrod@gmail.com", "henrod@alu.iesserpis.org"),
("24585984C", "Sandra", "Romero", "688548515", "2000-12-31", "sandraromero@gmail.com", "sanorosrt@iesserpis.org"),
("29095691V", "Pablo", "Ruiz", "626951267", "2001-06-24", "pabalb@gmail.com", "pabalb@iesserpis.org"),
("60412610T", "Teodoro", "Gracia", "657685788", "2001-05-17", "tedgra@alu.iesserpis.org", "tedgra@alu.iesserpis.org"),
("46738733X", "Mario", "Teruel", "680994563", "2001-01-01", "marioteruel@gmail.com", "mario.teruel@iesserpis.org"),
("24446666W", "Miguel", "Valero", "662223843", "2000-11-05", "migceb@alu.iesserpis.org", "migceb@alu.iesserpis.org"),
("00800102M", "Marcos", "Tecles", "648562145", "1996-11-05", "mart3c96@gmail.com", "martec@iesserpis.org");


INSERT INTO teacher(dni) VALUES
("10000000A"),
("10000001B"),
("10000002C"),
("10000003D"),
("10000004E");

INSERT INTO `group`(group_id, course_id, letter, tutor_dni) VALUES
(1, 1, "A", "10000000A"),
(2, 2, "B", "10000001B"),
(3, 3, "A", "10000002C"),
(4, 4, "D", "10000003D");

INSERT INTO student(dni, nia, group_id) VALUES 
("00000020A", "10000001", 1),
("00000014A", "10000002", 1),
("00069069Z", "10000003", 1),
("00000047A", "10000004", 1),
("38695677E", "10000005", 2),
("00000102M", "10000006", 2),
("78639001Y", "10000007", 2),
("53941391L", "10000008", 2),
("32532810K", "10000009", 2),
("00001941S", "10000010", 2),
("00000033L", "10000011", 2),
("77187562K", "10000012", 2),
("00001934S", "10000013", 2),
("34681647G", "10000014", 3),
("26579092L", "10000015", 3),
("24585984C", "10000016", 3),
("29095691V", "10000017", 3),
("60412610T", "10000018", 3),
("46738733X", "10000019", 3),
("24446666W", "10000020", 3),
("00800102M", "10000021", 3);

INSERT INTO year(year_id, year_start, year_end) VALUES
(1, 2021, 2022),
(2, 2020, 2019),
(3, 2019, 2018),
(4, 2018, 2017);


INSERT INTO teaches(teacher_dni, subject_id, year_id) VALUES
("10000000A", "0373", 1),
("10000001B", "0373", 1),
("10000000A", "0373", 2),
("10000001B", "0375", 2),
("10000002C", "0374", 1),
("10000003D", "0484", 1),
("10000004E", "0485", 1);

INSERT INTO enrolled(student_dni, subject_id, year_id, grade) VALUES
("00000020A", "0369", 1, 1.6),
("00000020A", "0377", 1, 3.1),
("38695677E", "0377", 1, 4.8),
("00000014A", "0377", 1, 9.8),
("00069069Z", "0377", 1, 4.7),
("00000102M", "0369", 1, 7),
("00000102M", "0370", 1, 9.5),
("00000102M", "0377", 1, 8),
("53941391L", "0369", 1, 6),
("53941391L", "0370", 1, 8.2),
("53941391L", "0377", 1, 5.1),
("32532810K", "0369", 1, 8),
("32532810K", "0370", 1, 6),
("32532810K", "0377", 1, 8.5),
("29095691V", "0369", 1, 9),
("29095691V", "0370", 1, 8),
("29095691V", "0377", 1, 7),
("00001941S", "0369", 1, 9.5),
("00001941S", "0370", 1, 8),
("00001941S", "0377", 1, 10),
("00000033L", "0369", 1, 5),
("00000033L", "0370", 1, 7),
("00000033L", "0377", 1, 9),
("00001934S", "0369", 1, 9.6),
("00001934S", "0370", 1, 1.4),
("00001934S", "0377", 1, 8.8),
("34681647G", "0369", 1, 8),
("34681647G", "0370", 1, 8.4),
("34681647G", "0377", 1, 7.75),
("26579092L", "0369", 1, 7.5),
("26579092L", "0370", 1, 8.5),
("26579092L", "0377", 1, 9.5),
("24585984C", "0369", 1, 10),
("24585984C", "0370", 1, 6),
("24585984C", "0377", 1, 6),
("24446666W", "0369", 1, 1),
("24446666W", "0370", 1, 3),
("24446666W", "0369", 2, 7),
("24446666W", "0370", 2, 5),
("24446666W", "0377", 1, 6),
("00800102M", "0369", 1, 7.6),
("00800102M", "0370", 1, 4.9),
("00800102M", "0377", 1, 6.5);
