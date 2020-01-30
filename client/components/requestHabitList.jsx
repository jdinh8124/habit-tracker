import React from 'react';
import RequestHabitItem from './requestHabitItem';

const RequestHabitList = props => {
  const [habit, setHabit] = React.useState(null);

  React.useEffect(
    () => {
      fetch(`/api/routine/${props.routine.routineId}`)
        .then(res => res.json())
        .then(res => {
          if (res.length) setHabit(res);
        });
    }, []
  );

  const createHabitList = () => {
    if (habit) {
      return habit.map(item => <RequestHabitItem
        key={item.habitId + 'request'} habit={item} />);
    }
  };

  return (
    <div className="pb-5">
      {createHabitList()}
      <div className="container footer">
        <div className="row">
          <div className="col-2 plane-sign">
            <i className="fas fa-check text-secondary col-2 fa-2x col-2"
              onClick={
                () => {
                  const init = {
                    method: 'PUT',
                    headers: {
                      'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                      receiverId: props.userId,
                      response: true
                    })
                  };
                  fetch(`/api/request/${props.routine.routineId}`, init)
                    .then(res => false);
                  const requestArr = [...props.request];
                  for (let i = 0; i < requestArr.length; i++) {
                    if (requestArr[i].routineId === props.routine.routineId) {
                      requestArr.splice(i, 1);
                    }
                  }
                  props.setRequest(requestArr);
                  props.setView('main');
                }
              }></i>
          </div>
          <div className="col-8"></div>
          <div className="col-2 plus-sign">
            <i className="fas fa-times text-secondary col-2 fa-2x col-2"
              onClick={
                () => {
                  const init = {
                    method: 'PUT',
                    headers: {
                      'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                      receiverId: props.userId,
                      response: 'false'
                    })
                  };
                  fetch(`/api/request/${props.routine.routineId}`, init)
                    .then(res => false);
                  const requestArr = [...props.request];
                  for (let i = 0; i < requestArr.length; i++) {
                    if (requestArr[i].routineId === props.routine.routineId) {
                      requestArr.splice(i, 1);
                    }
                  }
                  props.setRequest(requestArr);
                  props.setView('main');
                }
              }></i>
          </div>
        </div>
      </div>
    </div>
  );
};

export default RequestHabitList;
