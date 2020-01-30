import React from 'react';

export default function Header(props) {
  const currentURL = new URL(window.location.href);
  const currentPage = currentURL.pathname;
  let className;

  function headerClick() {
    if (props.setView) {
      props.setView('main');
    } else {
      props.changeView();
    }
  }

  function headerTypeToRender() {
    if (props.headerView === 'main') {
      return (
        <>
          <div className="titleSize" >{props.title}</div>
          <div onClick={props.openSideBar} className="titleSize"><i className="a fas fa-bars"></i></div>
        </>
      );
    } else if (props.headerView === 'subMain') {
      return (
        <div className="p-0 col-12">
          <div onClick={headerClick} className="titleSize pr-2 d-inline"><i className="fas fa-chevron-left a"></i></div>
          <div className="titleSize d-inline-block" >{props.title}</div>
        </div>
      );
    } else {
      return (
        <div className="p-0 col-12">
          <div onClick={headerClick} className="titleSize pr-2 d-inline"><i className="fas fa-chevron-left a"></i></div>
          <div className="titleSize d-inline-block" >{props.title}</div>
          <div onClick={props.openSideBar} className="titleSize d-inline pl-3"><i className="a fas fa-bars"></i></div>
        </div>
      );
    }
  }

  if (currentPage === '/scheduledHabits') {
    className = 'hide';
  } else {
    className = 'p-4 navbar navbar-light header-gradient';
  }

  return (
    <header className={className}>
      {headerTypeToRender()}
    </header>
  );
}
