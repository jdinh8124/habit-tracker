import React from 'react';

const Footer = props => {
  function chooseOnClick() {
    if (props.screen === 'userRoutine') {
      return (
        <i className="fas fa-plus-circle text-secondary" onClick={
          () => props.setBlank(true)
        }></i>);
    } else {
      return (
        <i className="fas fa-plus-circle text-secondary" onClick={
          () => props.changeView('chooseRoutine')
        }></i>);
    }
  }

  const createPlane = () => {
    if (props.routineId) {
      return <i className="fas fa-paper-plane text-secondary" onClick={
        () => props.setView('request')
      }></i>;
    }
    return null;
  };

  return (
    <div className="container footer">
      <div className="row">
        <div className="col-2 plane-sign">
          {createPlane()}
        </div>
        <div className="col-8"></div>
        <div className="col-2 plus-sign">
          {chooseOnClick()}
        </div>
      </div>
    </div>
  );
};

export default Footer;
