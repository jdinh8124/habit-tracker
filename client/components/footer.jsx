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
  return (
    <div className="container footer h-50">
      <div className="plus-sign">
        {chooseOnClick()}
      </div>
    </div>
  );
};

export default Footer;
