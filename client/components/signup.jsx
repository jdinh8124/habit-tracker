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
      <div className="d-flex flex-column  align-items-center h-100 justify-content-center ">
        <h1 className="purple-font">Create Account</h1>
        <form className="d-flex align-items-center flex-column" onSubmit={this.createAccount}>

          <div className="input-group flex-nowrap mb-3 signup-input">
            <div className="input-group-prepend">
              <span className="input-group-text" id="addon-wrapping"><i className="fas fa-user"></i></span>
            </div>
            <input onChange={this.userNameChange} className="form-control" placeholder="Username" />
          </div>

          {this.isUserNameValid()}
          <div className="input-group flex-nowrap mb-3 signup-input">
            <div className="input-group-prepend">
              <span className="input-group-text" id="addon-wrapping"><i className="fas fa-envelope"></i></span>
            </div>
            <input onChange={this.emailChange} className="form-control" placeholder="Email" />
          </div>

          <div className="input-group flex-nowrap mb-3 signup-input">
            <div className="input-group-prepend">
              <span className="input-group-text" id="addon-wrapping"><i className="fas fa-lock"></i></span>
            </div>
            <input type="password" name="password" autoComplete="on" onChange={this.passwordChange} className="form-control" placeholder="Password" />
          </div>

          <div className="input-group flex-nowrap mb-3 signup-input">
            <div className="input-group-prepend">
              <span className="input-group-text" id="addon-wrapping"><i className="fas fa-lock"></i></span>
            </div>
            <input type="password" name="password" autoComplete="on" onChange={this.confirmPasswordChange} className="form-control" placeholder="Confirm Password" />
          </div>

          <button className="btn text-light blue-purple-gradient">Submit</button>
        </form>
      </div>
    );
  }
}

export default SignUp;
