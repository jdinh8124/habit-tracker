import React from 'react';
import RequestItem from './requestItem';

const RequestList = props => {
  const createRequestItem = () => {
    if (!props.request) {
      return <h2 className="p-3 text-secondary">You have no routine request</h2>;
    }
    if (props.request.length > 0) {
      return props.request.map(item => <RequestItem key={item.routineId} request={item}
        setView={props.setView} setRoutine={props.setRoutine} />);
    } else {
      return <h2 className="p-3 text-secondary">You have no routine request</h2>;
    }
  };

  return (
    <div className="pb-5">
      {createRequestItem()}
    </div>
  );
};

export default RequestList;
