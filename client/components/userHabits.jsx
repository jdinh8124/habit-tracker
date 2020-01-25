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
  const [currentMessage, setCurrentMessage] = useState('');
  const [currentHabit, setCurrentHabit] = useState(0);

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

  useEffect(() => {
    getUserHabits(userId);
    newHabit();

  }, []);

  function checkView() {
    if (view === 'scheduledHabit') {
      return <ScheduledHabit id={currentHabit} motivationalMessage= {motivationalMessage} update={updateLastCompletion} changeView={changeView}/>;
    } else if (view === 'message') {
      return <Message changeView= {changeView} messageToSelf={currentMessage}/>;
    } else {
      return (
        <div className="bg-light h-100">
          <Header title={'User Habits'} headerView={'main'} openSideBar={props.openSideBar} />
          {isSideBarOpen()}
          <HabitList currentId={findCurrentHabit} changeView={changeView} deleteHabit={deleteUserHabit} userId={userId} userHabits={habits} />
        </div>);
    }

  }
  return (<> {checkView()} </>);
};

export default UserHabits;
