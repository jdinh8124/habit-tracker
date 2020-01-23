import React from 'react';

const Sidebaritem = props => {

  return (
    <div className="container ml-3 side-item">
      <div className="row">
        <i className={props.pic}></i>
        <div>{props.text}</div>
      </div>
      <div className="bottom-line"></div>
    </div>
  );
};

export default Sidebaritem;
