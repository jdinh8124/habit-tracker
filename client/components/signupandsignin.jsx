import React, { useState } from 'react';
import Signup from './signup';
import Signin from './signin';
const SignUpandSignIn = props => {

  const [view, setAccountView] = useState('welcome');

  function changeViewToSignUp() {
    setAccountView('sign up');
  }

  function changeViewToSignIn() {
    setAccountView('Sign In ');
  }

  function welcomeRender() {
    if (view === 'welcome') {
      return (<div className="h-100 blue-purple-gradient d-flex flex-column align-items-center justify-content-center">
        <h1 className="text-white">Hello, Friend</h1>
        <button className="btn btn-outline-light m-2 btn-lg" onClick={changeViewToSignUp}>Sign Up</button>
        <button className="btn btn-outline-light m-2 btn-lg" onClick={changeViewToSignIn}>Log In</button>
      </div>
      );
    } else if (view === 'sign up') {
      return <Signup signIn={changeViewToSignIn}/>;
    } else {
      return (
        <Signin />
      );
    }
  }

  return (
    <>
      {welcomeRender()}
    </>
  );
};

export default SignUpandSignIn;
