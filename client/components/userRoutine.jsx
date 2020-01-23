/*
* Accessed through sidebar only
* Send routine to user leads to the routine request page
*/

import React from 'react';
import Header from './header';
import Sidebar from './sidebar';
import RoutineList from './routineList';

const UserRoutine = props => {

  function isSideBarOpen() {
    if (props.isOpen) {
      return <Sidebar sideRender={props.sideRender} />;
    }
  }

  return (
    <div>
      <Header title={'User Routines'} headerView={'main'} openSideBar={props.openSideBar} />
      {isSideBarOpen()}
      <RoutineList />
    </div>
  );
};

export default UserRoutine;
