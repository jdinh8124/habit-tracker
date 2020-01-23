import React from 'react';

const Sidebaritem = props => {

  function isItCloseDiv() {
    if (props.onClick) {
      return (<div onClick={props.onClick} className="row cursor-pointer">
        <i className={props.pic}></i>
        <div>{props.text}</div>
      </div>

      );
    } else {
      return (
        <div className="row cursor-pointer">
          <i className={props.pic}></i>
          <div>{props.text}</div>
        </div>
      );
    }
  }

  return (
    <div className="container ml-3 side-item ">
      {isItCloseDiv()}
      <div className="bottom-line"></div>
    </div>
  );
};

export default Sidebaritem;
