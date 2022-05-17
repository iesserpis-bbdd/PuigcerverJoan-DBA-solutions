use highschool;

drop trigger if exists check_enrolled_course;

delimiter //
create trigger check_enrolled_course
before insert on enrolled
for each row 
begin
    declare student_course type of course.course_id;
    declare subject_course type of course.course_id;
    declare error_message text;

    select s.course_id
    into student_course
    from student s
    where s.DNI = new.studentDNI;

    select s.course_id
    into subject_course
    from subject s
    where s.subject_id = new.subject_id;

    if student_course != subject_course
    then
        set error_message = concat(
            "The subject \"",
            new.subject_id ,
            "\" doesn't belong to the same course as the student \"",
            new.studentDNI,
            "\""
        );

        signal sqlstate '45000' set message_text = error_message;
    end if;
end
