/*
* Accessed through sidebar only
* Send routine to user leads to the routine request page
*/

import React from 'react';
import Header from './header';
import Sidebar from './sidebar';
import RoutineList from './routineList';

const UserRoutine = () => {
  return (
    <div>
      <Header />
      <Sidebar />
      <RoutineList />
    </div>
  );
};

export default UserRoutine;
