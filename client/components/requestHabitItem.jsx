import React from 'react';

const RequestHabitItem = props => {
  return (
    <div className="card m-2" onClick={() => null}>
      <div className="row card-body text-left">
        <h2 className="text-secondary">{props.habit.habitName}</h2>
      </div>
    </div>
  );
};

export default RequestHabitItem;
