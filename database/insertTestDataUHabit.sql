insert into "userHabit" ("userId", "routineId", "habitId", "timesCompleted", "lastCompleted", "frequency", "nextCompletion", "duration", "congratsMessage", "motivationalMessage")
values (2, 1, 1, 3, CURRENT_TIMESTAMP, 1, CURRENT_DATE, '30 min', 'You went outside!', 'Get out...'),
       (2, 2, 2, 5, CURRENT_TIMESTAMP, 2, CURRENT_DATE, '1 hour', 'Stay hydrated!', 'Get some water...'),
       (2, 1, 4, 12, CURRENT_TIMESTAMP, 1, CURRENT_DATE, '2 hours', 'Stay sharp!', 'Just commit...'),
       (1, 2, 3, 7, CURRENT_TIMESTAMP, 2, CURRENT_DATE, '1 hour', 'Get gains!', 'Hit the gym...')
returning *;
