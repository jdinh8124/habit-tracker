import React, { useState, useEffect } from 'react';
import Header from './header';
import Sidebar from './sidebar';
import HabitList from './habitList';
import ScheduledHabit from './scheduledHabit';
import Message from './message';

const UserHabits = props => {
  const userId = 2;
  function isSideBarOpen() {
    if (props.isOpen) {
      return <Sidebar sideRender={'inHabits'} closeSideBar={props.openSideBar} />;
    }
  }

  const [habits, setHabits] = useState([]);
  const [view, setView] = useState('');

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
      .then(response => {
      });
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

  useEffect(() => {
    getUserHabits(userId);
     newHabit();

  }, []);

  function checkView() {
    if (view === 'scheduledHabit') {
      return <ScheduledHabit update={updateLastCompletion} changeView={changeView}/>;
    } else if (view === 'message') {
      return <Message changeView= {changeView} messageToSelf='test'/>;
    } else {
      return (
        <div className="bg-light h-100">
          <Header title={'User Habits'} headerView={'main'} openSideBar={props.openSideBar} />
          {isSideBarOpen()}
          <HabitList changeView={changeView} deleteHabit={deleteUserHabit} userId={userId} userHabits={habits} />
        </div>);
    }

  }
  return (<> {checkView()} </>);
};

export default UserHabits;
