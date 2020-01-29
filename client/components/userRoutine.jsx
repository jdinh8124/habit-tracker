import React from 'react';
import UserRoutineMain from './userRoutineMain';
import UserRoutineHabit from './userRoutineHabit';

const UserRoutine = props => {
  const [view, setView] = React.useState('main');
  const userId = 1;

  const createPage = () => {
    if (view === 'main') {
      return <UserRoutineMain setView={setView} openSideBar={props.openSideBar}
        isOpen={props.isOpen} userId={userId} />;
    } else {
      return <UserRoutineHabit routineId={view} openSideBar={props.openSideBar}
        isOpen={props.isOpen} userId={userId}/>;
    }
  };

  return (
    <>
      {createPage()}
    </>
  );
};

export default UserRoutine;
