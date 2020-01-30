insert into "userRoutine" ("receiverId", "senderId", "routineId", "routineName", "accepted?", "requestMessage")
values (2, 1, 1, 'Going out', TRUE, 'Dob please accept this routine'),
       (2, 2, 4, 'Have Fun', TRUE, 'Fun routine for me'),
       (2, 1, 3, 'Work!', FALSE, 'Dob be more productive'),
       (2, 2, 2, 'Be Healthy', NULL, 'Be more healthy'),
       (1, 2, 4, 'Have Some Fun', FALSE, 'You should try this'),
       (1, 2, 2, 'Be More Healthy', TRUE, 'Stay healthy')
returning *;
