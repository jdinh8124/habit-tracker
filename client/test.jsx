import React from 'react';
import UserRoutine from './components/userRoutine';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <div>
        <UserRoutine />
      </div>
    );
  }
}
