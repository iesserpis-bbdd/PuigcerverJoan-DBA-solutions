use highschool;
drop procedure if exists split_group;

delimiter //
create procedure split_group (
    in course_acronym varchar(4),
    in letter char
)
not deterministic
begin
    declare course_id type of course.course_id;
    declare new_letter type of `group`.letter;
    declare new_tutor type of `group`.tutorDNI;
    declare student_index int;
    declare first_student_DNI type of student.DNI;

    select c.course_id into course_id
    from course c
    where c.acronym = course_acronym;

    -- NEW LETTER
    select char(ascii(max(g.letter)) + 1)
    into new_letter
    from `group` g
    where g.course_id = course_id;

    -- NEW TUTOR
    select t.DNI
    into new_tutor
    from teacher t
    left join `group` g
        on g.tutorDNI = t.DNI
    inner join teaches te
        on te.teacherDNI = t.DNI
    inner join subject s
        on te.subject_id = s.subject_id
    inner join course c
        on s.course_id = c.course_id
    where g.letter is null 
        and c.course_id = 1 
        and 18 > (
            select sum(s.hours) / 33
            from teaches te
            inner join subject s
                on te.subject_id = s.subject_id
            where te.teacherDNI = t.DNI
        )
    group by t.DNI
    order by sum(s.hours) desc
    limit 1;

    -- IF NO TUTOR WITH THE REQUERIMENTS
    if new_tutor is null
    then
        select min(t.DNI)
        into new_tutor
        from teacher t
        left join `group` g
            on g.tutorDNI = t.DNI
        where g.course_id is null;
    end if;

    -- CREATE NEW GROUP
    insert into `group`(course_id, letter, tutorDNI)
    values (course_id, new_letter, new_tutor);

    -- GET LAST STUDENT INDEX
    select floor(count(*)/2) into student_index
    from student s 
    where s.course_id = course_id and s.group_letter = letter
    order by s.DNI;

    -- GET NEW GROUP FIRST STUDENT DNI
    select s.DNI into first_student_DNI
    from student s 
    where s.course_id = course_id and s.group_letter = letter
    order by s.DNI
    limit 1
    offset student_index;

    -- MOVE STUDENTS
    update student s
    set s.group_letter = new_letter
    where s.course_id = course_id and s.group_letter = letter
        and s.DNI >= first_student_DNI;

end; //
delimiter ;
