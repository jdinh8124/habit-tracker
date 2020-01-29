import React from 'react';
import UserHabits from './userHabits';
import UserRoutine from './userRoutine';
import SignUpandSignIn from './signupandsignin';
import RoutineRequest from './routineRequest';
import { UserProvider } from './userContext';

import {
  Switch,
  Route,
  BrowserRouter as Router
} from 'react-router-dom';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loggedIn: true,
      newHabitToPush: null,
      sideBarOpen: false,
      userId: null,
      newUserHabit: {
        routineId: null,
        habitId: null
      }
    };

    this.openSideBar = this.openSideBar.bind(this);
    this.addingInputInfoToState = this.addingInputInfoToState.bind(this);
    this.addingNewUserHabit = this.addingNewUserHabit.bind(this);
    this.backButtonClear = this.backButtonClear.bind(this);
    this.setUserId = this.setUserId.bind(this);
  }

  setUserId(userId) {
    this.setState(previousState => ({ userId: userId }));
    this.setState(previousState => ({
      newUserHabit: {
        userId: userId,
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

  backButtonClear() {
    this.setState(previousState => ({
      newHabitToPush: {},
      newUserHabit: {
        userId: 2,
        routineId: null,
        habitId: null
      }
    })
    );
  }

  render() {
    return (
      <Router>
        <div className="h-100">
          <Switch>
            <UserProvider value={{ userId: this.state.userId }}>
              <Route exact path="/" render={props => <SignUpandSignIn {...props} setUserId={this.setUserId} />} />
              <Route exact path="/routineRequest" render={props => <RoutineRequest {...props} isOpen={this.state.sideBarOpen} openSideBar={this.openSideBar} />} />
              <Route exact path="/userHabits" render={props => <UserHabits {...props} newHabit={this.state.newHabitToPush} isOpen={this.state.sideBarOpen} openSideBar={this.openSideBar} addingInfo={this.addingInputInfoToState} />} />
              <Route exact path="/userRoutine" render={props => <UserRoutine {...props} isOpen={this.state.sideBarOpen} openSideBar={this.openSideBar} />} />
            </UserProvider>
          </Switch>
        </div>
      </Router>
    );
  }
}
