/*
* Main page after user logged in
*/

import React from 'react';
// import Header from './header';
// import Sidebar from './sidebar';
import HabitList from './habitList';

const UserHabits = () => {
  return (
    <div className='.bg-light'>
      <HabitList />
    </div>
  );
};

export default UserHabits;
