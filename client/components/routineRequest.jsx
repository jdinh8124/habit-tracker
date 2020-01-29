import React from 'react';
import Header from './header';
import Sidebar from './sidebar';
import RequestList from './requestList';
import RequestHabitList from './requestHabitList';
import UserContext from './userContext';

const RoutineRequest = props => {
  const [view, setView] = React.useState('main');
  const [request, setRequest] = React.useState(null);
  const [routine, setRoutine] = React.useState('');
  const userId = React.useContext(UserContext).userId;

  const isSideBarOpen = () => {
    if (props.isOpen) {
      return <Sidebar sideRender={'requests'} closeSideBar={props.openSideBar} />;
    }
  };

  React.useEffect(
    () => {
      fetch(`/api/request/${userId}`)
        .then(res => res.json())
        .then(res => setRequest(res));
    }, []
  );

  const changeView = () => {
    return view === 'main'
      ? <RequestList request={request} setView={setView} setRoutine={setRoutine} />
      : <RequestHabitList routine={routine} setView={setView} userId={userId}
        setRequest={setRequest} request={request} />;
  };

  return (
    <div className="bg-light h-100">
      <Header title={'Routine Requests'} headerView={'main'} openSideBar={props.openSideBar} />
      {isSideBarOpen()}
      {changeView()}
    </div>
  );
};

export default RoutineRequest;
