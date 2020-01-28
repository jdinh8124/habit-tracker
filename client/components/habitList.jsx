/*
* Send GET request, list all the habit items
*/
import React from 'react';
import Habit from './habit';

const HabitList = props => {
  let userHabits;
  if (props.userHabits.length === 0) {
    userHabits = <h2>add a habit</h2>;
  } else {
    userHabits = props.userHabits.map(value => <Habit chooseHabit={props.chooseHabit}
      currentHabit={props.currentId} changeView={props.changeView}
      userId = {props.userId} id={value.habitId}
      getCurrentHabit = {props.getCurrentHabit} key={value.habitId}
      name= {value.habitName}
      deleteHabit={props.deleteHabit}
      chooseHabitFunction= {props.chooseHabitFunction} />);
  }
  return (
    <div>
      {userHabits}
    </div>
  );
};

export default HabitList;
