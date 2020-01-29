import React from 'react';
import UserRoutineMain from './userRoutineMain';
import UserRoutineHabit from './userRoutineHabit';
import { UserConsumer } from './userContext';

const UserRoutine = props => {
  const [view, setView] = React.useState('main');

  const createPage = userId => {
    if (view === 'main') {
      return <UserRoutineMain setView={setView} openSideBar={props.openSideBar}
        isOpen={props.isOpen} userId={userId} history={props.history} />;
    } else {
      return <UserRoutineHabit setView={setView} routineId={view} openSideBar={props.openSideBar}
        isOpen={props.isOpen} userId={userId} history={props.history}/>;
    }
  };

  return (
    <UserConsumer>
      {props => createPage(props.userId)}
    </UserConsumer>
  );
};

export default UserRoutine;
