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
      return (<>
        <h1>Hello, Friend</h1>
        <button onClick={changeViewToSignUp}>Sign Up</button>
        <button onClick={changeViewToSignIn}>Log In</button>
      </>
      );
    } else if (view === 'sign up') {
      return <Signup signIn={changeViewToSignIn}/>;
    } else {
      return (
        <Signin history={props.history} />
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
