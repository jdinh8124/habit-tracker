import React from 'react';
import UserRoutineHabit from './components/userRoutineHabit';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <div>
        <UserRoutineHabit />
      </div>
    );
  }
}
