import React from 'react';
import UserRoutineMain from './userRoutineMain';
import UserRoutineHabit from './userRoutineHabit';

const UserRoutine = () => {
  const [view, setView] = React.useState('main');

  const createPage = () => {
    if (view === 'main') return <UserRoutineMain setView={setView} />;
    else return <UserRoutineHabit routineId={view} />;
  };

  return (
    <>
      {createPage()}
    </>
  );
};

export default UserRoutine;
