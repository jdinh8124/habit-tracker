/*
* Two type of headers
* 1. back button < on the left
* 2. hamburger bar button on the right
*/

import React from 'react';

export default function Header(props) {
  const currentURL = new URL(window.location.href);
  const currentPage = currentURL.pathname;
  let className;
  function headerTypeToRender() {
    if (props.headerView === 'main') {
      return (
        <>
          <div className="col-3 titleSize offset-1" >{props.title}</div>
          <div onClick={props.openSideBar} className="titleSize"><i className="fas fa-bars cursor-pointer"></i></div>
        </>
      );
    } else if (props.headerView === 'subMain') {
      return (
        <div>
          <div className="col-3 titleSize offset-1"><i className="fas fa-chevron-left cursor-pointer"></i></div>
          <div>{props.title}</div>
        </div>
      );
    } else if (props.headerView === 'newList') {
      return (
        <div>
          <div className="col-3 titleSize offset-1"><i className="fas fa-chevron-left cursor-pointer"></i></div>
          <div>{props.title}</div>
          <div><i className="fas fa-check cursor-pointer"></i></div>
        </div>
      );
    }
  }

  if (currentPage === '/scheduledHabits') {
    className = 'hide';
  } else {
    className = 'paddingTop navbar navbar-light pb-4 bg-primary';
  }

  return (
    <header className={className}>
      {headerTypeToRender()}
    </header>
  );
}
