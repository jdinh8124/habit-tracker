import React from 'react';
import UserRoutineMain from './userRoutineMain';
import UserRoutineHabit from './userRoutineHabit';

const UserRoutine = props => {
  const [view, setView] = React.useState('main');

  const createPage = () => {
    if (view === 'main') {
      return <UserRoutineMain setView={setView} openSideBar={props.openSideBar}
        isOpen={props.isOpen} />;
    } else return <UserRoutineHabit routineId={view} />;
  };

  return (
    <>
      {createPage()}
    </>
  );
};

export default UserRoutine;
