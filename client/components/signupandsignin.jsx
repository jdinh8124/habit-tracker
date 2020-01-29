import React, { useState } from 'react';
import Signup from './signup';
import Signin from './signin';
const SignUpandSignIn = props => {

  const [view, setAccountView] = useState('welcome');

  const changeViewToSignUp = () => {
    setAccountView('sign up');
  };

  const changeViewToSignIn = () => {
    setAccountView('Sign In ');
  };

  const welcomeRender = () => {
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
        <Signin setUserId={props.setUserId} {...props} />
      );
    }
  };

  return (
    <>
      {welcomeRender()}
    </>
  );
};

export default SignUpandSignIn;
