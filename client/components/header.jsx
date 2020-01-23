/*
* Two type of headers
* 1. back button < on the left
* 2. hamburger bar button on the right
*/

import React from 'react';

export default function Header(props) {

  function headerTypeToRender() {
    if (props.headerView === 'main') {
      return (
        <>
          <div className="col-3 titleSize offset-1" >{props.title}</div>
          <div onClick={props.openSideBar} className="titleSize"><i className="fas fa-bars"></i></div>
        </>
      );
    } else if (props.headerView === 'subMain') {
      return (
        <div>
          <div className="col-3 titleSize offset-1"><i className="fas fa-chevron-left"></i></div>
          <div>{props.title}</div>
        </div>
      );
    } else if (props.headerView === 'newList') {
      return (
        <div>
          <div className="col-3 titleSize offset-1"><i className="fas fa-chevron-left"></i></div>
          <div>{props.title}</div>
          <div><i className="fas fa-check"></i></div>
        </div>
      );
    }
  }

  return (
    <header className=" paddingTop navbar navbar-light pb-4 bg-primary">
      {headerTypeToRender()}
    </header>
  );
}
