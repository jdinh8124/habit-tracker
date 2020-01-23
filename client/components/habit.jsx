import React from 'react';

const Habit = props => {
  function handleDelete() {
    props.deleteHabit(props.id);
  }
  return (
    <div className="card m-2">
      <div className="row card-body text-left">
        <h2 className="text-secondary col-8">{props.name}</h2>
        <i className="fas fa-edit cursor-pointer text-secondary col-2 fa-2x" ></i>
        <i className="fas fa-trash-alt cursor-pointer text-secondary col-2 fa-2x" onClick={handleDelete}></i>
      </div>
    </div>
  );
};

export default Habit;
