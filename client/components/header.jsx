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

  function goBack() {
    props.history.goBack();
    props.backClear();
  }

  function headerTypeToRender() {
    if (props.headerView === 'main') {
      return (
        <>
          <div className="col-10 p-3 titleSize" >{props.title}</div>
          <div onClick={props.openSideBar} className="titleSize"><i className="a fas fa-bars"></i></div>
        </>
      );
    } else if (props.headerView === 'subMain') {
      return (
        <div>
          <div onClick={goBack} className="col-10 p-3 titleSize"><i className="fas fa-chevron-left a"></i></div>
          <div className="col-10 p-3 titleSize" >{props.title}</div>

        </div>
      );
    } else if (props.headerView === 'newList') {
      return (
        <div>
          <div className="col-10 p-3 titleSize"><i className="fas fa-chevron-left a"></i></div>
          <div >{props.title}</div>
          <div><i className="fas fa-check cursor-pointer"></i></div>
        </div>
      );
    }
  }

  if (currentPage === '/scheduledHabits') {
    className = 'hide';
  } else {
    className = 'navbar navbar-light header-gradient';
  }

  return (
    <header className={className}>
      {headerTypeToRender()}
    </header>
  );
}
