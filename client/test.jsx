import React from 'react';
import UserRoutine from './components/userRoutine';
import Footer from './components/footer';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <div>
        <UserRoutine />
        <Footer />
      </div>
    );
  }
}
