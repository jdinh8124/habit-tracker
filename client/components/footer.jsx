import React from 'react';

const Footer = props => {
  const createPlane = () => {
    if (props.routineId) {
      return <i className="fas fa-paper-plane" onClick={
        () => props.setView('request')
      }></i>;
    }
    return null;
  };

  return (
    <div className="container">
      <div className="row">
        <div className="col-2">
          {createPlane()}
        </div>
        <div className="col-8"></div>
        <div className="col-2">
          <i className="fas fa-plus-circle" onClick={
            () => props.setBlank(true)
          }></i>
        </div>
      </div>
    </div>
  );
};

export default Footer;
