import React from 'react';

class SignIn extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      userName: '',
      userPwd: '',
      wrongUsername: false
    };
    this.userNameChange = this.userNameChange.bind(this);
    this.passwordChange = this.passwordChange.bind(this);
    this.checkAccount = this.checkAccount.bind(this);
  }

  userNameChange(event) {
    this.setState({ userName: event.target.value });

  }

  passwordChange(event) {
    this.setState({ userPwd: event.target.value });
  }

  isUserNameValid() {
    if (this.state.wrongUsername) {
      return (
        <div className="invalid-feedback showError">
          Your Username or Password Was Incorrect
        </div>
      );
    }
  }

  checkAccount() {
    const newObj = { ...this.state };
    event.preventDefault();
    fetch('/api/auth/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(newObj)
    })
      .then(response => {
        if (response.status === 204) {
          return (
            window.location = '/userHabits'
          );
        } else {
        /* eslint-disable no-console */
          console.log(response);
          /* eslint-disable no-console */
          console.log('try again');
          this.setState(previousState => ({ wrongUsername: true }));
        }
      });
  }

  render() {
    return (
      <div className="d-flex flex-column mt-5 align-items-center">
        <h1>Sign In</h1>
        <form onSubmit={this.checkAccount}>
          {this.isUserNameValid()}
          <input onChange={this.userNameChange} className="form-control" placeholder="Username" />
          <input type="password" name="password" autoComplete="on" onChange={this.passwordChange} className="form-control" placeholder="Password" />
          <button className="btn btn-primary mb-4">Sign In</button>
        </form>
      </div>
    );
  }
}
export default SignIn;
