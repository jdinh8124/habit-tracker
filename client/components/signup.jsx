import React from 'react';

class SignUp extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      userName: '',
      email: '',
      userPwd: '',
      confirmPassword: '',
      duplicateUsername: false

    };
    this.userNameChange = this.userNameChange.bind(this);
    this.emailChange = this.emailChange.bind(this);
    this.passwordChange = this.passwordChange.bind(this);
    this.confirmPasswordChange = this.confirmPasswordChange.bind(this);
    this.createAccount = this.createAccount.bind(this);
  }

  userNameChange(event) {
    this.setState({ userName: event.target.value });
  }

  emailChange(event) {
    this.setState({ email: event.target.value });

  }

  passwordChange(event) {
    this.setState({ userPwd: event.target.value });

  }

  confirmPasswordChange(event) {
    this.setState({ confirmPassword: event.target.value });

  }

  createAccount() {
    event.preventDefault();
    if (this.state.userPwd !== this.state.confirmPassword) {
      return;
    }
    const newObj = { ...this.state };
    fetch('/api/auth/signup', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(newObj)
    })
      .then(response => {
        return response.json();
      })
      .then(myJson => {
        if (myJson === 'Username exists' || myJson.error === 'an unexpected error occurred') {
          this.setState(previousState => ({ duplicateUsername: true }));
        } else {
          this.props.signIn();
        }
      });
  }

  isUserNameValid() {
    if (this.state.duplicateUsername) {
      return (
        <div className="invalid-feedback showError">
          Your Username You Selected Was Taken or has Empty Fields
        </div>
      );
    }
  }

  render() {
    return (
      <div className="d-flex flex-column  align-items-center ">
        <h1>Create Account</h1>
        <form onSubmit={this.createAccount}>
          <input onChange={this.userNameChange} className="form-control" placeholder="Username" />
          {this.isUserNameValid()}
          <input onChange={this.emailChange} className="form-control mt-4 mb-4" placeholder="Email" />
          <input type="password" name="password" autoComplete="on" onChange={this.passwordChange} className="form-control mb-4" placeholder="Password" />
          <input type="password" name="password" autoComplete="on" onChange={this.confirmPasswordChange} className="form-control mb-4" placeholder="Confirm Password" />
          <button className="btn btn-primary">Submit</button>
        </form>
      </div>
    );
  }
}

export default SignUp;
