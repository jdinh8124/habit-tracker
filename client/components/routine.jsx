import React from 'react';

const Routine = props => {
  const [edit, setEdit] = React.useState(false);
  const [newRoutine, setNewRoutine] = React.useState(props.routineItem.routineName);
  const [routineMemory, setRoutineMemory] = React.useState('');

  const showCardContent = () => {
    return edit && props.editList === props.routineItem.routineName
      ? (
        <>
          <input className="col-8" value={newRoutine}
            placeholder={props.routineItem.routineName}
            onChange={e => setNewRoutine(e.target.value)}/>
          <i className="fas fa-check text-secondary col-2 fa-2x col-2" onClick={
            () => {
              const init = {
                method: 'PUT',
                headers: {
                  'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                  routineName: newRoutine,
                  user: props.userId
                })
              };
              fetch(`/api/routine/${props.routineId}`, init)
                .then(res => true)
                .then(res => {
                  props.routineItem.routineName = newRoutine;
                });
              setEdit(false);
              props.setEditList('');
              setNewRoutine(newRoutine);
            }
          }></i>
          <i className="fas fa-times text-secondary col-2 fa-2x col-2" onClick={
            () => {
              setNewRoutine(routineMemory);
              setEdit(false);
              props.setEditList('');
            }
          }></i>
        </>
      )
      : (
        <>
          <h2 className="text-secondary col-8" onClick={() => props.setView(props.routineId)}>{newRoutine}</h2>
          <i className="fas fa-edit text-secondary col-2 fa-2x" onClick={
            e => {
              setEdit(true);
              setRoutineMemory(newRoutine);
              if (props.editList === '') props.setEditList(props.routineItem.routineName);
            }
          }></i>
          <i className="fas fa-trash-alt text-secondary col-2 fa-2x" onClick={
            () => {
              if (props.routineId === 1) {
                const init = {
                  method: 'POST',
                  headers: {
                    'Content-Type': 'application/json'
                  }
                };
                fetch(`/api/default/${props.userId}`, init)
                  .then(res => true)
                  .then(props.setRoutine(
                    () => {
                      const routineCopy = [...props.routine];
                      routineCopy.shift();
                      return routineCopy;
                    }
                  ));
              } else {
                const init = {
                  method: 'DELETE',
                  headers: {
                    'Content-Type': 'application/json'
                  },
                  body: JSON.stringify({
                    id: props.routineId
                  })
                };
                fetch('/api/routine', init)
                  .then(res => true)
                  .then(res => {
                    props.setRoutine(
                      () => {
                        const routineCopy = [...props.routine];
                        for (let i = 0; i < props.routine.length; i++) {
                          if (props.routine[i].routineId === props.routineId) {
                            routineCopy.splice(i, 1);
                            return routineCopy;
                          }
                        }
                      }
                    );
                  });
              }
            }
          }></i>
        </>
      );
  };

  return (
    <div className="card m-2" onClick={() => null}>
      <div className="row card-body text-left">
        {showCardContent()}
      </div>
    </div>
  );
};

export default Routine;
