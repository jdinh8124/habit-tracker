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

// See upcoming habits
app.get('/api/habit', (req, res, next) => {});

// See routines
app.get('/api/routine', (req, res, next) => {});

// View habits from routines
app.get('/api/routine/:id/habit', (req, res, next) => {});

// Create routine
app.post('/api/routine', (req, res, next) => {});

// Edit routine
app.put('/api/routine/:id', (req, res, next) => { });

// Delete routine
app.delete('/api/routine/:id', (req, res, next) => { });

// Send routine to user
app.post('/api/share', (req, res, next) => { });

// accept or deny routine
app.put('/api/request/:id', (req, res, next) => { });

// edit habit
app.put('/api/routine/:id/habit/:id', (req, res, next) => { });

app.put('/api/habit/:id', (req, res, next) => { });

// mark habit completion
app.post('/api/routine/:id/habit/:id', (req, res, next) => { });

app.post('/api/habit/:id', (req, res, next) => { });

// delete habit
app.delete('/api/routine/:id/habit/:id', (req, res, next) => { });

app.delete('/api/habit/:id', (req, res, next) => { });

// add habit
app.post('/api/routine/:id/habit', (req, res, next) => { });

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log('Listening on port', process.env.PORT);
});
