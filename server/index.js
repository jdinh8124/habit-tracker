require('dotenv/config');
const express = require('express');

const db = require('./database');
const ClientError = require('./client-error');
const staticMiddleware = require('./static-middleware');
const sessionMiddleware = require('./session-middleware');
const bcrypt = require('bcrypt');

const app = express();

app.use(staticMiddleware);
app.use(sessionMiddleware);

app.use(express.json());

app.get('/api/health-check', (req, res, next) => {
  db.query('select \'successfully connected\' as "message"')
    .then(result => res.json(result.rows[0]))
    .catch(err => next(err));
});

// See upcoming habits
app.get('/api/habit/:userId', (req, res, next) => {
  const userId = parseInt(req.params.userId);
  const sql = `
                select *
                from "userHabit"
                left join "habit" ON "userHabit"."habitId" = "habit"."habitId"
                where "userId" = $1
                `;
  const params = [userId];
  db.query(sql, params)
    .then(result => {
      if (result.rows.length === 0) {
        throw new ClientError(`user with id ${userId} could not be found`, 404);
      } else {
        res.status(200);
        res.json(result.rows);
      }
    })
    .catch(err => next(err));

});

// See routines
app.get('/api/routine/user/:user', (req, res, next) => {
  const integerTest = /^[1-9]\d*$/;
  if (!integerTest.exec(req.params.user)) {
    next(new ClientError('userId is not an integer', 404));
  }
  const userSql = `
    select "userName"
    from "user"
    where "userId" = $1;
  `;
  const userRoutineSql = `
    select *
      from "userRoutine"
      where "receiverId" = $1 and "accepted?" = TRUE;
  `;
  const value = [parseInt(req.params.user)];
  db.query(userSql, value)
    .then(result => {
      if (!result.rows.length) next(new ClientError(`userId ${req.body.userId} does not exist`, 404));
      else {
        db.query(userRoutineSql, value)
          .then(result => res.status(200).json(result.rows))
          .catch(err => next(err));
      }
    })
    .catch(err => next(err));
});

// View habits from routines
app.get('/api/routine/:id/user/:user', (req, res, next) => {
  const integerTest = /^[1-9]\d*$/;
  if (!integerTest.exec(req.params.user) || !integerTest.exec(req.params.id)) {
    next(new ClientError('userId or routineId is not an integer', 404));
  }
  const userSql = `
    select "userName"
    from "user"
    where "userId" = $1;
  `;
  const userRoutineSql = `
    select *
    from "userHabit"
    left join "habit" ON "userHabit"."habitId" = "habit"."habitId"
    where "userId" = $1 and "routineId" = $2;
  `;
  const userValue = [parseInt(req.params.user)];
  const routineValue = [parseInt(req.params.user), parseInt(req.params.id)];
  db.query(userSql, userValue)
    .then(result => {
      if (!result.rows.length) next(new ClientError(`userId ${req.body.userId} does not exist`, 404));
      else {
        db.query(userRoutineSql, routineValue)
          .then(result => res.status(200).json(result.rows))
          .catch(err => next(err));
      }
    })
    .catch(err => next(err));
});

