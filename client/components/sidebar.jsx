import React from 'react';
import SidebarItem from './sidebaritem';
import { Link } from 'react-router-dom';
import UserContext from './userContext';

const Sidebar = props => {
  const [envelope, setEnvelope] = React.useState('far fa-envelope-open');
  const userId = React.useContext(UserContext).userId;
  const checkRequest = () => {
    fetch(`/api/request/${userId}`)
      .then(res => res.json())
      .then(res => {
        return res.length
          ? setEnvelope('far fa-envelope')
          : setEnvelope('far fa-envelope-open');
      });
  };

  const sideBarItems = () => {
    checkRequest();
    if (props.sideRender === 'inHabits') {
      return (
        <>
          <Link to="/">
            <SidebarItem pic="far fa-user" text="Log Out" />
          </Link>
          <Link to="/routineRequest">
            <SidebarItem onClick={props.closeSideBar} pic={envelope} text="Requests" />
          </Link>
          <Link to="/userRoutine">
            <SidebarItem onClick={props.closeSideBar} pic="fas fa-bars" text="Routines" />
          </Link>
          <SidebarItem onClick={props.closeSideBar} pic="fas fa-times" text="Close" />
        </>
      );
    } else if (props.sideRender === 'inRoutines') {
      return (
        <>
          <Link to="/">
            <SidebarItem onClick={props.closeSideBar} pic="far fa-user" text="Log Out" />
          </Link>
          <Link to="/routineRequest">
            <SidebarItem onClick={props.closeSideBar} pic={envelope} text="Requests" />
          </Link>
          <Link to="/userHabits">
            <SidebarItem onClick={props.closeSideBar} pic="fas fa-bars" text="Habits" />
          </Link>
          <SidebarItem onClick={props.closeSideBar} pic="fas fa-times" text="Close" />
        </>
      );
    } else {
      const nextRequest = (
        <>
          <Link to="/">
            <SidebarItem pic="far fa-user" text="Log Out" />
          </Link>
          <Link to="/routineRequest">
            <SidebarItem onClick={props.closeSideBar} pic={envelope} text="Requests" />
          </Link>
          <Link to="/userRoutine">
            <SidebarItem pic="fas fa-bars" text="Routines" />
          </Link>
          <SidebarItem onClick={props.closeSideBar} pic="fas fa-times" text="Close" />
        </>
      );
      return nextRequest;
    }
  };

  return (
    <div className="shadow-div container ">
      <div className="open-side offset-5 purple">
        {sideBarItems()}
      </div>
    </div>
  );
};

export default Sidebar;
