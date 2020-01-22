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
app.get('/api/habit', (req, res, next) => {
  res.sendStatus(501);
});

// See routines
app.get('/api/routine', (req, res, next) => {
  const integerTest = /^[1-9]\d*$/;
  if (!integerTest.exec(req.body.userId)) {
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
  const value = [parseInt(req.body.userId)];
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
app.get('/api/routine/:id/habit', (req, res, next) => {
  res.sendStatus(501);
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

// delete habit
app.delete('/api/routine/:id/habit/:id', (req, res, next) => {
  res.sendStatus(501);
});

app.delete('/api/habit/:id', (req, res, next) => {
  res.sendStatus(501);
});

// add habit
app.post('/api/routine/:id/habit', (req, res, next) => {
  res.sendStatus(501);
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
