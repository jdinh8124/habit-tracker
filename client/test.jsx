import React from 'react';
// import UserRoutineHabit from './components/userRoutineHabit';
// import UserHabits from './components/userHabits';
// import Congrats from './components/congrats';

import {
  BrowserRouter as Router
  // Switch,
  // Route
  // Link
} from 'react-router-dom';
import Frequnecy from './components/frequency';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <div>
        <Router>
          <Frequnecy/>
        </Router>
      </div>
    );
  }
}
