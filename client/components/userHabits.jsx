/*
* Main page after user logged in
*/

import React from 'react';
import Header from './header';
import Sidebar from './sidebar';
import HabitList from './habitList';

const UserHabits = props => {

  function isSideBarOpen() {
    if (props.isOpen) {
      return <Sidebar sideRender={props.sideRender} />;
    }
  }
  return (
    <div>
      <Header title={'User Habits'} headerView={'main'} openSideBar={props.openSideBar}/>
      {isSideBarOpen()}
      <HabitList />
    </div>
  );
};

export default UserHabits;
