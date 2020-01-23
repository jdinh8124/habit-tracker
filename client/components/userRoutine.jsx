/*
* Accessed through sidebar only
* Send routine to user leads to the routine request page
*/

import React from 'react';
import Header from './header';
import Sidebar from './sidebar';
import RoutineList from './routineList';

const UserRoutine = () => {
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
      <Header />
      <Sidebar />
      <RoutineList routine={routine} />
    </div>
  );
};

export default UserRoutine;
