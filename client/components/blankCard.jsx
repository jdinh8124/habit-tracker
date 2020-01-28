import React from 'react';

const BlankCard = props => {
  const [name, setName] = React.useState('');
  // const [routine, setRoutine] = React.useState(null);

  const postHabit = habitName => {
    const init = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        userId: props.user,
        habitName: habitName
      })
    };
    fetch(`api/routine/${props.routineId}/habit`, init)
      .then(res => res.json())
      .then(res => false);
  };

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
      .then(res => {
        const newArr = props.routine;
        // setRoutine(res);
        const newNewRoutine = {
          routineId: res[0].routineId,
          routineName: name,
          routineDescription: 'will be deleted soon',
          createdBy: props.user
        };
        newArr.push(newNewRoutine);
        props.setRoutine(newArr);
        window.location.reload(true);
      });
  };

  const placeHolderText = () => {
    return props.blank === 'routine'
      ? 'New Routine'
      : 'New Habit';
  };

  return (
    <div className="card m-2">
      <div className="row card-body text-left">
        <input type="text" className="new-routine col-8" placeholder={placeHolderText()} value={name} onChange={e => setName(e.target.value)} />
        <i className="fas fa-check cursor-pointer text-secondary col-2 fa-2x" onClick={
          () => {
            props.setBlank(false);
            if (props.blank === 'routine') {
              const newArr = props.routine;
              const newRoutine = {
                routineName: name,
                routineDescription: 'will be deleted soon',
                createdBy: props.user
              };
              newArr.push(newRoutine);
              postRoutine(newRoutine);
              // props.setRoutine(newArr);
            } else {
              const newArr = props.routine;
              const newHabit = {
                habitName: name,
                habitDescription: 'will be deleted soon',
                createdBy: props.user
              };
              newArr.push(newHabit);
              postHabit(name);
              props.setRoutine(newArr);
            }
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
