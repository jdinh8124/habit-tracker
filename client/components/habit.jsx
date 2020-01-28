import React from 'react';

const Habit = props => {
  function handleDelete() {
    props.deleteHabit(props.id);
  }

  function handleClick() {
    if (!props.chooseHabit) {
      props.changeView('scheduledHabit');
      props.currentHabit(props.id);
    } else {
      props.changeView('chooseFrequency');
      props.chooseHabitFunction('habitId', props.id);
    }
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
      </div>
    </div>

  );
};

export default Habit;
