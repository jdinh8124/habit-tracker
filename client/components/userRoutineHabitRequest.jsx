import React from 'react';

const UserRoutineHabitRequest = props => {
  return (
    <div className="blue-purple-gradient d-flex justify-content-center align-items-center flex-column h-100 vh-100">
      <h2 className="h2 text-center text-white">Send &apos;{props.routineName}&apos; to a friend?</h2>
      <button className="btn btn-outline-light m-2 btn-lg " onClick={
        () => props.setView('form')
      }> YES </button>
      <button className="btn btn-outline-light m-2 btn-lg" onClick={
        () => props.setView('main')
      }> NO </button>
    </div>
  );
};

export default UserRoutineHabitRequest;
