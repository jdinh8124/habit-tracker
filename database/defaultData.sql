insert into "user" ("userName", "email", "userPwd")
values ('bob', 'bob@bob.com', 'noHashPwd');

insert into "routine" ("routineName", "createdBy")
values ('Web Dev', 1);

insert into "habit" ("habitName", "createdBy")
values ('Code often', 1),
       ('Networking', 1),
       ('Practice whiteboard', 1),
       ('Keep GitHub green', 1),
       ('Learn from other people', 1);

insert into "routineHabit" ("routineId", "habitId")
values (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (1, 5);
