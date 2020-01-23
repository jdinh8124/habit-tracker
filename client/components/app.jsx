import React from 'react';
import UserHabits from './userHabits';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      userHabits: []
    };
  }

  render() {
    return (
      <div className='h-100'>
        <UserHabits />
      </div>
    );
  }
}
