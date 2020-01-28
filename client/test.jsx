import React from 'react';
import Routine from './components/routine';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <Routine />
    );
  }
}
