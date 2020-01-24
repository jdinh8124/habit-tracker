import React from 'react';
// import UserHabits from './components/userHabits';
import ScheduledHabit from './components/scheduledHabit';


export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <ScheduledHabit />


    );
  }
}
