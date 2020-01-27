import React from 'react';

const Sidebaritem = props => {

  function isItCloseDiv() {
    if (props.onClick) {
      return (<div onClick={props.onClick} className="row cursor-pointer">
        <p> <i className={props.pic}></i> {props.text}</p>
      </div>

      );
    } else {
      return (
        <div className="row cursor-pointer">
          <p> <i className={props.pic}></i> {props.text}</p>
        </div>
      );
    }
  }

  return (
    <div className="container side-item d-flex justify-content-center align-items-center">
      {isItCloseDiv()}
      <div className="bottom-line"></div>
    </div>
  );
};

export default Sidebaritem;
