import React from 'react';

const BlankCard = props => {
  return (
    <div className="card m-2">
      <div className="row card-body text-left">
        <input type="text" className="col-8"/>
        <i className="fas fa-check cursor-pointer text-secondary col-2 fa-2x" onClick={
          () => props.setBlank(false)
        }></i>
        <i className="fas fa-times cursor-pointer text-secondary col-2 fa-2x" onClick={
          () => props.setBlank(false)
        }></i>
      </div>
    </div>
  );
};

export default BlankCard;
