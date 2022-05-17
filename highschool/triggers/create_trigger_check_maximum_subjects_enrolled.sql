use highschool;

drop trigger if exists check_maximum_subjects_enrolled;

delimiter //
create trigger check_maximum_subjects_enrolled 
before insert on enrolled
for each row 
begin
    declare count_subjects int;
    declare error_message text;

    select count(e.subject_id)
    into count_subjects
    from enrolled e
    where e.studentDNI = new.studentDNI 
        and e.year = new.year;

    if count_subjects >= 6
    then
        set error_message = concat(
            "The student \"",
            new.studentDNI,
            "\" can't be enrolled in more than 6 subjects in the year \"",
            new.year,
            "\""
        );

        signal sqlstate '45000' set message_text = error_message;
    end if;
end
