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
  const userId = parseInt(req.body.userId);

  const sqlUser = `
                  select *
                  from "user"
                  where "userId" = $1
                  `;
  const params = [userId];
  const sqlHabits = `
                select *
                from "userHabit"
                left join "habit" ON "userHabit"."habitId" = "habit"."habitId"
                where "userId" = $1
                `;

  db.query(sqlUser, params)
    .then(result => {
      if (result.rows.length === 0) {
        throw new ClientError(`user with id ${userId} could not be found`, 404);
      } else {
        db.query(sqlHabits, params)
          .then(userHabits => {
            res.status(200);
            res.json(userHabits.rows);
          });
      }
    })
    .catch(err => next(err));

});

// See routines
app.get('/api/routine', (req, res, next) => {
  res.sendStatus(501);
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
