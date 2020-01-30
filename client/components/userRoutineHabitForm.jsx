import React from 'react';

const UserRoutineHabitForm = props => {
  const [userName, setUserName] = React.useState('');

  return (
    <div className="d-flex justify-content-center align-items-center flex-column h-100 vh-100">
      <h2 className="h2 text-center purple-font">Send &apos;{props.routineName}&apos; to Friend</h2>
      <input type="text" value={userName} className="outline-input" onChange={
        e => setUserName(e.target.value)
      }/>
      <button className="blue-purple-gradient btn btn-outline-light m-2 btn-lg " onClick={
        () => {
          const init = {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json'
            },
            body: JSON.stringify({
              routineId: props.routineId,
              routineName: props.routineName,
              creatorId: props.userId,
              receiverName: userName,
              requestMessage: 'Yet to implement'
            })
          };
          if (userName) {
            fetch('/api/share', init)
              .then(res => res.json())
              .then(res => false);
            props.setView('sent');
          }
        }
      }> SEND </button>
      <button className="blue-purple-gradient btn btn-outline-light m-2 btn-lg" onClick={
        () => props.setView('main')
      }> CANCEL </button>
    </div>
  );
};

export default UserRoutineHabitForm;
