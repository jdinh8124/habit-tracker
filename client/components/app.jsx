import React from 'react';
import UserHabits from './userHabits';
import UserRoutine from './userRoutine';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <div>
        <UserHabits />
        <UserRoutine />
      </div>
    );
  }
}
