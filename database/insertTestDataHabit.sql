insert into "habit" ("habitName", "habitDescription", "createdBy")
values ('Take a Walk', 'Taking a walk outside', 1),
       ('Drink water', 'So you can stay alive', 2),
       ('Work Out', 'Make yourself tired', 1),
       ('Code Everyday', 'Stay sharp', 2)
returning *;
