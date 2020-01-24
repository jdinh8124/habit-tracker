import React from 'react';
import UserHabits from './userHabits';
import UserRoutine from './userRoutine';
import Header from './header';
import {
  Switch,
  Route
  // Link
} from 'react-router-dom';
import ScheduledHabit from './scheduledHabit';
import Message from './message';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      sideBarOpen: false,
      hiderHide: false
    };
    this.openSideBar = this.openSideBar.bind(this);
  }

  setTitle(object) {
    this.setState(previousState => ({
      view: object.view,
      title: object.title
    }));
  }

  openSideBar() {
    if (this.state.sideBarOpen) {
      this.setState(previousState => ({
        sideBarOpen: false
      }));
    } else {
      this.setState(previousState => ({
        sideBarOpen: true
      }));
    }
  }

  render() {
    return (
      <>
        <Header />
        <Switch>
          <Route exact path="/" render={props => <UserHabits {...props} openSideBar={this.openSideBar} isOpen={this.state.sideBarOpen} />} />
          <Route exact path="/userRoutine" render={props => <UserRoutine {...props} isOpen={this.state.sideBarOpen} openSideBar={this.openSideBar} />} />
          <Route exact path="/scheduledHabits" render={props => <ScheduledHabit {...props}/>} />
          <Route exact path="/message" render={props => <Message {...props} />} />
        </Switch>
      </>
    );
  }
}
