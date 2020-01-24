import React from 'react';

const ScheduledHabit = props => {

  const handleYesClick = () => {
    props.changeView('message');
    props.update(4);
  };

  const handleNoClick = () => {
    props.changeView('message');

  };

  return (
    <div className="blue-purple-gradient d-flex justify-content-center align-items-center flex-column h-100">
      <h2 className="h2 text-center text-white">Did you complete this habit?</h2>
      <button className="btn btn-outline-light m-2 btn-lg " onClick={handleYesClick}> YES </button>
      <button className="btn btn-outline-light m-2 btn-lg" onClick={handleNoClick}> NO </button>
    </div>
  );
};

export default ScheduledHabit;
