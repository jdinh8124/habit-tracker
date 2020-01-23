import React from 'react';
import UserHabits from './userHabits';
import UserRoutine from './userRoutine';
import Header from './header';
import Sidebar from './sidebar';
import {
  BrowserRouter as Router,
  Switch,
  Route
  // Link
} from 'react-router-dom';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: 'main',
      title: 'MyHabits',
      sideBarOpen: true,
      currentView: ''
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

  isSideBarOpen() {
    if (this.state.sideBarOpen) {
      return <Sidebar sideRender={this.state.currentView} />;
    }
  }

  render() {
    return (
      <Router>
        <div>
          <Header title={this.state.title} headerView={this.state.view} openSideBar={this.openSideBar} />
          {this.isSideBarOpen()}
          <Switch>
            <Route exact path="/">
              <UserHabits />
            </Route>
            <Route exact path="/userRoutine">
              <UserRoutine />
            </Route>
          </Switch>
        </div>
      </Router>
    );
  }
}
