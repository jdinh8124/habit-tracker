import React from 'react';
import Header from './header';
import Sidebar from './sidebar';
import HabitList from './habitList';

const UserRoutineHabit = props => {
  const routineId = 2;
  const userId = 1;
  const [routineHabit, setRoutineHabit] = React.useState([]);

  React.useEffect(
    () => {
      fetch(`/api/routine/${routineId}/user/${userId}`)
        .then(res => res.json())
        .then(res => setRoutineHabit(res));
    }, []
  );

  return (
    <div className="bg-light h-100">
      <Header />
      <Sidebar />
      <HabitList userHabits={routineHabit} />
    </div>
  );
};

export default UserRoutineHabit;
