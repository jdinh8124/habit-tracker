import React from 'react';

const BlankCard = props => {
  const [name, setName] = React.useState('');

  const postRoutine = newRoutine => {
    const init = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        user: newRoutine.createdBy,
        routineName: newRoutine.routineName,
        routineDesc: newRoutine.routineDescription
      })
    };
    fetch('/api/routine', init)
      .then(res => res.json())
      .then(res => false);
  };

  return (
    <div className="card m-2">
      <div className="row card-body text-left">
        <input type="text" className="new-routine col-8" placeholder= "New Routine" value={name} onChange={e => setName(e.target.value)} />
        <i className="fas fa-check cursor-pointer text-secondary col-2 fa-2x" onClick={
          () => {
            props.setBlank(false);
            const newArr = props.routine;
            const newRoutine = {
              routineName: name,
              routineDescription: 'will be deleted soon',
              createdBy: props.user
            };
            newArr.push(newRoutine);
            postRoutine(newRoutine);
            props.setRoutine(newArr);
            setName('');
          }
        }></i>
        <i className="fas fa-times cursor-pointer text-secondary col-2 fa-2x" onClick={
          () => {
            setName('');
            props.setBlank(false);
          }
        }></i>
      </div>
    </div>
  );
};

export default BlankCard;
