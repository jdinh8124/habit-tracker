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
    userHabits = props.userHabits.map(value => <Habit deleteHabit={props.deleteHabit} key={value.habitId} id= {value.habitId} name= {value.habitName} />);
  }
  return (
    <div>
      {userHabits}
    </div>
  );
};

export default HabitList;
