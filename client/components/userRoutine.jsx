/*
* Accessed through sidebar only
* Send routine to user leads to the routine request page
*/

import React from 'react';
import Header from './header';
import Sidebar from './sidebar';
import RoutineList from './routineList';
import Footer from './footer';
import BlankCard from './blankCard';

const UserRoutine = props => {
  const [routine, setRoutine] = React.useState(null);
  const [blank, setBlank] = React.useState(false);
  const userId = 2;

  function isSideBarOpen() {
    if (props.isOpen) {
      return <Sidebar sideRender={props.sideRender} />;
    }
  }

  React.useEffect(
    () => {
      fetch(`/api/routine/user/${userId}`)
        .then(res => res.json())
        .then(res => setRoutine(res));
    }, []
  );

  const createBlank = () => {
    return blank && <BlankCard setBlank={setBlank} />;
  };

  return (
    <div className="bg-light h-100">
      <Header title={'User Routines'} headerView={'main'} openSideBar={props.openSideBar} />
      {isSideBarOpen()}
      <RoutineList routine={routine} />
      {createBlank()}
      <Footer setBlank={setBlank} />
    </div>
  );
};

export default UserRoutine;
