-- mysql -uroot -p1234 -ip <IP> -e "select * from highschool.subject" -B | tr "\t" "," > subjects.csv

-- Des de la carpeta on està subjects.csv
-- mysql -uroot -p1234 -ip <IP>

load data local infile "subjects.csv"
replace into subject
columns terminated by ","
lines terminated by "\n"
ignore 1 lines;
