import React from 'react';
import UserRoutineHabitMain from './userRoutineHabitMain';
import UserRoutineHabitRequest from './userRoutineHabitRequest';
import UserRoutineHabitForm from './userRoutineHabitForm';
import UserRoutineHabitSent from './userRoutineHabitSent';

const UserRoutineHabit = props => {
  const [view, setView] = React.useState('main');
  const [routine, setRoutine] = React.useState({});

  const createPage = () => {
    let page = null;
    switch (view) {
      case 'main':
        page = <UserRoutineHabitMain goBackView={props.setView} setView={setView} setRoutine={setRoutine}
          userId={props.userId} routineId={props.routineId} openSideBar={props.openSideBar}
          isOpen={props.isOpen}/>;
        break;
      case 'request':
        page = <UserRoutineHabitRequest routineName={routine.routineName} setView={setView}/>;
        break;
      case 'form':
        page = <UserRoutineHabitForm routineName={routine.routineName}
          setView={setView} routineId={routine.routineId} userId={props.userId}/>;
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
