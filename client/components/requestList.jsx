import React from 'react';
import RequestItem from './requestItem';

const RequestList = props => {
  const createRequestItem = () => {
    if (props.request) {
      return props.request.map(item => <RequestItem key={item.routineId} request={item}
        setView={props.setView} setRoutine={props.setRoutine} />);
    } else return null;
  };

  return (
    <div>
      {createRequestItem()}
    </div>
  );
};

export default RequestList;
