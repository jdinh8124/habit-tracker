insert into "routine" ("routineName", "routineDescription", "createdBy")
values ('Going Out', 'Bob wants to go outside', 1),
       ('Stay Healthy', 'Dob wants to be healthy', 2),
       ('Be Productive', 'Bob needs to work more', 1),
       ('Have Fun', 'Dob is boring', 2)
returning *;
