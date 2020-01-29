import React from 'react';

const RequestItem = props => {
  const showCardContent = () => {
    return (
      <>
        <h2 className="text-secondary col-8" onClick={
          () => {
            props.setView('habit');
            props.setRoutine(props.request);
          }
        }>{props.request.routineName}</h2>
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

export default RequestItem;
