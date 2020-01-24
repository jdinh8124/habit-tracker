require('dotenv/config');
const express = require('express');

const db = require('./database');
const ClientError = require('./client-error');
const staticMiddleware = require('./static-middleware');
const sessionMiddleware = require('./session-middleware');

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
  res.sendStatus(501);
});

// Edit routine
app.put('/api/routine/:id', (req, res, next) => {
  res.sendStatus(501);
});

// Delete routine
app.delete('/api/routine/:id', (req, res, next) => {
  res.sendStatus(501);
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

app.put('/api/habit/:id', (req, res, next) => {
  res.sendStatus(501);
});

// mark habit completion
app.post('/api/routine/:id/habit/:id', (req, res, next) => {
  res.sendStatus(501);
});

app.post('/api/habit/:id', (req, res, next) => {
  res.sendStatus(501);
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
    values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);
  `;
  const userValues = [req.body.userId, req.body.routineId, req.body.habitId, 0, 2020 - 12 - 31, req.body.frequency, req.body.nextCompletion, req.body.duration, req.body.congratsMessage, req.body.motivationalMessage];

  // console.log('before query', sql, userValues);
  db.query(sql, userValues)
    .then(result => res.status(201).json(result.rows[0]))
    .catch(err => next(err));
});

// add habit to routine
app.post('/api/routine/:id/habit', (req, res, next) => {

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
