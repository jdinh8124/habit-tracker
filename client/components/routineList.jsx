/*
* Send GET request, list all the routine items
*/

import React from 'react';
import Routine from './routine';

const RoutineList = props => {
  let createList = [];
  if (props.routine) {
    createList = props.routine.map(item => <Routine key={item.routineId} routineItem={item} />);
  } else {
    createList = [];
  }

  return (
    <div>{createList}</div>
  );
};

export default RoutineList;
