import React from 'react';

const Routine = props => {
  return (
    <div className="card m-2" onClick={() => null}>
      <div className="row card-body text-left">
        <h2 className="text-secondary col-8">{props.routineItem.routineName}</h2>
        <i className="fas fa-edit text-secondary col-2 fa-2x"></i>
        <i className="fas fa-trash-alt text-secondary col-2 fa-2x"></i>
      </div>
    </div>
  );
};

export default Routine;