// Create routine
app.post('/api/routine', (req, res, next) => {
  if (!req.body.user) next(new ClientError('Please enter a userId', 400));
  else if (!req.body.routineName) next(new ClientError('Please enter a routine name', 400));
  else if (!req.body.routineDesc) next(new ClientError('Please enter a routine description', 400));
  const integerTest = /^[1-9]\d*$/;
  if (!integerTest.exec(req.body.user)) {
    next(new ClientError(`userId ${req.body.user} is not an integer`, 404));
  }
  let routineId = null;
  const userSql = `
    select "userName"
      from "user"
     where "userId" = $1;
  `;
  const duplicateRoutineSql = `
    select *
      from "routine"
     where "routineName" = $1 and "createdBy" = $2;
  `;
  const postRoutineSql = `
    insert into "routine" ("routineName", "routineDescription", "createdBy")
    values ($2, $3, $1)
    returning *;
  `;
  const selectRoutineSql = `
    select "routineId"
      from "routine"
     where "routineName" = $1 and "createdBy" = $2;
  `;
  const selfRoutineSql = `
    insert into "userRoutine" ("receiverId", "senderId", "routineId", "routineName", "accepted?", "requestMessage")
    values ($1, $2, $3, $4, $5, $6)
    returning *;
  `;
  const userValue = [parseInt(req.body.user)];
  const routineNameValue = [req.body.routineName, parseInt(req.body.user)];
  const routineValue = [parseInt(req.body.user), req.body.routineName, req.body.routineDesc];
  const selfValue = [parseInt(req.body.user), parseInt(req.body.user), routineId, req.body.routineName, true, 'Self-created routine'];
  db.query(userSql, userValue)
    .then(userResult => {
      if (!userResult.rows.length) next(new ClientError(`userId ${req.body.userId} does not exist`, 404));
      else {
        db.query(duplicateRoutineSql, routineNameValue)
          .then(routineResult => {
            if (routineResult.rows.length) next(new ClientError(`routine name ${req.body.routineName} already existed`, 400));
            else {
              db.query(postRoutineSql, routineValue)
                .then(result => result.rows)
                .catch(err => next(err));
            }
          })
          .catch(err => next(err));
      }
    })
    .then(result => {
      db.query(selectRoutineSql, routineNameValue)
        .then(routineIdResult => {
          routineId = parseInt(routineIdResult.rows[0].routineId);
        })
        .then(result => {
          selfValue[2] = routineId;
          db.query(selfRoutineSql, selfValue)
            .then(result => res.status(200).json(result.rows))
            .catch(err => next(err));
        })
        .catch(err => next(err));
    })
    .catch(err => next(err));
});

// Edit routine
app.put('/api/routine/:id', (req, res, next) => {
  if (!req.body.routineName) next(new ClientError('Please enter a new routine name', 400));
  const integerTest = /^[1-9]\d*$/;
  if (!integerTest.exec(req.params.id)) {
    next(new ClientError(`routineId ${req.params.id} is not an integer`, 404));
  }
  const routineCheckSql = `
    select *
      from "userRoutine"
     where "routineId" = $1;
  `;
  const routineNameCheckSql = `
    select *
      from "userRoutine"
     where "routineName" = $1 and "receiverId" = $2;
  `;
  const sql = `
    update "userRoutine"
       set "routineName" = $1
     where "routineId" = $2;
  `;
  const routineCheckValue = [parseInt(req.params.id)];
  const routineNameCheckValue = [req.body.routineName, parseInt(req.body.user)];
  const value = [req.body.routineName, parseInt(req.params.id)];
  db.query(routineCheckSql, routineCheckValue)
    .then(result => {
      if (!result.rows.length) next(new ClientError(`routineId ${req.params.id} does not exist`, 404));
      else {
        db.query(routineNameCheckSql, routineNameCheckValue)
          .then(routineResult => {
            if (routineResult.rows.length) next(new ClientError(`routine name ${req.body.routineName} already exists`, 400));
            else {
              db.query(sql, value)
                .then(result => {
                  res.status(204).json();
                })
                .catch(err => next(err));
            }
          })
          .catch(err => next(err));
      }
    })
    .catch(err => next(err));
});

// Delete routine
app.delete('/api/routine/:id', (req, res, next) => {
  const integerTest = /^[1-9]\d*$/;
  if (!integerTest.exec(req.params.id)) {
    next(new ClientError(`routineId ${req.params.id} is not an integer`, 404));
  }
  const routineCheckSql = `
    select *
      from "userRoutine"
     where "routineId" = $1;
  `;
  const sql = `
    delete
      from "userRoutine"
     where "routineId" = $1;
  `;
  const value = [parseInt(req.params.id)];
  db.query(routineCheckSql, value)
    .then(result => {
      if (!result.rows.length) next(new ClientError(`routineId ${req.params.id} does not exist`, 404));
      else {
        db.query(sql, value)
          .then(result => {
            res.status(204).json();
          })
          .catch(err => next(err));
      }
    })
    .catch(err => next(err));
});

// Send routine to user
app.post('/api/share', (req, res, next) => {
  res.sendStatus(501);
});

// accept or deny routine
app.put('/api/request/:id', (req, res, next) => {
  res.sendStatus(501);
});

// edit habit
app.put('/api/routine/:id/habit/:id', (req, res, next) => {
  res.sendStatus(501);
});

