/*
* Main page after user logged in
*/

import React, { useState, useEffect } from 'react';
import Header from './header';
import Sidebar from './sidebar';
import HabitList from './habitList';
import Footer from './footer';
import BlankCard from './blankCard';

const UserHabits = props => {

  function isSideBarOpen() {
    if (props.isOpen) {
      return <Sidebar sideRender={props.sideRender} />;
    }
  }

  const [habits, setHabits] = useState([]);
  const [blank, setBlank] = React.useState(false);

  function getUserHabits(userId) {
    fetch(`/api/habit/${userId}`)
      .then(result => result.json())
      .then(userHabits => {
        setHabits(userHabits);
      });
  }

  useEffect(() => {
    getUserHabits(1);

  }, []);

  const createBlank = () => {
    return blank && <BlankCard setBlank={setBlank} />;
  };

  return (
    <div className ="bg-light h-100">
      <Header title={'User Habits'} headerView={'main'} openSideBar={props.openSideBar}/>
      {isSideBarOpen()}
      <HabitList userHabits={habits} />
      {createBlank()}
      <Footer setBlank={setBlank} />
    </div>
  );
};

export default UserHabits;
