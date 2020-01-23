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

  const [routine, setRoutine] = React.useState(null);
  const userId = 2;

  React.useEffect(
    () => {
      fetch(`/api/routine/user/${userId}`)
        .then(res => res.json())
        .then(res => setRoutine(res));
    }, []
  );

  return (
    <div className="bg-light h-100">
    <Header title={'User Routines'} headerView={'main'} openSideBar={props.openSideBar} />
      {isSideBarOpen()}
      <RoutineList routine={routine} />

    </div>
  );
};

export default UserRoutine;
