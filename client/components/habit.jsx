import React, { useState } from 'react';

const Habit = props => {
  const [alreadyDidHabit, setAlreadyDidHabit] = useState(<></>);
  function handleDelete() {
    props.deleteHabit(props.id);
  }

  function handleClick() {
    if (!props.chooseHabit) {
      props.changeView('scheduledHabit');
      props.currentHabit(props.id);
    } else {
      checkIfHabitInProcess();
    }
  }

  function checkIfHabitInProcess() {
    fetch(`/api/habit/${props.userId}`)
      .then(result => result.json())
      .then(userHabits => {
        const resultIdArr = userHabits.filter(item => item.habitId === props.id);
        if (resultIdArr.length === 0) {
          props.changeView('chooseFrequency');
          props.chooseHabitFunction('habitId', props.id);
        } else {
          setAlreadyDidHabit(<p className='text-danger'>you are already working on this habit</p>);
        }

      });
  }

  function canDelete() {
    if (!props.chooseHabit) {
      return (<i className="fas fa-trash-alt cursor-pointer text-secondary col-2 fa-2x" onClick={handleDelete}></i>);
    }
  }

  return (
    <div className="card m-2" >
      <div className="row card-body text-left">
        <h2 className="text-secondary col-10" onClick={handleClick}>{props.name}</h2>
        {canDelete()}
        {alreadyDidHabit}
      </div>
    </div>

  );
};

export default Habit;
