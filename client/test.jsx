import React from 'react';
// import UserRoutineHabit from './components/userRoutineHabit';
import UserHabits from './components/userHabits';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <div>
        <UserHabits />
      </div>
    );
  }
}
