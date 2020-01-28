import React from 'react';

const ChooseRoutine = props => {

  function handleClick() {
    props.changeView('chooseHabit');
    props.findCurrentRoutine(props.id);
    props.addingInfo('routineId', props.id);
  }

  return (
    <div className="card m-2" onClick={handleClick}>
      <div className="row card-body text-left">
        <h2 className="text-secondary col-10">{props.name}</h2>
      </div>
    </div>

  );
};

export default ChooseRoutine;
