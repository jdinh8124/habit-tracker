insert into "user" ("userName", "email", "userPwd")
values ('bob', 'bob@imail.com', 'bob123'),
       ('dob', 'dob@imail.com', 'dob456')
returning *;
