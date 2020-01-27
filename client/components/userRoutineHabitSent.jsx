import React from 'react';

const UserRoutineHabitSent = props => {
  return (
    <div className="blue-purple-gradient d-flex justify-content-center align-items-center flex-column h-100 vh-100">
      <h2 className="h2 text-center text-white"> Sent! </h2>
      <button className="btn btn-outline-light m-2 btn-lg " onClick={
        () => props.setView('main')
      }> GO BACK </button>
    </div>
  );
};

export default UserRoutineHabitSent;
