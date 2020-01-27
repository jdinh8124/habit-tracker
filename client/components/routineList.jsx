import React from 'react';
import Routine from './routine';

const RoutineList = props => {
  const [editList, setEditList] = React.useState('');

  let createList = [];
  if (props.routine) {
    createList = props.routine.map(item => <Routine key={item.routineId}
      routineItem={item} editList={editList} setEditList={setEditList}
      routineId={item.routineId} userId={props.userId} setView={props.setView} />);
  } else {
    createList = [];
  }

  return (
    <div>{createList}</div>
  );
};

export default RoutineList;
