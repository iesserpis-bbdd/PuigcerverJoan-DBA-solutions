use highschool;

drop trigger if exists check_maximum_subjects_teached_update;

delimiter //
create trigger check_maximum_subjects_teached_update
before update on teaches
for each row 
begin
    declare current_weekly_hours decimal(4, 2);
    declare new_weekly_hours decimal(4, 2);
    declare old_weekly_hours decimal(4, 2);
    declare total_weekly_hours decimal(4, 2);
    declare error_message text;

    select coalesce(sum(s.hours), 0) / 33
    into current_weekly_hours
    from teaches t
    inner join subject s
        on t.subject_id = s.subject_id
    where t.teacherDNI = new.teacherDNI
        and t.year = new.year;

    select s.hours / 33
    into new_weekly_hours
    from subject s
    where s.subject_id = new.subject_id;

    select s.hours / 33
    into old_weekly_hours
    from subject s
    where s.subject_id = old.subject_id;

    set total_weekly_hours = (current_weekly_hours + new_weekly_hours);
    if new.teacherDNI = old.teacherDNI then
        set total_weekly_hours = total_weekly_hours - old_weekly_hours;
    end if;

    if total_weekly_hours > 18
    then
        set error_message = concat(
            "The teacher \"",
            new.teacherDNI,
            "\" can't teach the subject \"",
            new.subject_id,
            "\" since the total weekly hours would be \"",
            total_weekly_hours,
            "\""
        );

        signal sqlstate '45000' set message_text = error_message;
    end if;
end; //
delimiter ;
