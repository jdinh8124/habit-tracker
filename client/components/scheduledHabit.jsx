import React from 'react';

const ScheduledHabit = props => {

  const handleYesClick = () => {
    props.changeView('message');
    props.update(props.id);
  };

  const handleNoClick = () => {
    props.changeView('message');
    props.motivationalMessage(props.id);
  };

  return (
    <div className="blue-purple-gradient h-100vh d-flex justify-content-center align-items-center flex-column">
      <h2 className="h2 text-center text-white">Did you complete this habit?</h2>
      <button className="btn btn-outline-light m-2 btn-lg " onClick={handleYesClick}> YES </button>
      <button className="btn btn-outline-light m-2 btn-lg" onClick={handleNoClick}> NO </button>
    </div>
  );
};

export default ScheduledHabit;
