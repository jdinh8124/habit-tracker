import React from 'react';

const Sidebaritem = props => {

  return (
    <div className="container d-flex flex-col side-item">
      <div className="row">
        <div>{props.text}</div>
        <i className={props.pic}></i>
      </div>
      <div className="bottom-line"></div>
    </div>
  );
};

export default Sidebaritem;
