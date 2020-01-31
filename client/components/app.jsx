import React from 'react';
import UserHabits from './userHabits';
import UserRoutine from './userRoutine';
import SignUpandSignIn from './signupandsignin';
import RoutineRequest from './routineRequest';
import { UserProvider } from './userContext';

import {
  Switch,
  Redirect,
  Route,
  BrowserRouter as Router
} from 'react-router-dom';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loggedIn: false,
      newHabitToPush: null,
      sideBarOpen: false,
      userId: parseInt(sessionStorage.getItem('id')),
      newUserHabit: {
        routineId: null,
        habitId: null
      }
    };

    this.openSideBar = this.openSideBar.bind(this);
    this.addingInputInfoToState = this.addingInputInfoToState.bind(this);
    this.addingNewUserHabit = this.addingNewUserHabit.bind(this);
    this.setUserId = this.setUserId.bind(this);
    this.signOut = this.signOut.bind(this);
  }

  isUserSignedIn() {
    if (this.state.loggedIn) {
      return <Redirect to="/userHabits"/>;
    } else {
      return <Redirect to="/" />;
    }
  }

  signOut() {
    this.setState(previousState => ({
      loggedIn: false
    }));
    sessionStorage.setItem('id', null);
  }

  setUserId() {
    this.setState(previousState => ({
      userId: parseInt(sessionStorage.getItem('id')),
      loggedIn: true,
      newUserHabit: {
        userId: parseInt(sessionStorage.getItem('id')),
        routineId: null,
        habitId: null
      }
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
        this.setState(previousState => ({
          newHabitToPush: myJson,
          newUserHabit: {
            userId: this.state.userId,
            routineId: null,
            habitId: null
          }
        })
        );
      })
      .catch(error => {
        console.error(error);
      });
  }

  render() {
    return (
      <Router>

        <Switch>
          <UserProvider value={{ userId: this.state.userId }}>
            {this.isUserSignedIn()}
            <Route exact path="/" render={props => <SignUpandSignIn {...props} setUserId={this.setUserId} />} />
            <Route exact path="/routineRequest" render={props => <RoutineRequest {...props} signOut={this.signOut} isOpen={this.state.sideBarOpen} openSideBar={this.openSideBar} />} />
            <Route exact path="/userHabits" render={props => <UserHabits {...props} signOut={this.signOut} newHabit={this.state.newHabitToPush} isOpen={this.state.sideBarOpen} openSideBar={this.openSideBar} addingInfo={this.addingInputInfoToState} />} />
            <Route exact path="/userRoutine" render={props => <UserRoutine {...props} signOut={this.signOut} isOpen={this.state.sideBarOpen} openSideBar={this.openSideBar} />} />
          </UserProvider>
        </Switch>
      </Router>
    );
  }
}
