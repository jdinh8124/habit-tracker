import React, { useState, useEffect } from 'react';
import Header from './header';
import Sidebar from './sidebar';
import HabitList from './habitList';
import ScheduledHabit from './scheduledHabit';
import Message from './message';
import Footer from './footer';
import RoutineList from './routineList';
import Frequency from './frequency';
import Duration from './duration';
import Congrats from './congrats';
import Motivation from './motivation';
import UserContext from './userContext';
import BlankCard from './blankCard';

const UserHabits = props => {
  function isSideBarOpen() {
    if (props.isOpen) {
      return <Sidebar signOut={props.signOut} sideRender={'inHabits'} closeSideBar={props.openSideBar} />;
    }
  }

  const [habits, setHabits] = useState([]);
  const [view, setView] = useState('');
  const [currentMessage, setCurrentMessage] = useState('');
  const [currentHabit, setCurrentHabit] = useState(0);
  const [currentRoutine, setCurrentRoutine] = useState(0);
  const [routine, setRoutine] = React.useState(null);
  const [routineHabits, setRoutineHabits] = useState([]);
  const [blank, setBlank] = React.useState(false);
  const userId = React.useContext(UserContext).userId;

  function getUserHabits(userId) {
    fetch(`/api/habit/${userId}`)
      .then(result => result.json())
      .then(userHabits => {
        setHabits(userHabits);
      });
  }

  function deleteUserHabit(habitId) {
    fetch('/api/habit/', {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ habitId: habitId })
    })
      .then(response => {
        const habitsCopy = [...habits];
        const index = habitsCopy.findIndex(element => element.habitId === habitId);
        habitsCopy.splice(index, 1);
        setHabits(habitsCopy);

      });
  }

  const createBlankRoutine = () => {
    return blank && <BlankCard setBlank={setBlank} blank='routine' routineId={props.routineId}
      user={userId} routine={routine} setRoutine={setRoutine} />;
  };

  const createBlankHabit = () => {
    return blank && <BlankCard setBlank={setBlank} blank='habit' routineId={currentRoutine}
      user={userId} routine={routine} setRoutine={setRoutine} />;
  };

  function updateLastCompletion(habitId) {
    fetch('/api/user/habit', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        habitId: habitId,
        userId: userId
      })
    })
      .then(response => response.json())
      .then(response => {
        const habitsCopy = [...habits];
        const index = habitsCopy.findIndex(element => element.habitId === habitId);
        habitsCopy[index].lastCompleted = response.lastCompleted;
        habitsCopy[index].timesCompleted = response.timesCompleted;
        habitsCopy[index].nextCompletion = response.nextCompletion;
        setHabits(habitsCopy);
        setCurrentMessage(response.congratsMessage);

      });
  }

  function motivationalMessage(habitId) {
    const index = habits.findIndex(element => element.habitId === habitId);
    setCurrentMessage(habits[index].motivationalMessage);
  }

  function findCurrentHabit(id) {
    setCurrentHabit(id);
  }

  function changeView(currentView) {
    setView(currentView);
  }

  function newHabit() {
    if (props.newHabit) {
      const habitsCopy = [...habits];
      habitsCopy.push(props.newHabit);
      setHabits(habitsCopy);
    }
  }

  function findCurrentRoutine(id) {
    setCurrentRoutine(id);
  }

  function getRoutineHabits() {
    fetch(`/api/routine/${currentRoutine}`)
      .then(res => res.json())
      .then(res => {
        return setRoutineHabits(res);
      });
  }

  useEffect(() => {
    getUserHabits(userId);
    fetch(`/api/routine/user/${userId}`)
      .then(res => res.json())
      .then(res => {
        fetch(`/api/default/${userId}`)
          .then(result => result.json())
          .then(result => {
            if (!result.length) {
              res.unshift({
                routineId: 1,
                routineName: 'Web Dev',
                createdBy: 1,
                createdAt: '2020-01-30T15:47:09.933651-08:00'
              });
            }
            setRoutine(res);
          });
      });
  }, [userId]);

  useEffect(() => {
    newHabit();
  }, [props.newHabit]);

  function checkView() {
    if (view === 'scheduledHabit') {
      return <ScheduledHabit id={currentHabit} motivationalMessage= {motivationalMessage} update={updateLastCompletion} changeView={changeView}/>;
    } else if (view === 'message') {
      return <Message changeView= {changeView} messageToSelf={currentMessage}/>;
    } else if (view === 'chooseRoutine') {
      return (
        <div className="bg-light content-wrap pb-5">
          <Header title={'Choose Routine'} changeView={() => changeView('else')} backView={'scheduledHabit'} headerView={'subMainAndMenu'}
            openSideBar = {props.openSideBar} clearAll={'true'} />
          {isSideBarOpen()}
          <RoutineList changeView={changeView} view='notUserRoutineMain'
            routine={routine} userId={props.userId} setView={setView}
            findCurrentRoutine={findCurrentRoutine} addingInfo={props.addingInfo} />
          {createBlankRoutine()}
          <Footer screen="userRoutine" setBlank={setBlank}/>
        </div>
      );
    } else if (view === 'chooseHabit') {
      getRoutineHabits();
      return (
        <div className="bg-light content-wrap pb-5">
          <Header title={'Choose Habit'} headerView={'subMain'} openSideBar={props.openSideBar} changeView={() => changeView('chooseRoutine')} />
          <HabitList chooseHabitFunction={props.addingInfo} chooseHabit={true} changeView={changeView} userId={userId} userHabits={routineHabits} />
          {createBlankHabit()}
          <Footer screen="userRoutine" setBlank={setBlank} />

        </div>
      );
    } else if (view === 'chooseFrequency') {
      return (
        <div className="bg-light h-100vh">
          <Header title={'Choose Frequency'} headerView={'subMain'} openSideBar={props.openSideBar} changeView={() => changeView('chooseHabit')}/>
          <Frequency addingInfo={props.addingInfo} changeView={changeView} />
        </div>
      );
    } else if (view === 'chooseDuration') {
      return (
        <div className="bg-light h-100vh">
          <Header title={'Choose Duration'} headerView={'subMain'} openSideBar={props.openSideBar} changeView={() => changeView('chooseFrequency')} />
          <Duration addingInfo={props.addingInfo} changeView={changeView} />
        </div>
      );
    } else if (view === 'chooseCongrats') {
      return (
        <div className="bg-light h-100vh">
          <Header title={'Choose Message'} headerView={'subMain'} openSideBar={props.openSideBar} changeView={() => changeView('chooseDuration')} />
          <Congrats addingInfo={props.addingInfo} changeView={changeView}/>
        </div>
      );
    } else if (view === 'chooseMotivation') {
      return (
        <div className="bg-light h-100vh">
          <Header title={'Choose Message'} headerView={'subMain'} openSideBar={props.openSideBar} changeView={() => changeView('chooseCongrats')} />
          <Motivation addingInfo={props.addingInfo} changeView={changeView}/>
        </div>
      );
    } else {
      return (
        <div className="bg-light h-100 pb-100">
          <Header title={'User Habits'} headerView={'main'} choosehabit ={false} openSideBar={props.openSideBar} />
          {isSideBarOpen()}
          <HabitList currentId={findCurrentHabit} changeView={changeView} deleteHabit={deleteUserHabit} userId={userId} userHabits={habits} />
          <Footer screen="userHabits" changeView= {changeView} />
        </div>);
    }

  }
  return (
    <>
      {checkView()}
    </>
  );
};

export default UserHabits;
