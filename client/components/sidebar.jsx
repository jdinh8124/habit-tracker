/*
* Only exist with the hamburger bar header
*/

import React from 'react';
import SidebarItem from './sidebaritem';

const Sidebar = props => {

  const sideBarItems = () => {
    if (props.sideRender === 'inHabits') {
      return (
        <>
          <SidebarItem pic="far fa-user" text="Log Out" />
          <SidebarItem pic="fas fa-bars" text="Routines" />
          <SidebarItem pic="fas fa-times" text="Close" />
        </>
      );
    } else if (props.sideRender === 'inRoutines') {
      return (
        <>
          <SidebarItem pic="far fa-user" text="Log Out" />
          <SidebarItem pic="fas fa-bars" text="Habits" />
          <SidebarItem pic="fas fa-times" text="Close" />
        </>
      );
    } else {
      const nextRequest = (
        <>
          <SidebarItem pic="far fa-user" text="Log Out" />
          <SidebarItem pic="fas fa-bars" text="Routines" />
          <SidebarItem pic="fas fa-exclamation-circle" text="Pending Routine" />
          <SidebarItem pic="fas fa-times" text="Close" />
        </>
      );
      return nextRequest;
    }
  };

  return (
    <div className="shadow-div container ">
      <div className="open-side offset-6 bg-primary ">
        {sideBarItems()}
      </div>
    </div>
  );
};

export default Sidebar;
