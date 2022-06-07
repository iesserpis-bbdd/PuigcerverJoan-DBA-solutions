use highschool;

drop trigger if exists check_enrolled_course;

delimiter //
create trigger check_enrolled_course
before insert on enrolled
for each row
begin
    declare subject_acronym type of subject.acronym;
    declare fol_grade type of enrolled.grade;
    declare error_message text;

    select s.acronym
    into subject_acronym
    from subject s
    where s.subject_id = new.subject_id;

    -- check if new subject is FCT
    if subject_acronym = "FCT"
    then
        select max(e.grade)
        into fol_grade
        from enrolled e
        inner join subject s
            on e.subject_id = s.subject_id
        where e.studentDNI = new.studentDNI
          and s.acronym = "FOL";

        if coalesce(fol_grade, 0) < 5
        then
            set error_message = concat(
                "The student \"",
                new.studentDNI,
                "\" can't enroll in the FCT subject \"",
                new.subject_id,
                "\" because he hasn't passed the FOL subject."
            );

            signal sqlstate '45000' set message_text = error_message;
        end if;
    end if;
end
