import React from 'react';
import UserHabits from './userHabits';
import UserRoutine from './userRoutine';
import Frequency from './frequency';
import Duration from './duration';
import Congrats from './congrats';
import Motivation from './motivation';
import SignUpandSignIn from './signupandsignin';

import {
  Switch,
  Route,
  BrowserRouter as Router
} from 'react-router-dom';
import ScheduledHabit from './scheduledHabit';
import Message from './message';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loggedIn: true,
      newHabitToPush: null,
      sideBarOpen: false,
      newUserHabit: {
        userId: 2,
        routineId: 2,
        habitId: 3
      }
    };

    this.openSideBar = this.openSideBar.bind(this);
    this.addingInputInfoToState = this.addingInputInfoToState.bind(this);
    this.addingNewUserHabit = this.addingNewUserHabit.bind(this);
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

  addingInputInfoToState(property, inputInfo) {
    const newObject = { ...this.state.newUserHabit };
    newObject[property] = inputInfo;
    this.setState(previousState => ({ newUserHabit: newObject }));
    if (property === 'motivationalMessage') {
      this.addingNewUserHabit(newObject);
    }
  }

  addingNewUserHabit(newObject) {
    fetch('/api/habit', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(newObject)
    })
      .then(response => {
        return response.json();
      })
      .then(myJson => {
        this.setState(previousState => ({ newHabitToPush: myJson, newUserHabit: {} })
        );
      })
      .catch(error => {
        console.error(error);
      });
  }

  render() {
    return (
      <Router>
        <div className="h-100">
          <Switch>
            <Route exact path="/" render={props => <SignUpandSignIn {...props} newHabit={this.state.newHabitToPush} isOpen={this.state.sideBarOpen} openSideBar={this.openSideBar} />} />
            <Route exact path="/userHabits" render={props => <UserHabits {...props} newHabit={this.state.newHabitToPush} isOpen={this.state.sideBarOpen} openSideBar={this.openSideBar} />} />
            <Route exact path="/userRoutine" render={props => <UserRoutine {...props} isOpen={this.state.sideBarOpen} openSideBar={this.openSideBar} />}/>
            <Route exact path="/scheduledHabits" render={props => <ScheduledHabit {...props}/>} />
            <Route exact path="/message" render={props => <Message {...props} />} />
            <Route exact path="/frequency" render={props => <Frequency {...props} addingInfo={this.addingInputInfoToState} />} />
            <Route exact path="/duration" render={props => <Duration {...props} addingInfo={this.addingInputInfoToState} />}/>
            <Route exact path="/congrats" render={props => <Congrats {...props} addingInfo={this.addingInputInfoToState} />} />
            <Route exact path="/motivation" render={props => <Motivation {...props} addingInfo={this.addingInputInfoToState} />} />
          </Switch>
        </div>
      </Router>
    );
  }
}