app.post('/api/routine/:id/habit/:id', (req, res, next) => {
  res.sendStatus(501);
});

// mark habit completion
app.post('/api/user/habit', (req, res, next) => {
  const habitId = parseInt(req.body.habitId);
  const userId = parseInt(req.body.userId);
  if (!habitId || !userId) {
    throw ClientError('HabitId and userId are required');
  }
  const updateSQL = `update "userHabit"
                    set "lastCompleted" = CURRENT_TIME,
                        "timesCompleted" = "timesCompleted" + 1,
                        "nextCompletion" = CURRENT_DATE + interval '1 day'
                    where "userId" = $1 and "habitId" = $2
                    returning *
                    `;
  const params = [habitId, userId];
  db.query(updateSQL, params)
    .then(result => {
      if (!result.rowCount) {
        throw new ClientError(`cannot find item with habitId: ${habitId} under userId: ${userId}`);
      }
      res.status(200).json(result.rows);
    });
});

// delete routine habit
app.delete('/api/routine/:id/habit/:id', (req, res, next) => {
  res.sendStatus(501);
});

// delete user habit
app.delete('/api/habit/', (req, res, next) => {
  const habitId = parseInt(req.body.habitId);
  if (isNaN(habitId) || !habitId) {
    throw new ClientError('Habit Id must be a positive integer', 400);
  }

  const deleteSQL = `
                    delete from "userHabit"
                    where "habitId" = $1
                    `;
  const params = [habitId];
  db.query(deleteSQL, params)
    .then(result => {
      if (!result.rowCount) {
        throw new ClientError(`cannot find item with habitId: ${habitId}`);
      } else {
        res.status(204).json({});
      }
    }).catch(err => next(err));
});

// adding habit to userHabit
app.post('/api/habit', (req, res, next) => {
  const integerTest = /^[1-9]\d*$/;
  if (!integerTest.exec(req.body.userId) || !integerTest.exec(req.body.routineId) || !integerTest.exec(req.body.habitId)) {
    next(new ClientError('habit, userID, or HabitID is not an integer', 404));
  }

  const sql = `
    insert into "userHabit"("userId", "routineId", "habitId", "timesCompleted", "lastCompleted", "frequency", "nextCompletion", "duration", "congratsMessage", "motivationalMessage")
    values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
    returning *;
  `;

  const userValues = [req.body.userId, req.body.routineId, req.body.habitId, 0, '04:05:06.789', req.body.frequency, '2019-02-08', req.body.duration, req.body.congratsMessage, req.body.motivationalMessage];
  // console.log('before query', sql, userValues);
  db.query(sql, userValues)
    .then(result => res.status(201).json(result.rows[0]))
    .catch(err => next(err));
});

// add habit to routine
app.post('/api/routine/:id/habit', (req, res, next) => {

});

app.post('/api/signup', (req, res, next) => {

  bcrypt.hash(req.body.userPwd, 10, function (err, hash) {
    const sql = `
    insert into "user"("userName", "email", "userPwd", "createdAt")
    values ($1, $2, $3, current_timestamp)
    `;
    next(err);
    const userValues = [req.body.userName, req.body.email, hash];
    db.query(sql, userValues)
      .then(result => res.status(201).json(result.rows[0]))
      .catch(err => {
        if (err.code === '23505') {
          res.status(400).json('Username exists');
        } next(err)
        ;
      }
      );
  });

});

app.post('/api/login', (req, res, next) => {
  const sql = `
    select "userPwd"
    from "user"
    where "userName" = $1;
    `;

  const userValues = [req.body.userName];
  db.query(sql, userValues)
    .then(result =>
      bcrypt.compare(req.body.userPwd, result.rows[0].userPwd, function (err, result) {
        next(err);
        if (result) {
          res.status(204).json();
        } else {
          res.status(401).json();
        }
      })
    )
    .catch(err =>
      next(err));

});

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log('Listening on port', process.env.PORT);
});

app.use('/api', (req, res, next) => {
  next(new ClientError(`cannot ${req.method} ${req.originalUrl}`, 404));
});

app.use((err, req, res, next) => {
  if (err instanceof ClientError) {
    res.status(err.status).json({ error: err.message });
  } else {
    console.error(err);
    res.status(500).json({
      error: 'an unexpected error occurred'
    });
  }
});
