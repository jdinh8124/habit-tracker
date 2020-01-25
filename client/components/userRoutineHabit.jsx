import React from 'react';
import UserRoutineHabitMain from './userRoutineHabitMain';
import UserRoutineHabitRequest from './userRoutineHabitRequest';
import UserRoutineHabitForm from './userRoutineHabitForm';
import UserRoutineHabitSent from './userRoutineHabitSent';

const UserRoutineHabit = () => {
  const [view, setView] = React.useState('main');
  const [routine, setRoutine] = React.useState({});
  const userId = 2;

  const createPage = () => {
    let page = null;
    switch (view) {
      case 'main':
        page = <UserRoutineHabitMain setView={setView} setRoutine={setRoutine}
          userId={userId}/>;
        break;
      case 'request':
        page = <UserRoutineHabitRequest routineName={routine.routineName} setView={setView}/>;
        break;
      case 'form':
        page = <UserRoutineHabitForm routineName={routine.routineName}
          setView={setView} routineId={routine.routineId} userId={userId}/>;
        break;
      case 'sent':
        page = <UserRoutineHabitSent setView={setView}/>;
    }
    return page;
  };

  return (
    <>
      {createPage()}
    </>
  );
};

export default UserRoutineHabit;
